part of 'player_bloc.dart';

sealed class PlayerState extends Equatable {
  const PlayerState(this.sheet);
  final TempoSheet sheet;

  @override
  List<Object> get props => [sheet];
}

final class PlayerInitial extends PlayerState {
  const PlayerInitial(super.sheet);
}

final class PlayerRunning extends PlayerState {
  const PlayerRunning(super.sheet);
}

final class PlayerRunComplete extends PlayerState {
  const PlayerRunComplete(super.sheet);
}