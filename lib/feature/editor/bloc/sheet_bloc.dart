import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'sheet_event.dart';
part 'sheet_state.dart';

class SheetBloc extends Bloc<SheetEvent, SheetState> {
  SheetBloc() : super(SheetInitial()) {
    on<SheetEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
