import 'dart:async';
import 'dart:ui';

import 'package:bpm_turner/global.dart';
import 'package:bpm_turner/route/editor_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:bpm_turner/model/sample/rach_op17.dart' as rach;

const Duration controlDuration = Duration(milliseconds: 3000);
const double iconSize = 40;

class MusicWidget extends HookWidget {
  MusicWidget(
      {Key? key,
      required this.pdfPath,
      required this.sheetImages,
      required this.bpm,
      required this.isPlaying,
      required this.controlOpacity,
      required this.ticker,
      required this.makeMetronomeSound,
      required this.currentPage})
      : super(key: key);

  final ValueNotifier<String?> pdfPath;
  final List<Image> sheetImages;
  final ValueNotifier<int> bpm;
  final ValueNotifier<bool> isPlaying;
  final ValueNotifier<double> controlOpacity;
  final TickerProvider ticker;
  final ValueNotifier<bool> makeMetronomeSound;
  final ValueNotifier<int> currentPage;

  Timer? controlTabTimer;
  var sheet = rach.sheet;
  final sheetImageKey = GlobalKey();

  void onScreenTab() {
    logger.d("tap!");

    if (controlOpacity.value == 0) {
      controlOpacity.value = 0.5;
      controlTabTimer?.cancel();
      controlTabTimer = Timer(controlDuration, () => controlOpacity.value = 0);
    } else {
      controlTabTimer?.cancel();
      controlOpacity.value = 0;
    }
  }

  void nextPage() {
    if (sheetImages.length - 1 > currentPage.value) {
      currentPage.value++;
    }
    logger.d("nextPage=${currentPage.value}");
  }

  void prevPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
    }
    logger.d("prevPage=${currentPage.value}");
  }

  void pause() {
    isPlaying.value = !isPlaying.value;
    sheet.pause();
  }

  void stop() {
    isPlaying.value = false;
    currentPage.value = 0;
    sheet.stop();
  }

  Future<void> startPlay(BuildContext context) async {
    isPlaying.value = true;

    final RenderBox renderBox = sheetImageKey.currentContext?.findRenderObject() as RenderBox;

    var barIndex = 0;
    sheet.play(bpm.value, ticker, context, renderBox.size, barCallback: (bar, duration) {
      logger.d("Bar $barIndex is started.");
      barIndex++;
    }, lineChangeCallback: (bar) {
      barIndex = 0;
      logger.d("Line changed to ${bar.lineIndex}");
    }, pageChangeCallback: (pageIndex) {
      logger.d("Page changed to ${pageIndex + 1}");
      currentPage.value = pageIndex + 1;
    });
  }

  void showPickFile() async {
    final pickResult = await FilePicker.platform.pickFiles(allowMultiple: false);

    // if no file is picked
    if (pickResult == null) return;

    pdfPath.value = pickResult.files.first.path ?? "";
  }

  Widget progressLoading() {
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

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
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
                child: sheetImages.isEmpty
                    ? progressLoading()
                    : RawImage(key: sheetImageKey, image: sheetImages[currentPage.value]),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: controlOpacity.value,
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      color: colors.secondaryContainer,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () => bpm.value -= 5,
                              iconSize: iconSize,
                              color: colors.onSecondaryContainer,
                              icon: const Icon(Icons.remove)),
                          Text(
                            bpm.value.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: colors.onSecondaryContainer,
                            ),
                          ),
                          IconButton(
                              onPressed: () => bpm.value += 5,
                              iconSize: iconSize,
                              color: colors.onSecondaryContainer,
                              icon: const Icon(Icons.add)),
                          IconButton(
                            iconSize: iconSize,
                            color: colors.onSecondaryContainer,
                            icon: Icon(isPlaying.value ? Icons.pause : Icons.play_arrow),
                            onPressed: isPlaying.value ? pause : () => startPlay(context),
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
                            icon: Icon(makeMetronomeSound.value ? Icons.volume_up : Icons.volume_off),
                            onPressed: () => sheet.playMetronome = makeMetronomeSound.value = !makeMetronomeSound.value,
                          ),
                        ],
                      ))),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: controlOpacity.value,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      color: colors.secondaryContainer,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => EditorRoute(sheetImages: sheetImages)),
                                );
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
      ),
    );
  }
}
