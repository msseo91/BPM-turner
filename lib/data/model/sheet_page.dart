

import 'dart:ui';

import 'package:bpm_turner/data/model/sheet_bar.dart';

/// Represent page of sheet music.
class MusicPage {
  // Page index(Number).
  final int index;
  final List<Bar> bars;
  Image? sheetImage;
  int currentBarIndex = 0;

  MusicPage(this.index, this.bars, {this.sheetImage, this.currentBarIndex = 0});

  Bar get currentBar => bars[currentBarIndex];

  Bar? nextBar() {
    if(currentBarIndex < bars.length - 1) {
      currentBarIndex++;
      return currentBar;
    } else {
      return null;
    }
  }
}