import 'package:bloc/bloc.dart';
import 'package:bpm_turner/data/model/sheet_line.dart';
import 'package:bpm_turner/data/model/sheet_page.dart';
import 'package:bpm_turner/data/model/tempo_sheet.dart';
import 'package:bpm_turner/data/repository/sheet_repository.dart';
import 'package:bpm_turner/feature/editor/bloc/editor_mode.dart';
import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../data/model/bar_divider.dart';
import '../../../data/model/sheet_bar.dart';

part 'editor_event.dart';
part 'editor_state.dart';

class EditorBloc extends Bloc<EditorEvent, EditorState> {
  EditorBloc({
    required SheetRepository sheetRepository,
  })  : _sheetRepository = sheetRepository,
        super(EditorStateInitial()) {
    on<EditorEventLoad>(_onEditorEventLoad);
    on<EditorEventStartDrag>(_onEditorEventStartDrag);
    on<EditorEventDrag>(_onEditorEventDrag);
    on<EditorEventEndDrag>(_onEditorEventEndDrag);
    on<EditorEventPageForward>(_onEditorEventPageForward);
    on<EditorEventPageBackward>(_onEditorEventPageBackward);
    on<EditorEventDelete>(_onEditorEventDelete);
    on<EditorEventModeLine>(_onEditorEventModeLine);
    on<EditorEventModeBar>(_onEditorEventModeBar);
  }

  DrawMode _drawMode = DrawMode.line;
  final SheetRepository _sheetRepository;

  SheetLine? _findCurrentLine(Offset position) {
    for (var line in state.lines) {
      var rect = line.rect;
      if (rect.left <= position.dx && rect.right >= position.dx && rect.top <= position.dy && rect.bottom >= position.dy) {
        return line;
      }
    }
    return null;
  }

  void _onEditorEventLoad(EditorEventLoad event, Emitter<EditorState> emit) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      var file = result.files.single;
      var sheetImages = await _sheetRepository.loadSheetMusic(path: file.path, size: event.screenSize);
      var pages = sheetImages.map((e) => MusicPage(0, [], sheetImage: e));

      emit(EditorStateLoaded(
        sheet: TempoSheet("Editing sheet", pages: pages.toList()),
        lines: [],
        drawMode: DrawMode.line,
      ));
    }
  }

  void _onEditorEventStartDrag(EditorEventStartDrag event, Emitter<EditorState> emit) {
    if (_drawMode == DrawMode.line) {
      emit(
        EditorStateRects(
          sheet: state.sheet,
          lines: state.lines +
              [
                SheetLine(
                  rect: Rect.fromLTRB(event.position.dx, event.position.dy, event.position.dx, event.position.dy),
                  barDividers: [],
                ),
              ],
          drawMode: state.drawMode,
        ),
      );
    } else {
      // Bar mode
      // Are we in the Line?
      SheetLine? line = _findCurrentLine(event.position);
      if (line == null) return;

      // We are in the line. Draw it!
      state.lines.last = SheetLine(
        rect: state.lines.last.rect,
        barDividers: state.lines.last.barDividers +
            [BarDivider(top: Offset(event.position.dx, line.rect.top), bottom: Offset(event.position.dx, line.rect.bottom))],
      );
      emit(EditorStateRects(
        sheet: state.sheet,
        lines: state.lines,
        drawMode: state.drawMode,
      ));
    }
  }

  void _onEditorEventDrag(EditorEventDrag event, Emitter<EditorState> emit) {
    if (_drawMode == DrawMode.line) {
      Rect currentRect = state.lines.last.rect;
      state.lines.last = SheetLine(rect: Rect.fromLTRB(currentRect.left, currentRect.top, event.position.dx, event.position.dy), barDividers: []);
      emit(
        EditorStateRects(
          sheet: state.sheet,
          lines: state.lines,
          drawMode: state.drawMode,
        ),
      );
    } else {
      SheetLine? line = _findCurrentLine(event.position);
      if (line == null) return;

      state.lines.last.barDividers.last = BarDivider(
        top: Offset(event.position.dx, line.rect.top),
        bottom: Offset(event.position.dx, line.rect.bottom),
      );

      emit(
        EditorStateRects(
          sheet: state.sheet,
          lines: state.lines,
          drawMode: state.drawMode,
        ),
      );
    }
  }

  void _onEditorEventEndDrag(EditorEventEndDrag event, Emitter<EditorState> emit) {
    _saveSheet(event.screenSize);
  }

  void _onEditorEventDelete(EditorEventDelete event, Emitter<EditorState> emit) {
    emit(
      EditorStateRects(
        sheet: state.sheet,
        lines: [],
        drawMode: state.drawMode,
      ),
    );
  }

  void _onEditorEventPageForward(EditorEventPageForward event, Emitter<EditorState> emit) {
    if (state.sheet == null) return;

    if (state.sheet!.pageIndex < state.sheet!.pages.length - 1) {
      emit(EditorStateLoaded(
        sheet: state.sheet!.copyWith(pageIndex: state.sheet!.pageIndex + 1),
        lines: state.lines,
        drawMode: state.drawMode,
      ));
    }
  }

  void _onEditorEventPageBackward(EditorEventPageBackward event, Emitter<EditorState> emit) {
    if (state.sheet == null) return;

    if (state.sheet!.pageIndex > 0) {
      emit(EditorStateLoaded(
        sheet: state.sheet!.copyWith(pageIndex: state.sheet!.pageIndex - 1),
        lines: state.lines,
        drawMode: state.drawMode,
      ));
    }
  }

  void _onEditorEventModeLine(EditorEventModeLine event, Emitter<EditorState> emit) {
    _drawMode = DrawMode.line;
  }

  void _onEditorEventModeBar(EditorEventModeBar event, Emitter<EditorState> emit) {
    _drawMode = DrawMode.bar;
  }

  void _saveSheet(Size screenSize) {
    if (state.sheet == null) return;

    // Create bar Rect from Line and BarDividers.
    List<Bar> bars = [];
    state.lines.sort((a, b) => a.rect.top.compareTo(b.rect.top));
    for (var line in state.lines) {
      line.barDividers.sort((a, b) => a.top.dx.compareTo(b.top.dx));
      line.barDividers.forEachIndexed((index, divider) {
        var left = index == 0 ? line.rect.left : line.barDividers[index - 1].top.dx;
        var right = index == line.barDividers.length - 1 ? line.rect.right : line.barDividers[index + 1].top.dx;
        var rectInPercent =
            Rect.fromLTRB(left / screenSize.width, line.rect.top / screenSize.height, right / screenSize.width, line.rect.bottom / screenSize.height);

        bars.add(Bar(barRectInPercent: rectInPercent));
      });
    }

    state.sheet?.currentPage.bars.clear();
    state.sheet?.currentPage.bars.addAll(bars);

    // TODO - avoid duplicate insert.
    _sheetRepository.insertSheet(state.sheet!);
  }
}
