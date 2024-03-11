import 'dart:async';

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
    on<EditorEventChangePage>(_onEditorEventChangePage);
  }

  final SheetRepository _sheetRepository;

  void _onEditorEventLoad(EditorEventLoad event, Emitter<EditorState> emit) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      var file = result.files.single;
      var sheetImages = await _sheetRepository.loadSheetMusic(path: file.path);
      var pages = sheetImages.map((e) => MusicPage(0, []));

      emit(EditorStateLoaded(sheet: TempoSheet("Editing sheet", pages: pages.toList()), rects: []));
    }
  }

  void _onEditorEventStartDrag(EditorEventStartDrag event, Emitter<EditorState> emit) {

  }

  void _onEditorEventDrag(EditorEventDrag event, Emitter<EditorState> emit) {

  }

  void _onEditorEventEndDrag(EditorEventEndDrag event, Emitter<EditorState> emit) {

  }

  void _onEditorEventChangePage(EditorEventChangePage event, Emitter<EditorState> emit) {

  }

}
