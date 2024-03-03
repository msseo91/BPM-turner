part of 'player_bloc.dart';

abstract class PlayerEvent {
  const PlayerEvent();
}

final class PlayerEventLoadPage extends PlayerEvent {
  const PlayerEventLoadPage({required this.screenArg});
  final PlayerScreenArg screenArg;
}

final class PlayerEventStop extends PlayerEvent {
  const PlayerEventStop();
}

final class PlayerEventStart extends PlayerEvent {
  const PlayerEventStart({required this.countDown, required this.size});
  final int countDown;
  final Size size;
}

final class PlayerEventPause extends PlayerEvent {
  const PlayerEventPause();
}

final class PlayerEventRunComplete extends PlayerEvent {
  const PlayerEventRunComplete();
}

final class PlayerEventTabView extends PlayerEvent {
  const PlayerEventTabView();
}

final class PlayerEventSetMetronome extends PlayerEvent {
  const PlayerEventSetMetronome({required this.isMetronome});
  final bool isMetronome;
}

final class PlayerEventSetBpm extends PlayerEvent {
  const PlayerEventSetBpm({required this.bpm});
  final int bpm;
}

final class PlayerEventChangePage extends PlayerEvent {
  const PlayerEventChangePage({required this.pageIndex});
  final int pageIndex;
}


class PlayerScreenArg {
  final String path;
  final TempoSheet sheet;
  final bool isAsset;

  PlayerScreenArg({required this.path, required this.isAsset, required this.sheet});
}