import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:bpm_turner/data/model/sheet_bar.dart';
import 'package:bpm_turner/data/model/sheet_line.dart';
import 'package:bpm_turner/data/model/sheet_margin.dart';
import 'package:bpm_turner/data/model/sheet_page.dart';
import 'package:bpm_turner/data/model/square_data.dart';
import 'package:bpm_turner/data/model/tempo_sheet.dart';
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

  Function(Bar, int)? barCallback;
  Function(Bar)? lineChangeCallback;
  Function(int)? pageChangeCallback;

  /// Current bar index in sheet.
  int currentBarIndex = 0;
  int currentPageIndex = 0;
  int currentLineIndex = 0;
  bool _isOneTickPlayed = false;

  SquareData _currentSquare = SquareData(left: 0, top: 0, height: 0);

  // Audio for metronome sound.
  final AudioPlayer _player = AudioPlayer()
    ..setSource(AssetSource('metronome.mp3'))
    ..seek(const Duration(seconds: 0));

  final BehaviorSubject<SquareData> squareDataSubject = BehaviorSubject();

  SheetRunner(
    this._sheetSize,
    this._sheet, {
    this.sheetMargin = const SheetMargin(left: 100, right: 100, top: 100, bottom: 100),
    required this.bpm,
    this.barCallback,
    this.lineChangeCallback,
    this.pageChangeCallback,
  }) {
    _ticker = Ticker(_onTick);
    halfBarDuration = Duration(milliseconds: bpmDuration(bpm));
    playerSize = Size(_sheetSize.width - sheetMargin.right - sheetMargin.left,
        _sheetSize.height - sheetMargin.top - sheetMargin.bottom);


  }

  _onTick(Duration elapse) {
    double barHeight = playerSize.height / _sheet.pages[0].lines.length;
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
    currentPageIndex++;
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
