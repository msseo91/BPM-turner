
import 'dart:ui';

import 'package:bpm_turner/data/model/bar_divider.dart';

class SheetLine {
  final Rect rect;
  final List<BarDivider> barDividers;

  SheetLine({ required this.rect, required this.barDividers });
}