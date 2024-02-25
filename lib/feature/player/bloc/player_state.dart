part of 'player_bloc.dart';

sealed class PlayerState extends Equatable {
  const PlayerState({
    required this.sheet,
    required this.bpm,
    required this.isMetronome,
    required this.controlOpacity,
  });

  final TempoSheet sheet;
  final int bpm;
  final bool isMetronome;
  final double controlOpacity;

  @override
  List<Object> get props => [sheet, bpm, isMetronome, controlOpacity];
}

final class PlayerInitial extends PlayerState {
  const PlayerInitial({
    required super.sheet,
    required super.bpm,
    required super.isMetronome,
    required super.controlOpacity,
  });
}

final class PlayerSheetLoaded extends PlayerState {
  const PlayerSheetLoaded({
    required super.sheet,
    required super.bpm,
    required super.isMetronome,
    required super.controlOpacity,
  });

  PlayerSheetLoaded.fromState(PlayerState state) : super(
    sheet: state.sheet,
    bpm: state.bpm,
    isMetronome: state.isMetronome,
    controlOpacity: state.controlOpacity,
  );
}

final class PlayerRunning extends PlayerState {
  const PlayerRunning({
    required super.sheet,
    required super.bpm,
    required super.isMetronome,
    required super.controlOpacity,
  });
}

final class PlayerRunComplete extends PlayerState {
  const PlayerRunComplete({
    required super.sheet,
    required super.bpm,
    required super.isMetronome,
    required super.controlOpacity,
  });
}

extension Copy on PlayerState {
  PlayerState copyWith({
    TempoSheet? sheet,
    int? bpm,
    bool? isMetronome,
    double? controlOpacity,
  }) {
    switch(runtimeType) {
      case PlayerInitial:
        return PlayerInitial(
          sheet: sheet ?? this.sheet,
          bpm: bpm ?? this.bpm,
          isMetronome: isMetronome ?? this.isMetronome,
          controlOpacity: controlOpacity ?? this.controlOpacity,
        );
      case PlayerSheetLoaded:
        return PlayerSheetLoaded(
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
      default:
        throw StateError('Unknown state: $runtimeType');
    }
  }
}
