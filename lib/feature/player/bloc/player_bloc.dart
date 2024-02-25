import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:bpm_turner/data/model/tempo_sheet.dart';
import 'package:bpm_turner/data/repository/sheet_repository.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:bpm_turner/data/sample/rach_op17.dart';

import '../../../global.dart';

part 'player_event.dart';

part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc({
    required TempoSheet sheet,
    required SheetRepository sheetRepository,
  })  : _sheetRepository = sheetRepository,
        super(PlayerInitial(sheet)) {
    on<PlayerLoadPage>(_onPlayerLoadPage);
    on<PlayerStop>(_onPlayerStop);
    on<PlayerStart>(_onPlayerStart);
  }

  final SheetRepository _sheetRepository;

  void _onPlayerLoadPage(
    PlayerLoadPage event,
    Emitter<PlayerState> emit,
  ) {
    _sheetRepository
        .loadSheetMusic(assetName: "rach-tarantella.pdf")
        .then((imageList) {
      tarantella.pages.forEachIndexed((i, page) {
        page.sheetImage = imageList[i];
      });

      emit(PlayerSheetLoaded(tarantella));
    });
  }

  void _onPlayerStop(
    PlayerStop event,
    Emitter<PlayerState> emit,
  ) {}

  void _onPlayerStart(
    PlayerStart event,
    Emitter<PlayerState> emit,
  ) {}
}
