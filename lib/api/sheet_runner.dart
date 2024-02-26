import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:bpm_turner/data/model/sheet_bar.dart';
import 'package:bpm_turner/data/model/sheet_line.dart';
import 'package:bpm_turner/data/model/sheet_margin.dart';
import 'package:bpm_turner/data/model/sheet_page.dart';
import 'package:bpm_turner/data/model/progress_line.dart';
import 'package:bpm_turner/data/model/tempo_sheet.dart';
import 'package:bpm_turner/global.dart';
import 'package:flutter/scheduler.dart';
import 'package:rxdart/rxdart.dart';

class SheetRunner {
  late final Ticker _ticker;
  final Size _sheetSize;
  late final TempoSheet _sheet;
  final SheetMargin sheetMargin;
  final int bpm;
  late final Duration halfBarDuration;
  late Size playerSize;
  bool playMetronome;

  Function(Bar, int)? barCallback;
  Function(Bar)? lineChangeCallback;
  Function(int)? pageChangeCallback;

  /// Current bar index in sheet.
  int currentBarIndex = 0;
  int currentPageIndex = 0;
  int currentLineIndex = 0;
  int _lastTickTime = 0;
  int _lastBeepTime = 0;
  int _lastBarTime = 0;

  /// Height of bar. This should be updated on every page change.
  double _barHeight = 0;

  final ProgressLine _currentSquare = ProgressLine(left: 0, top: 0, height: 0);

  /// Audio for metronome sound.
  final AudioPlayer _player = AudioPlayer()
    ..setSource(AssetSource('metronome.mp3'))
    ..seek(const Duration(seconds: 0));

  final BehaviorSubject<ProgressLine> squareDataSubject = BehaviorSubject(sync: true);

  SheetRunner(
    this._sheetSize,
    this._sheet, {
    this.sheetMargin = const SheetMargin(left: 100, right: 100, top: 100, bottom: 100),
        this.playMetronome = false,
    required this.bpm,
    this.barCallback,
    this.lineChangeCallback,
    this.pageChangeCallback,
  }) {
    _ticker = Ticker(_onTick);
    halfBarDuration = Duration(milliseconds: bpmDuration(bpm));
    playerSize = Size(_sheetSize.width - sheetMargin.right - sheetMargin.left,
        _sheetSize.height - sheetMargin.top - sheetMargin.bottom);

    _barHeight = playerSize.height / _sheet.pages[0].lines.length;
  }

  _onTick(Duration elapse) {
    logger.d("onTick");
    var bar = currentBar();
    if (bar == null) {
      // End of music.
      logger.i("End of music");
      stop();
      return;
    }

    var line = currentLine();

    var barCount = line?.bars.length ?? 5;
    var barWidth = playerSize.width / barCount;

    var elapseBetweenBeep = elapse.inMilliseconds - _lastBeepTime;
    var elapseBetweenTick = elapse.inMilliseconds - _lastTickTime;
    _lastTickTime = elapse.inMilliseconds;

    // 1. How many pixels we have to move to right.
    var barDuration = bar.halfBar ? halfBarDuration.inMilliseconds : (halfBarDuration.inMilliseconds * 2);
    var distance = barWidth ~/ (barDuration / elapseBetweenTick);
    // Move the progressBar.
    _currentSquare.left += distance;

    // 2. It is end of the bar?
    if((elapse.inMilliseconds - _lastBarTime >= barDuration)) {
      // We passed 'end of the bar'. Change it!
      _nextBar();
    }

    squareDataSubject.add(_currentSquare);

    // 2. It is time to beep?
    if(elapseBetweenBeep >= halfBarDuration.inMilliseconds) {
      logger.i("Elapse between: $elapseBetweenBeep ms");
      _lastBeepTime = elapse.inMilliseconds;

      if (playMetronome) {
        _player.resume();
        _player.seek(const Duration(seconds: 0));
      }
    }
  }

  void playSheet() {
    _ticker.start();
  }

  void stop() {
    _ticker.stop();
  }

  MusicPage? currentPage() {
    if (_sheet.pages.length <= currentPageIndex) return null;
    return _sheet.pages[currentPageIndex];
  }

  Line? currentLine() {
    var page = currentPage();
    if (page == null) return null;
    if (page.lines.length <= currentLineIndex) return null;
    return page.lines[currentLineIndex];
  }

  Bar? currentBar() {
    var line = currentLine();
    if (line == null) return null;
    if (line.bars.length <= currentBarIndex) return null;
    return line.bars[currentBarIndex];
  }

  /// Turn to next page.
  /// @return next page if exists, null if not.
  MusicPage? _nextPage() {
    currentLineIndex = 0;
    currentBarIndex = 0;
    if(currentPageIndex + 1 >= _sheet.pages.length) {
      // Current page is end of the page.
      logger.w("This is last page. $currentPageIndex");
      return null;
    }
    currentPageIndex++;
    // Update bar height.
    _barHeight = playerSize.height / _sheet.pages[currentPageIndex].lines.length;
    _currentSquare.left = sheetMargin.left;
    _currentSquare.height = _barHeight.toInt();
    _currentSquare.top = sheetMargin.top;

    return currentPage();
  }

  /// Turn to next line.
  Line? _nextLine() {
    var page = currentPage();
    if (page == null) return null;
    if (page.lines.length <= currentLineIndex + 1) {
      // Should turn next page.
      _nextPage();
    } else {
      currentBarIndex = 0;
      currentLineIndex++;

      // We changed the line. So we need to change the progressBar position.
      _currentSquare.left = sheetMargin.left;
      _currentSquare.top += _barHeight.toInt();
      var bar = currentBar();
      if(bar != null) {
        lineChangeCallback?.call(bar);
      }
    }

    return currentLine();
  }

  /// Turn to nextBar.
  Bar? _nextBar() {
    var line = currentLine();
    if (line == null) return null;
    if (line.bars.length <= currentBarIndex + 1) {
      // Should turn to next line.
      _nextLine();
    } else {
      currentBarIndex++;
    }
    return currentBar();
  }
}
