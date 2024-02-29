import 'package:bpm_turner/data/repository/sheet_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/progress_line.dart';
import '../../../data/sample/rach_op17.dart';
import '../bloc/player_bloc.dart';

const Duration controlDuration = Duration(milliseconds: 3000);
const double iconSize = 40;
const int defaultCountDown = 3;

class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlayerBloc(
        sheet: tarantella,
        sheetRepository: RepositoryProvider.of<SheetRepository>(context),
      ),
      child: const PlayerView(),
    );
  }
}

class PlayerView extends StatelessWidget {
  const PlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: BlocBuilder<PlayerBloc, PlayerState>(
                  builder: (context, state) {
                    if (state is PlayerInitial) {
                      context.read<PlayerBloc>().add(
                            PlayerEventLoadPage(
                              screenArg: PlayerScreenArg(
                                path: "assets/rach-tarantella.pdf",
                                sheet: tarantella,
                                isAsset: true,
                              ),
                            ),
                          );
                      return const ProgressLoading();
                    } else {
                      return const SheetView();
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SheetView extends StatefulWidget {
  const SheetView({super.key});

  @override
  State createState() {
    return _SheetViewState();
  }
}

class _SheetViewState extends State<SheetView> with TickerProviderStateMixin {
  final sheetImageKey = GlobalKey();
  late final Ticker ticker;

  @override
  void initState() {
    super.initState();

    context.read<PlayerBloc>().supplyTicker(this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        final colors = Theme.of(context).colorScheme;
        var playerBloc = context.read<PlayerBloc>();

        return SafeArea(
          child: Stack(
            children: <Widget>[
              GestureDetector(
                onTap: () => playerBloc.add(const PlayerEventTabView()),
                behavior: HitTestBehavior.translucent,
                onHorizontalDragEnd: (dragEndDetails) {
                  var velocity = dragEndDetails.primaryVelocity ?? 0;
                  if (velocity < 0) {
                    playerBloc.add(PlayerEventChangePage(
                        pageIndex: state.sheet.pageIndex + 1));
                  } else if (velocity > 0) {
                    playerBloc.add(PlayerEventChangePage(
                        pageIndex: state.sheet.pageIndex - 1));
                  }
                },
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: RawImage(
                    key: sheetImageKey,
                    image: state.sheet.currentPage.sheetImage,
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: state.controlOpacity,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                        color: colors.secondaryContainer,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () => playerBloc
                                    .add(PlayerEventSetBpm(bpm: state.bpm - 5)),
                                iconSize: iconSize,
                                color: colors.onSecondaryContainer,
                                icon: const Icon(Icons.remove)),
                            Text(
                              state.bpm.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: colors.onSecondaryContainer,
                              ),
                            ),
                            IconButton(
                                onPressed: () => playerBloc
                                    .add(PlayerEventSetBpm(bpm: state.bpm + 5)),
                                iconSize: iconSize,
                                color: colors.onSecondaryContainer,
                                icon: const Icon(Icons.add)),
                            IconButton(
                              iconSize: iconSize,
                              color: colors.onSecondaryContainer,
                              icon: Icon(
                                state is PlayerRunning
                                    ? Icons.pause
                                    : Icons.play_arrow,
                              ),
                              onPressed: state is PlayerRunning
                                  ? () =>
                                      playerBloc.add(const PlayerEventPause())
                                  : () => playerBloc.add(
                                      const PlayerEventStart(countDown: 3)),
                            ),
                            IconButton(
                              iconSize: iconSize,
                              color: colors.onSecondaryContainer,
                              icon: const Icon(Icons.stop),
                              onPressed: () =>
                                  playerBloc.add(const PlayerEventStop()),
                            ),
                            IconButton(
                              iconSize: iconSize,
                              color: colors.onSecondaryContainer,
                              icon: Icon(state.isMetronome
                                  ? Icons.volume_up
                                  : Icons.volume_off),
                              onPressed: () => playerBloc.add(
                                PlayerEventSetMetronome(
                                  isMetronome: !state.isMetronome,
                                ),
                              ),
                            ),
                          ],
                        ))),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: state.controlOpacity,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        color: colors.secondaryContainer,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  /*Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditorRoute(
                                        sheetImages: sheetImages,
                                      ),
                                    ),
                                  );*/
                                },
                                iconSize: iconSize,
                                color: colors.onSecondaryContainer,
                                icon: const Icon(Icons.edit_note)),
                            IconButton(
                                onPressed: () {},
                                iconSize: iconSize,
                                color: colors.onSecondaryContainer,
                                icon: const Icon(Icons.file_open))
                          ],
                        ))),
              ),
              if (state is PlayerCountDown)
                CountDown(countDown: state.countDown),
              BlocBuilder<PlayerBloc, PlayerState>(
                builder: (context, state) {
                  if(state is! PlayerRunning) {
                    return const SizedBox.shrink();
                  }

                  return ProgressLineWidget(
                    progressLine: state.progressLine,
                  );
                },
                buildWhen: (previous, current) {
                  return current is PlayerRunning;
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class ProgressLoading extends StatelessWidget {
  const ProgressLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              strokeWidth: 10,
              backgroundColor: Colors.black,
              color: Colors.blue,
            ),
            Center(
                child: Text(
              'Loading file...',
              style: TextStyle(fontSize: 20),
            )),
          ],
        ),
      ),
    );
  }
}

class CountDown extends StatelessWidget {
  const CountDown({super.key, required this.countDown});

  final int countDown;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "$countDown",
        style: const TextStyle(
            fontSize: 72, fontWeight: FontWeight.bold, color: Colors.red),
      ),
    );
  }
}

class ProgressLineWidget extends StatelessWidget {
  const ProgressLineWidget({super.key, required this.progressLine});

  final ProgressLine progressLine;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: progressLine.left.toDouble(),
      top: progressLine.top.toDouble(),
      child: const VerticalDivider(
        color: Colors.red,
      ),
    );
  }
}
