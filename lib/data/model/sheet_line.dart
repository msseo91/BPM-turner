import 'dart:ui';

import 'package:bpm_turner/data/model/sheet_bar.dart';

class Line {
  Line(this.index, this.bars, {this.rect = Rect.zero});

  final int index;
  final List<Bar> bars;

  /// Represent position and shape of this line.
  Rect rect;

  static Line makeBarLine({
    int index = 0,
    int barCount = 0,
    (int, int) timeSignature = (4, 4),
    bool lastLineInPage = false,
  }) {
    var bars = <Bar>[];
    for (int i = 0; i < barCount; i++) {
      var lastBar = i == barCount - 1;
      bars.add(Bar(
        timeSignature,
        lineIndex: index,
        lastBarInLine: lastBar,
        lastBarInPage: lastBar ? lastLineInPage : false,
      ));
    }
    return Line(index, bars);
  }
}
