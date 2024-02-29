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
}

final class PlayerInitial extends PlayerState {
  const PlayerInitial({
    required super.sheet,
    required super.bpm,
    required super.isMetronome,
    required super.controlOpacity,
  });

  @override
  List<Object?> get props => [sheet, bpm, isMetronome, controlOpacity];
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

  @override
  List<Object?> get props => [sheet, bpm, isMetronome, controlOpacity];
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

  @override
  List<Object?> get props =>
      [sheet, bpm, isMetronome, controlOpacity, countDown];
}

final class PlayerRunning extends PlayerState {
  const PlayerRunning({
    required super.sheet,
    required super.bpm,
    required super.isMetronome,
    required super.controlOpacity,
    required this.progressLine,
  });

  final ProgressLine progressLine;

  PlayerRunning.fromState(PlayerState state, ProgressLine progressLine)
      : this(
          sheet: state.sheet,
          bpm: state.bpm,
          isMetronome: state.isMetronome,
          controlOpacity: state.controlOpacity,
          progressLine: progressLine,
        );

  @override
  List<Object?> get props =>
      [sheet, bpm, isMetronome, controlOpacity, progressLine];
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

  @override
  List<Object?> get props => [sheet, bpm, isMetronome, controlOpacity];
}

extension on PlayerRunning {
  PlayerRunning copyWith({
    TempoSheet? sheet,
    int? bpm,
    bool? isMetronome,
    double? controlOpacity,
    ProgressLine? progressLine,
  }) {
    return PlayerRunning(
      sheet: sheet ?? this.sheet,
      bpm: bpm ?? this.bpm,
      isMetronome: isMetronome ?? this.isMetronome,
      controlOpacity: controlOpacity ?? this.controlOpacity,
      progressLine: progressLine ?? this.progressLine,
    );
  }
}

extension on PlayerState {
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
      case PlayerRunning:
        return PlayerRunning(
          sheet: sheet ?? this.sheet,
          bpm: bpm ?? this.bpm,
          isMetronome: isMetronome ?? this.isMetronome,
          controlOpacity: controlOpacity ?? this.controlOpacity,
          progressLine: (this as PlayerRunning).progressLine,
        );
      default:
        throw StateError('Unknown state: $runtimeType');
    }
  }
}
