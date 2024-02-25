import 'package:bpm_turner/data/repository/sheet_repository.dart';
import 'package:bpm_turner/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

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
                    } else if (state is PlayerSheetLoaded) {
                      return SheetView();
                    } else {
                      return const Text('Error');
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

class SheetView extends StatelessWidget {
  SheetView({super.key});

  final sheetImageKey = GlobalKey();

  void onScreenTab() {
    logger.d("tap!");
  }

  void nextPage() {
    logger.d("nextPage");
  }

  void prevPage() {
    logger.d("prevPage");
  }

  void pause() {
    logger.d("pause");
  }

  void stop() {
    logger.d("stop");
  }

  void showPickFile() {
    logger.d("showPickFile");
  }

  void startWithCountDown(BuildContext context, int countDown) {
    logger.d("startWithCountDown");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        final colors = Theme.of(context).colorScheme;
        const iconSize = 40.0;
        var playerBloc = context.read<PlayerBloc>();

        return SafeArea(
          child: Stack(
            children: <Widget>[
              GestureDetector(
                onTap: onScreenTab,
                behavior: HitTestBehavior.translucent,
                onHorizontalDragEnd: (dragEndDetails) {
                  var velocity = dragEndDetails.primaryVelocity ?? 0;
                  if (velocity < 0) {
                    nextPage();
                  } else if (velocity > 0) {
                    prevPage();
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
                                  ? pause
                                  : () => startWithCountDown(
                                      context, defaultCountDown),
                            ),
                            IconButton(
                              iconSize: iconSize,
                              color: colors.onSecondaryContainer,
                              icon: const Icon(Icons.stop),
                              onPressed: stop,
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
                                onPressed: showPickFile,
                                iconSize: iconSize,
                                color: colors.onSecondaryContainer,
                                icon: const Icon(Icons.file_open))
                          ],
                        ))),
              ),
            ],
          ),
        );
      },
    );
  }
}
