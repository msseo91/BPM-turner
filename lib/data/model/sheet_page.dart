

import 'dart:ui';

import 'package:bpm_turner/data/model/sheet_line.dart';

/// Represent page of sheet music.
class MusicPage {
  final int index;
  final List<Line> lines;
  final Image? sheetImage;

  MusicPage(this.index, this.lines, {this.sheetImage});
}