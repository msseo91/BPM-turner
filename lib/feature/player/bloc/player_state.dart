part of 'player_bloc.dart';

sealed class PlayerState extends Equatable {
  const PlayerState({
    required this.sheet,
    required this.bpm,
    required this.isMetronome,
    required this.controlOpacity,
    this.countDown = 0,
  });

  final TempoSheet sheet;
  final int bpm;
  final bool isMetronome;
  final double controlOpacity;
  final int countDown;

  @override
  List<Object> get props =>
      [sheet, bpm, isMetronome, controlOpacity, countDown];
}

final class PlayerInitial extends PlayerState {
  const PlayerInitial({
    required super.sheet,
    required super.bpm,
    required super.isMetronome,
    required super.controlOpacity,
  });
}

final class PlayerStandBy extends PlayerState {
  const PlayerStandBy({
    required super.sheet,
    required super.bpm,
    required super.isMetronome,
    required super.controlOpacity,
  });

  PlayerStandBy.fromState(PlayerState state)
      : super(
          sheet: state.sheet,
          bpm: state.bpm,
          isMetronome: state.isMetronome,
          controlOpacity: state.controlOpacity,
        );
}

final class PlayerCountDown extends PlayerState {
  const PlayerCountDown({
    required super.sheet,
    required super.bpm,
    required super.isMetronome,
    required super.controlOpacity,
    required super.countDown,
  });

  PlayerCountDown.fromState(PlayerState state, int countDown)
      : super(
          sheet: state.sheet,
          bpm: state.bpm,
          isMetronome: state.isMetronome,
          controlOpacity: state.controlOpacity,
          countDown: countDown,
        );
}

final class PlayerRunning extends PlayerState {
  const PlayerRunning({
    required super.sheet,
    required super.bpm,
    required super.isMetronome,
    required super.controlOpacity,
  });

  PlayerRunning.fromState(PlayerState state)
      : super(
          sheet: state.sheet,
          bpm: state.bpm,
          isMetronome: state.isMetronome,
          controlOpacity: state.controlOpacity,
        );
}

final class PlayerRunComplete extends PlayerState {
  const PlayerRunComplete({
    required super.sheet,
    required super.bpm,
    required super.isMetronome,
    required super.controlOpacity,
  });

  PlayerRunComplete.fromState(PlayerState state)
      : super(
          sheet: state.sheet,
          bpm: state.bpm,
          isMetronome: state.isMetronome,
          controlOpacity: state.controlOpacity,
        );
}

extension Copy on PlayerState {
  PlayerState copyWith({
    TempoSheet? sheet,
    int? bpm,
    bool? isMetronome,
    double? controlOpacity,
    int? countDown,
  }) {
    switch (runtimeType) {
      case PlayerInitial:
        return PlayerInitial(
          sheet: sheet ?? this.sheet,
          bpm: bpm ?? this.bpm,
          isMetronome: isMetronome ?? this.isMetronome,
          controlOpacity: controlOpacity ?? this.controlOpacity,
        );
      case PlayerStandBy:
        return PlayerStandBy(
          sheet: sheet ?? this.sheet,
          bpm: bpm ?? this.bpm,
          isMetronome: isMetronome ?? this.isMetronome,
          controlOpacity: controlOpacity ?? this.controlOpacity,
        );
      case PlayerRunning:
        return PlayerRunning(
          sheet: sheet ?? this.sheet,
          bpm: bpm ?? this.bpm,
          isMetronome: isMetronome ?? this.isMetronome,
          controlOpacity: controlOpacity ?? this.controlOpacity,
        );
      case PlayerRunComplete:
        return PlayerRunComplete(
          sheet: sheet ?? this.sheet,
          bpm: bpm ?? this.bpm,
          isMetronome: isMetronome ?? this.isMetronome,
          controlOpacity: controlOpacity ?? this.controlOpacity,
        );
      case PlayerCountDown:
        return PlayerCountDown(
          sheet: sheet ?? this.sheet,
          bpm: bpm ?? this.bpm,
          isMetronome: isMetronome ?? this.isMetronome,
          controlOpacity: controlOpacity ?? this.controlOpacity,
          countDown: countDown ?? (this as PlayerCountDown).countDown,
        );
      default:
        throw StateError('Unknown state: $runtimeType');
    }
  }
}
