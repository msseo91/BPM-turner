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

  Future<void> play(int bpm, {
    Function(int)? segCallback,
    Function(int)? barCallback,
    Function(int)? lineChangeCallback,
    Function(int)? pageChangeCallback,
  }) async {
    _isPlaying = true;

    for (var i = currentBarIndex; i < bars.length; i++) {
      if(!_isPlaying) break;

      if(bars[i].tempoParam == 0) {
        await Future.delayed(Duration(microseconds: bars[i].duration(bpm)));
      } else {
        var segDurations = bars[i].makePlaySegment(5, bpm);
        for (var duration in segDurations) {
          await Future.delayed(Duration(microseconds: duration));
          segCallback?.call(duration);
        }
      }

      barCallback?.call(i);
      if(bars[i].lastBarInLine) {
        lineChangeCallback?.call(currentLineIndexInPage());
      }
      if(bars[i].lastBarInPage) {
        pageChangeCallback?.call(currentPage());
      }

      currentBarIndex++;
    }
  }

  void pause() {
    _isPlaying = false;
  }

  void stop() {
    _isPlaying = false;
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

  int currentLineIndexInPage() {
    int line = 0;

    // 1. Get last bar in page.
    var lastBarIndex = currentBarIndex;
    for (var i = currentBarIndex; i < bars.length; i++) {
      if (bars[i].lastBarInPage) {
        break;
      }
      lastBarIndex++;
    }

    // 2. Get first bar in page.
    var firstBarIndex = currentBarIndex;
    for (var i = currentBarIndex; i >= 0; i--) {
      if (bars[i].lastBarInPage) {
        firstBarIndex = i + 1;
        break;
      }
    }

    // 3. Get current line index.
    for (var i = firstBarIndex; i <= lastBarIndex; i++) {
      if (i == currentBarIndex) {
        return line;
      }
      if (bars[i].lastBarInLine) {
        line++;
      }
    }

    return line;
  }
}
