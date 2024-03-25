import 'package:bloc/bloc.dart';
import 'package:bpm_turner/data/model/sheet_page.dart';
import 'package:bpm_turner/data/model/tempo_sheet.dart';
import 'package:bpm_turner/data/repository/sheet_repository.dart';
import 'package:bpm_turner/feature/editor/bloc/editor_mode.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../data/model/sheet_line.dart';

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

  void _onEditorEventLoad(EditorEventLoad event, Emitter<EditorState> emit) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      var file = result.files.single;
      var sheetImages = await _sheetRepository.loadSheetMusic(path: file.path, size: event.screenSize);
      var pages = sheetImages.map((e) => MusicPage(0, [], sheetImage: e));

      emit(EditorStateLoaded(
        sheet: TempoSheet("Editing sheet", pages: pages.toList()),
        rects: [],
        drawMode: DrawMode.line,
        barDividers: [],
      ));
    }
  }

  void _onEditorEventStartDrag(EditorEventStartDrag event, Emitter<EditorState> emit) {
    if (_drawMode == DrawMode.line) {
      emit(
        EditorStateRects(
          sheet: state.sheet,
          rects: state.rects + [Rect.fromLTRB(event.position.dx, event.position.dy, event.position.dx, event.position.dy)],
          drawMode: state.drawMode,
          barDividers: state.barDividers,
        ),
      );
    } else {
      // Bar mode
      // Are we in the Line?
      Rect? line = _findCurrentLine(event.position);
      if (line == null) return;

      // We are in the line. Draw it!
      emit(EditorStateRects(
          rects: state.rects,
          sheet: state.sheet,
          drawMode: state.drawMode,
          barDividers: state.barDividers + [BarDivider(top: Offset(event.position.dx, line.top), bottom: Offset(event.position.dx, line.bottom))]));
    }
  }

  void _onEditorEventDrag(EditorEventDrag event, Emitter<EditorState> emit) {
    if (_drawMode == DrawMode.line) {
      Rect currentRect = state.rects.last;
      state.rects.last = Rect.fromLTRB(currentRect.left, currentRect.top, event.position.dx, event.position.dy);
      emit(
        EditorStateRects(
          sheet: state.sheet,
          rects: state.rects,
          drawMode: state.drawMode,
          barDividers: state.barDividers,
        ),
      );
    } else {
      Rect? line = _findCurrentLine(event.position);
      if (line == null) return;

      state.barDividers.last = BarDivider(
          top: Offset(event.position.dx, state.barDividers.last.top.dy),
          bottom: Offset(event.position.dx, state.barDividers.last.bottom.dy),
      );
      emit(
        EditorStateRects(
          sheet: state.sheet,
          rects: state.rects,
          drawMode: state.drawMode,
          barDividers: state.barDividers,
        ),
      );
    }
  }

  void _onEditorEventEndDrag(EditorEventEndDrag event, Emitter<EditorState> emit) {}

  void _onEditorEventDelete(EditorEventDelete event, Emitter<EditorState> emit) {
    emit(
      EditorStateRects(
        sheet: state.sheet,
        rects: [],
        drawMode: state.drawMode,
        barDividers: [],
      ),
    );
  }

  void _onEditorEventPageForward(EditorEventPageForward event, Emitter<EditorState> emit) {
    if (state.sheet == null) return;

    if (state.sheet!.pageIndex < state.sheet!.pages.length - 1) {
      emit(EditorStateLoaded(
        sheet: state.sheet!.copyWith(pageIndex: state.sheet!.pageIndex + 1),
        rects: state.rects,
        drawMode: state.drawMode,
        barDividers: state.barDividers,
      ));
    }
  }

  void _onEditorEventPageBackward(EditorEventPageBackward event, Emitter<EditorState> emit) {
    if (state.sheet == null) return;

    if (state.sheet!.pageIndex > 0) {
      emit(EditorStateLoaded(
        sheet: state.sheet!.copyWith(pageIndex: state.sheet!.pageIndex - 1),
        rects: state.rects,
        drawMode: state.drawMode,
        barDividers: state.barDividers,
      ));
    }
  }

  void _onEditorEventModeLine(EditorEventModeLine event, Emitter<EditorState> emit) {
    _drawMode = DrawMode.line;
  }

  void _onEditorEventModeBar(EditorEventModeBar event, Emitter<EditorState> emit) {
    _drawMode = DrawMode.bar;
  }

  void _saveSheet() {
    if (state.sheet == null) return;

    // Sort rects by left-top position.
    state.rects.sort((a, b) => a.top.compareTo(b.top));
  }

  Rect? _findCurrentLine(Offset position) {
    for (var rect in state.rects) {
      if (rect.left <= position.dx && rect.right >= position.dx && rect.top <= position.dy && rect.bottom >= position.dy) {
        return rect;
      }
    }
    return null;
  }
}
