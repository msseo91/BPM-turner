import 'package:bpm_turner/data/repository/sheet_repository.dart';
import 'package:bpm_turner/feature/editor/editor.dart';
import 'package:bpm_turner/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bpm_turner/data/model/progress_line.dart';
import 'package:bpm_turner/data/sample/rach_op17.dart';
import '../../sheet_navigation.dart';
import '../bloc/player_bloc.dart';
import 'package:bpm_turner/utils/tab_utils.dart';

const Duration controlDuration = Duration(milliseconds: 3000);
const double iconSize = 40;
const int defaultCountDown = 3;
int tapCount = 0;
double prevX = 0;
double prevY = 0;

class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlayerBloc(
        sheet: tarantella,
        sheetRepository: RepositoryProvider.of<SheetRepository>(context),
      ),
      child: const SheetView(),
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
    return Scaffold(
      drawer: const SheetDrawer(),
      body: BlocBuilder<PlayerBloc, PlayerState>(builder: (context, state) {
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
        }

        var playerBloc = context.read<PlayerBloc>();
        return SafeArea(
          child: LayoutBuilder(builder: (builderContext, constraints) {
            return Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () => playerBloc.add(const PlayerEventTabView()),
                  onTapDown: (details) => logger.d("tap: ${details.leftPercent(constraints.biggest)}, ${details.topPercent(constraints.biggest)}"),
                  behavior: HitTestBehavior.translucent,
                  onHorizontalDragEnd: (dragEndDetails) {
                    var velocity = dragEndDetails.primaryVelocity ?? 0;
                    if (velocity < 0) {
                      playerBloc.add(PlayerEventChangePage(pageIndex: state.sheet.pageIndex + 1));
                    } else if (velocity > 0) {
                      playerBloc.add(PlayerEventChangePage(pageIndex: state.sheet.pageIndex - 1));
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
                TopControlMenu(state: state, sheetSize: constraints.biggest),
                if (state is PlayerCountDown) CountDown(countDown: state.countDown),
                if (state is PlayerRunning) ProgressLineWidget(progressLine: state.progressLine),
              ],
            );
          }),
        );
      }),
    );
  }
}

class TopControlMenu extends StatelessWidget {
  const TopControlMenu({super.key, required this.state, required this.sheetSize});

  final PlayerState state;
  final Size sheetSize;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    var playerBloc = context.read<PlayerBloc>();

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 400),
      opacity: state.controlOpacity,
      child: Align(
          alignment: Alignment.topCenter,
          child: Container(
              color: colors.secondaryContainer,
              child: Row(children: [
                IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: const Icon(Icons.menu),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () => playerBloc.add(PlayerEventSetBpm(bpm: state.bpm - 5)),
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
                        onPressed: () => playerBloc.add(PlayerEventSetBpm(bpm: state.bpm + 5)),
                        iconSize: iconSize,
                        color: colors.onSecondaryContainer,
                        icon: const Icon(Icons.add)),
                    IconButton(
                      iconSize: iconSize,
                      color: colors.onSecondaryContainer,
                      icon: Icon(
                        state is PlayerRunning ? Icons.pause : Icons.play_arrow,
                      ),
                      onPressed: state is PlayerRunning
                          ? () => playerBloc.add(const PlayerEventPause())
                          : () =>
                          playerBloc.add(PlayerEventStart(
                            countDown: 3,
                            size: sheetSize,
                          )),
                    ),
                    IconButton(
                      iconSize: iconSize,
                      color: colors.onSecondaryContainer,
                      icon: const Icon(Icons.stop),
                      onPressed: () => playerBloc.add(const PlayerEventStop()),
                    ),
                    IconButton(
                      iconSize: iconSize,
                      color: colors.onSecondaryContainer,
                      icon: Icon(state.isMetronome ? Icons.volume_up : Icons.volume_off),
                      onPressed: () =>
                          playerBloc.add(
                            PlayerEventSetMetronome(
                              isMetronome: !state.isMetronome,
                            ),
                          ),
                    ),
                  ],
                )
              ]))),
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
        style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold, color: Colors.red),
      ),
    );
  }
}

class ProgressLineWidget extends StatelessWidget {
  const ProgressLineWidget({super.key, required this.progressLine});

  final ProgressLine progressLine;

  @override
  Widget build(BuildContext context) {
    // 상위 Stack 에서의 Position 기준이다.
    return Positioned(
      left: progressLine.left,
      top: progressLine.top,
      height: progressLine.height,
      width: 1,
      child: const VerticalDivider(
        color: Colors.red,
        width: 0,
        thickness: 2,
      ),
    );
  }
}
