

import 'dart:ui';

import 'package:bpm_turner/data/model/sheet_line.dart';

/// Represent page of sheet music.
class MusicPage {
  // Page index(Number).
  final int index;
  final List<Line> lines;
  Image? sheetImage;
  int currentLineIndex = 0;

  MusicPage(this.index, this.lines, {this.sheetImage, this.currentLineIndex = 0});

  Line get currentLine => lines[currentLineIndex];
}