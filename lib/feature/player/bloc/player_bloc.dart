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
        super(PlayerInitial(
            sheet: sheet, bpm: 170, isMetronome: false, controlOpacity: 0.0)) {
    on<PlayerEventLoadPage>(_onPlayerLoadPage);
    on<PlayerEventStop>(_onPlayerStop);
    on<PlayerEventStart>(_onPlayerStart);
    on<PlayerEventRunComplete>(_onPlayerRunComplete);
    on<PlayerEventTabView>(_onPlayerTabView);
    on<PlayerEventSetMetronome>(_onPlayerSetMetronome);
    on<PlayerEventSetBpm>(_onPlayerSetBpm);
  }

  final SheetRepository _sheetRepository;

  void _onPlayerLoadPage(
    PlayerEventLoadPage event,
    Emitter<PlayerState> emit,
  ) async {
    event.screenArg.isAsset
        ? await _sheetRepository
            .loadSheetMusic(assetName: event.screenArg.path)
            .then((imageList) {
            event.screenArg.sheet.pages.forEachIndexed((i, page) {
              page.sheetImage = imageList[i];
            });

            emit(
              PlayerStandBy.fromState(
                state.copyWith(sheet: event.screenArg.sheet),
              ),
            );
          })
        : await _sheetRepository
            .loadSheetMusic(path: event.screenArg.path)
            .then((imageList) {
            event.screenArg.sheet.pages.forEachIndexed((i, page) {
              page.sheetImage = imageList[i];
            });

            emit(
              PlayerStandBy.fromState(
                state.copyWith(sheet: event.screenArg.sheet),
              ),
            );
          });
  }

  void _onPlayerStop(
    PlayerEventStop event,
    Emitter<PlayerState> emit,
  ) {
    emit(PlayerStandBy.fromState(state));
  }

  void _onPlayerStart(
    PlayerEventStart event,
    Emitter<PlayerState> emit,
  ) {
    emit(PlayerRunning.fromState(state));
  }

  void _onPlayerRunComplete(
    PlayerEventRunComplete event,
    Emitter<PlayerState> emit,
  ) {
    emit(PlayerRunComplete.fromState(state));
  }

  void _onPlayerTabView(
    PlayerEventTabView event,
    Emitter<PlayerState> emit,
  ) async {
    emit(state.copyWith(controlOpacity: 1.0));
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(controlOpacity: 0.0));
  }

  void _onPlayerSetMetronome(
    PlayerEventSetMetronome event,
    Emitter<PlayerState> emit,
  ) {
    emit(state.copyWith(isMetronome: event.isMetronome));
  }

  void _onPlayerSetBpm(
    PlayerEventSetBpm event,
    Emitter<PlayerState> emit,
  ) {
    emit(state.copyWith(bpm: event.bpm));
  }
}
