import 'dart:ui';

const (int, int) timeSignature44 = (4, 4);
const (int, int) timeSignature34 = (3, 4);
const (int, int) timeSignature24 = (2, 4);
const (int, int) timeSignature68 = (6, 8);
const (int, int) timeSignature38 = (3, 8);

class Bar {
  Bar({this.tempoParam = 0,
      this.lastBarInPage = false,
      this.halfBar = false,
      this.barRectInPercent = Rect.zero});

  /// Tempo parameter for representing 'tempo change' like 'ritardando'.
  /// If 0, no change.
  /// If positive, tempo will be faster.
  /// If negative, tempo will be slower.
  int tempoParam;

  /// If this bar is last bar in page, this value is true.
  bool lastBarInPage;

  /// If this bar is half bar, this value is true.
  bool halfBar;

  /// Rect of bar. This represent position of bar in page.
  Rect barRectInPercent;
}

/// *** Basic idea ***
/// Divide bar into n segments and calculate time of each segment.
/// Each segment has different time, so we can express 'Ritardando' etc.
extension BarCalculator on Bar {
  List<int> makePlaySegment(int segmentCount, int bpm) {
    var segments = <int>[];
    // Duration of a bar in microsecond. One bar has 2 beats.
    var barDuration = duration(bpm);
    var baseSegDuration = barDuration ~/ segmentCount;

    if (tempoParam == 0) {
      segments = List.generate(segmentCount, (index) => baseSegDuration);
    } else {
      for (int i = 0; i < segmentCount; i++) {
        var segDurationWithTempo = baseSegDuration + (tempoParam * i * -1);
        segments.add(segDurationWithTempo);
      }
    }

    return segments;
  }

  /// Duration of this bar in millisecond.
  int duration(int bpm) {
    var base = ((60 * 1000) ~/ bpm) * 2;
    if (halfBar) base ~/= 2;
    return base;
  }
}

/// BPM duration for one BAR in millisecond.
int barDuration(int bpm) {
  return ((60 * 1000) ~/ bpm) * 2;
}
