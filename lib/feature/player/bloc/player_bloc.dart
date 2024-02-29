import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bpm_turner/api/sheet_runner.dart';
import 'package:bpm_turner/data/model/progress_line.dart';
import 'package:bpm_turner/data/model/tempo_sheet.dart';
import 'package:bpm_turner/data/repository/sheet_repository.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/scheduler.dart';

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
    on<PlayerEventChangePage>(_onPlayerChangePage);
  }

  late TickerProvider _tickerProvider;
  late Ticker _ticker;
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
  ) async {
    // Count down and emit PlayerRunning.
    for (int i = event.countDown; i > 0; i--) {
      emit(PlayerCountDown.fromState(state, i));
      await Future.delayed(const Duration(seconds: 1));
    }
    emit(PlayerRunning.fromState(state, ProgressLine.initial()));

    SheetRunner sheetRunner = SheetRunner(
      sheet: state.sheet,
      bpm: state.bpm,
      isMetronome: state.isMetronome,
    );

    _ticker = _tickerProvider.createTicker((elapsed) {
      var runnerState = sheetRunner.onTick(elapsed);
      if (runnerState.shouldTurnPage) {
        emit(state);
      }
      if (runnerState.isEnd) {
        emit(PlayerRunComplete.fromState(state));
        return;
      }

      emit(
        PlayerRunning.fromState(state, runnerState.progressLine),
      );
    })
      ..start();
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

  void _onPlayerChangePage(
    PlayerEventChangePage event,
    Emitter<PlayerState> emit,
  ) {
    // Check page index validation.
    if (event.pageIndex < 0 || event.pageIndex >= state.sheet.pages.length) {
      return;
    }

    emit(state.copyWith(
        sheet: state.sheet.copyWith(pageIndex: event.pageIndex)));
  }

  void supplyTicker(TickerProvider tickerProvider) {
    _tickerProvider = tickerProvider;
  }
}
