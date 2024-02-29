import 'dart:ui';

import 'package:bpm_turner/data/model/sheet_bar.dart';

class Line {
  Line(this.index, this.bars, {this.rect = Rect.zero, this.currentBarIndex = 0,});

  // Index of Line.
  final int index;
  final List<Bar> bars;

  /// Represent position and shape of this line.
  Rect rect;

  int currentBarIndex = 0;

  Bar get currentBar => bars[currentBarIndex];
}
