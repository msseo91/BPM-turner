import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bpm_turner/global.dart';
import 'package:bpm_turner/model/sheet_bar.dart';
import 'package:bpm_turner/model/sheet_line.dart';
import 'package:bpm_turner/model/sheet_page.dart';
import 'package:logger/logger.dart';

class TempoSheet {
  TempoSheet(
    this.name, {
    required this.pages,
    this.savedPath = '',
  });

  final String name;

  final String savedPath;

  /// Array of bar
  List<Page> pages = [];

  /// Current bar index in sheet.
  int currentBarIndex = 0;
  int currentPageIndex = 0;
  int currentLineIndex = 0;

  Timer? _timer;
  var player = AudioPlayer()..setSource(AssetSource('metronome.mp3'));

  Future<void> play(
    int bpm, {
    Function(int)? segCallback,
    Function(Bar, int)? barCallback,
    Function(Bar)? lineChangeCallback,
    Function(int)? pageChangeCallback,
  }) async {
    // We assume all duration is same in sheet... For now.
    var duration = Duration(milliseconds: bpmDuration(bpm));
    var isOneTickPlayed = false;
    player = AudioPlayer()..setSource(AssetSource('metronome.mp3'));

    _timer = Timer.periodic(duration, (timer) {
      var bar = currentBar();
      if(bar == null) {
        // End of music.
        logger.i("End of music");
        timer.cancel();
        return;
      }

      player.seek(const Duration(seconds: 0));
      player.resume();

      if (bar.halfBar) {
        barCallback?.call(bar, duration.inMilliseconds);
        if (bar.lastBarInLine) {
          lineChangeCallback?.call(bar);
        }
        if (bar.lastBarInPage) {
          pageChangeCallback?.call(currentPageIndex);
        }
        _nextBar();
      } else if (isOneTickPlayed) {
        isOneTickPlayed = false;
        _nextBar();
      } else {
        barCallback?.call(bar, duration.inMilliseconds * 2);
        if (bar.lastBarInLine) {
          lineChangeCallback?.call((bar));
        }
        if (bar.lastBarInPage) {
          pageChangeCallback?.call(currentPageIndex);
        }
        isOneTickPlayed = true;
      }
    });
  }

  void pause() {
    _timer?.cancel();
  }

  void stop() {
    _timer?.cancel();
    currentBarIndex = 0;
    currentLineIndex = 0;
    currentPageIndex = 0;
  }

  Page? currentPage() {
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
  Page? _nextPage() {
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
