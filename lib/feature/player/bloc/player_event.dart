part of 'player_bloc.dart';

abstract class PlayerEvent {
  const PlayerEvent();
}

final class PlayerLoadPage extends PlayerEvent {
  const PlayerLoadPage({required this.screenArg});
  final PlayerScreenArg screenArg;
}

final class PlayerStop extends PlayerEvent {
  const PlayerStop();
}

final class PlayerStart extends PlayerEvent {
  const PlayerStart({required this.bpm});
  final int bpm;
}

class PlayerScreenArg {
  final String path;
  final TempoSheet sheet;
  final bool isAsset;

  PlayerScreenArg({required this.path, required this.isAsset, required this.sheet});
}