import 'dart:ui';

import 'package:bpm_turner/data/model/sheet_bar.dart';
import 'package:bpm_turner/data/model/sheet_page.dart';

import '../model/tempo_sheet.dart';

/// Rachmaninoff Suite No.2, Op.17 Tarantella

TempoSheet tarantella = TempoSheet("Rachmaninoff Suite No.2, Op.17 Tarantella",
    pages: _makePages());

/**
 *
    Bar(barRectInPercent: const Rect.fromLTRB()),
    Bar(barRectInPercent: const Rect.fromLTRB()),
    Bar(barRectInPercent: const Rect.fromLTRB()),
    Bar(barRectInPercent: const Rect.fromLTRB()),
    Bar(barRectInPercent: const Rect.fromLTRB()),
 */
List<MusicPage> _makePages() {
  return [
    //MusicPage(0, [Bar(halfBar: true)] + makeBars(15)),
    MusicPage(0, [
      Bar(halfBar: true, barRectInPercent: const Rect.fromLTRB(0.239, 0.159, 0.305, 0.365)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.305, 0.159, 0.438, 0.365)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.438, 0.159, 0.536, 0.365)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.536, 0.159, 0.653, 0.365)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.653, 0.159, 0.776, 0.365)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.776, 0.159, 0.907, 0.365)),

      Bar(barRectInPercent: const Rect.fromLTRB(0.182, 0.435, 0.316, 0.653)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.316, 0.435, 0.439, 0.653)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.439 ,0.435, 0.573, 0.653)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.573, 0.435, 0.739, 0.653)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.739, 0.435, 0.903, 0.653)),

      Bar(barRectInPercent: const Rect.fromLTRB(0.177, 0.697, 0.333, 0.915)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.333, 0.697, 0.468, 0.915)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.468, 0.697, 0.612, 0.915)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.612, 0.697, 0.735, 0.915)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.735, 0.697, 0.904, 0.915)),
    ]),

    MusicPage(1, makeBars(16)),
    /*MusicPage(1, [
      Bar(barRectInPercent: const Rect.fromLTRB()),
      Bar(barRectInPercent: const Rect.fromLTRB()),
      Bar(barRectInPercent: const Rect.fromLTRB()),
      Bar(barRectInPercent: const Rect.fromLTRB()),
      Bar(barRectInPercent: const Rect.fromLTRB()),
    ]),*/


    MusicPage(2, makeBars(15)),
    MusicPage(3, makeBars(15)),
    MusicPage(4, makeBars(15)),
    MusicPage(5, makeBars(15)),
    MusicPage(6, makeBars(15)),
    MusicPage(7, makeBars(15)),
    MusicPage(8, makeBars(15)),
    MusicPage(9, makeBars(13)),
    MusicPage(10, makeBars(18)),
    MusicPage(11, makeBars(18)),
    MusicPage(12, makeBars(18)),
    MusicPage(13, makeBars(15)),
    MusicPage(14, makeBars(16)),
    MusicPage(15, makeBars(15)),
    MusicPage(16, makeBars(15)),
    MusicPage(17, makeBars(15)),
    MusicPage(18, makeBars(15)),
    MusicPage(19, makeBars(15)),
    MusicPage(20, makeBars(15)),
    MusicPage(21, makeBars(15)),
    MusicPage(22, makeBars(15)),
    MusicPage(23, makeBars(15)),
    MusicPage(24, makeBars(15)),
    MusicPage(25, makeBars(15)),
    MusicPage(26, makeBars(15)),
    MusicPage(27, makeBars(15)),
    MusicPage(28, makeBars(15)),
    MusicPage(29, makeBars(15)),
    MusicPage(30, makeBars(15)),
    MusicPage(31, makeBars(16)),
    MusicPage(32, makeBars(15)),
    MusicPage(33, makeBars(15)),
    MusicPage(34, makeBars(15)),
    MusicPage(35, makeBars(16)),
    MusicPage(36, makeBars(17)),
    MusicPage(37, makeBars(16)),
  ];
}

List<Bar> makeBars(int barCount) {
  var bars = <Bar>[];
  for (int i = 0; i < barCount; i++) {
    var lastBar = i == barCount - 1;
    bars.add(Bar(
      lastBarInPage: lastBar,
    ));
  }
  return bars;
}
