import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:bpm_turner/data/model/sheet_page.dart';
import 'package:bpm_turner/data/model/tempo_sheet.dart';
import 'package:bpm_turner/data/repository/sheet_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

part 'editor_event.dart';
part 'editor_state.dart';

class EditorBloc extends Bloc<EditorEvent, EditorState> {
  EditorBloc({
    required SheetRepository sheetRepository,
}) : _sheetRepository = sheetRepository, super(EditorStateInitial()) {
    on<EditorEventLoad>(_onEditorEventLoad);
    on<EditorEventStartDrag>(_onEditorEventStartDrag);
    on<EditorEventDrag>(_onEditorEventDrag);
    on<EditorEventEndDrag>(_onEditorEventEndDrag);
    on<EditorEventPageForward>(_onEditorEventPageForward);
    on<EditorEventPageBackward>(_onEditorEventPageBackward);
    on<EditorEventDelete>(_onEditorEventDelete);
  }

  final SheetRepository _sheetRepository;

  void _onEditorEventLoad(EditorEventLoad event, Emitter<EditorState> emit) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      var file = result.files.single;
      var sheetImages = await _sheetRepository.loadSheetMusic(path: file.path, size: event.screenSize);
      var pages = sheetImages.map((e) => MusicPage(0, [], sheetImage: e));

      emit(EditorStateLoaded(sheet: TempoSheet("Editing sheet", pages: pages.toList()), rects: []));
    }
  }

  void _onEditorEventStartDrag(EditorEventStartDrag event, Emitter<EditorState> emit) {
    emit(
      EditorStateRects(
        sheet: state.sheet,
        rects: state.rects + [Rect.fromLTRB(event.position.dx, event.position.dy, event.position.dx, event.position.dy)],
      ),
    );
  }

  void _onEditorEventDrag(EditorEventDrag event, Emitter<EditorState> emit) {
    Rect currentRect = state.rects.last;
    state.rects.last = Rect.fromLTRB(currentRect.left, currentRect.top, event.position.dx, event.position.dy);
    emit(
      EditorStateRects(
        sheet: state.sheet,
        rects: state.rects,
      ),
    );
  }

  void _onEditorEventEndDrag(EditorEventEndDrag event, Emitter<EditorState> emit) {

  }

  void _onEditorEventDelete(EditorEventDelete event, Emitter<EditorState> emit) {
    emit(
      EditorStateRects(
        sheet: state.sheet,
        rects: [],
      ),
    );
  }

  void _onEditorEventPageForward(EditorEventPageForward event, Emitter<EditorState> emit) {
    if(state.sheet == null) return;

    if(state.sheet!.pageIndex < state.sheet!.pages.length - 1) {
      emit(EditorStateLoaded(sheet: state.sheet!.copyWith(pageIndex: state.sheet!.pageIndex + 1), rects: state.rects));
    }
  }

  void _onEditorEventPageBackward(EditorEventPageBackward event, Emitter<EditorState> emit) {
    if(state.sheet == null) return;

    if(state.sheet!.pageIndex > 0) {
      emit(EditorStateLoaded(sheet: state.sheet!.copyWith(pageIndex: state.sheet!.pageIndex - 1), rects: state.rects));
    }
  }

}
