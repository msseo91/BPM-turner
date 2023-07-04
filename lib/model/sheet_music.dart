import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bpm_turner/global.dart';
import 'package:bpm_turner/model/sheet_bar.dart';
import 'package:bpm_turner/model/sheet_line.dart';
import 'package:bpm_turner/model/sheet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TempoSheet {
  TempoSheet(
    this.name, {
    required this.pages,
    this.savedPath = '',
  });

  final String name;

  final String savedPath;

  var playMetronome = false;
  Size screenSize = const Size(0,0);

  double halfBarWidth = 0;

  /// Array of bar
  List<MusicPage> pages = [];

  /// Current bar index in sheet.
  int currentBarIndex = 0;
  int currentPageIndex = 0;
  int currentLineIndex = 0;

  var player = AudioPlayer()..setSource(AssetSource('metronome.mp3'));

  Ticker? _playTicker;

  OverlayEntry? _lastOverlay;
  var tickTime = 0;

  Future<void> play(
    int bpm,
    TickerProvider tickerProvider,
    BuildContext context,
    Size screenSize,{
    Function(int)? segCallback,
    Function(Bar, int)? barCallback,
    Function(Bar)? lineChangeCallback,
    Function(int)? pageChangeCallback,
  }) async {
    // We assume all duration is same in sheet... For now.
    var halfBarDuration = Duration(milliseconds: bpmDuration(bpm));
    var isOneTickPlayed = false;
    player = AudioPlayer()
      ..setSource(AssetSource('metronome.mp3'))
      ..seek(const Duration(seconds: 0));

    // TODO - Change bar size after impl editor.
    this.screenSize = screenSize;
    final barHeight = screenSize.height / 3;
    var barCount = currentLine()?.bars.length ?? 5;
    halfBarWidth = screenSize.width / barCount / 2;
    var currentLeft = 0.0;
    var currentTop = 0.0;
    logger.i("Bar size is $halfBarWidth x $barHeight");
    var lastBeepElapsed = 0;
    var lastTickElapse = 0;

    void changeLine(Bar bar) {
      currentTop += barHeight;
      currentLeft = 0;
      lineChangeCallback?.call((bar));
    }

    void changePage() {
      currentTop = 0;
      currentLeft = 0;
      pageChangeCallback?.call(currentPageIndex);
    }

    _playTicker = tickerProvider.createTicker((elapsed) {
      var elapsedFromLast = elapsed.inMilliseconds - lastBeepElapsed;
      var elapsedBetweenTick = elapsed.inMilliseconds - lastTickElapse;
      var measuredTickCount = halfBarDuration.inMilliseconds / elapsedBetweenTick;
      lastTickElapse = elapsed.inMilliseconds;

      drawProgressBar(context, currentLeft, currentTop, barHeight);
      currentLeft += halfBarWidth / measuredTickCount;

      // Half bar
      if(elapsedFromLast >= halfBarDuration.inMilliseconds) {
        lastBeepElapsed = elapsed.inMilliseconds;
        logger.i("Elapse between: $elapsedFromLast ms");

        var bar = currentBar();
        if(bar == null) {
          // End of music.
          logger.i("End of music");
          _playTicker?.stop();
          return;
        }

        if(playMetronome) {
          player.resume();
          player.seek(const Duration(seconds: 0));
        }

        if (bar.halfBar) {
          barCallback?.call(bar, halfBarDuration.inMilliseconds);
          if (bar.lastBarInLine) {
            changeLine(bar);
          }
          if (bar.lastBarInPage) {
            changePage();
          }
          _nextBar();
        } else if (isOneTickPlayed) {
          isOneTickPlayed = false;
          _nextBar();
        } else {
          barCallback?.call(bar, halfBarDuration.inMilliseconds * 2);
          if (bar.lastBarInLine) {
            changeLine(bar);
          }
          if (bar.lastBarInPage) {
            changePage();
          }
          isOneTickPlayed = true;
        }
      }
    });
    _playTicker?.start();
  }

  void drawProgressBar(BuildContext context, double left, double top, double height) {
    _lastOverlay?.remove();
    _lastOverlay = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          left: left,
          top: top,
          height: height,
          child: const VerticalDivider(
            color: Colors.red,
          ),
        );
      },
    );

    Overlay.of(context).insert(_lastOverlay!);
  }

  void pause() {
    _playTicker?.stop();
  }

  void stop() {
    _playTicker?.stop();
    _lastOverlay?.remove();
    _lastOverlay = null;
    currentBarIndex = 0;
    currentLineIndex = 0;
    currentPageIndex = 0;
  }

  MusicPage? currentPage() {
    if(pages.length <= currentPageIndex) return null;
    return pages[currentPageIndex];
  }

  Line? currentLine() {
    var page = currentPage();
    if(page == null) return null;
    if(page.lines.length <= currentLineIndex) return null;
    return page.lines[currentLineIndex];
  }

  Bar? currentBar() {
    var line = currentLine();
    if(line == null) return null;
    if(line.bars.length <= currentBarIndex) return null;
    return line.bars[currentBarIndex];
  }

  /// Turn to next page.
  /// @return next page if exists, null if not.
  MusicPage? _nextPage() {
    currentLineIndex = 0;
    currentBarIndex = 0;
    currentPageIndex++;
    return currentPage();
  }

  /// Turn to next line.
  Line? _nextLine() {
    var page = currentPage();
    if(page == null) return null;
    if(page.lines.length <= currentLineIndex + 1) {
      // Should turn next page.
      _nextPage();
    } else {
      currentBarIndex = 0;
      currentLineIndex++;
    }
    // Update bar width.
    var barCount = currentLine()?.bars.length ?? 5;
    halfBarWidth = screenSize.width / barCount / 2;

    return currentLine();
  }

  /// Turn to nextBar.
  Bar? _nextBar() {
    var line = currentLine();
    if(line == null) return null;
    if(line.bars.length <= currentBarIndex + 1) {
      // Should turn to next line.
      _nextLine();
    } else {
      currentBarIndex++;
    }
    return currentBar();
  }
}
