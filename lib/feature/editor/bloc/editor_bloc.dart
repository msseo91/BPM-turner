import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bpm_turner/data/model/tempo_sheet.dart';
import 'package:flutter/material.dart';

part 'editor_event.dart';
part 'editor_state.dart';

class EditorBloc extends Bloc<EditorEvent, EditorState> {
  EditorBloc() : super(EditorStateInitial()) {
    on<EditorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
