import 'dart:async';

import 'package:bpm_turner/model/sheet_bar.dart';
import 'package:logger/logger.dart';

var _logger = Logger(printer: SimplePrinter(printTime: true));

class TempoSheet {
  TempoSheet(
    this.name, {
    required this.bars,
  });

  final String name;

  /// Array of bar
  List<Bar> bars = [];

  /// Current bar index in sheet.
  int currentBarIndex = 0;

  bool _isPlaying = false;

  Timer? _timer;

  Future<void> play(int bpm, {
    Function(int)? segCallback,
    Function(Bar, int)? barCallback,
    Function(Bar)? lineChangeCallback,
    Function(int)? pageChangeCallback,
  }) async {
    _isPlaying = true;

    // We assume all duration is same in sheet... For now.
    var duration = Duration(milliseconds: bpmDuration(bpm));
    var isOneTickPlayed = false;

    _timer = Timer.periodic(duration, (timer) {
      if(bars[currentBarIndex].halfBar) {
        barCallback?.call(bars[currentBarIndex], duration.inMilliseconds);
        if(bars[currentBarIndex].lastBarInLine) {
          lineChangeCallback?.call(bars[currentBarIndex]);
        }
        if(bars[currentBarIndex].lastBarInPage) {
          pageChangeCallback?.call(currentPage());
        }
        currentBarIndex++;
      } else if(isOneTickPlayed) {
        isOneTickPlayed = false;
        currentBarIndex++;
      } else {
        barCallback?.call(bars[currentBarIndex], duration.inMilliseconds * 2);
        if(bars[currentBarIndex].lastBarInLine) {
          lineChangeCallback?.call((bars[currentBarIndex]));
        }
        if(bars[currentBarIndex].lastBarInPage) {
          pageChangeCallback?.call(currentPage());
        }
        isOneTickPlayed = true;
      }

    });
  }

  void pause() {
    _isPlaying = false;
    _timer?.cancel();
  }

  void stop() {
    _isPlaying = false;
    _timer?.cancel();
    currentBarIndex = 0;
  }

  /// Current page index.
  int currentPage() {
    int page = 0;

    for (int i = 0; i < bars.length; i++) {
      if (i == currentBarIndex) {
        return page;
      }
      if (bars[i].lastBarInPage) {
        page++;
      }
    }

    return page;
  }
}
