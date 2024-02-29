import 'dart:ui';

import 'package:bpm_turner/data/model/sheet_bar.dart';
import 'package:bpm_turner/data/model/sheet_page.dart';

import '../model/tempo_sheet.dart';

/// Rachmaninoff Suite No.2, Op.17 Tarantella

TempoSheet tarantella = TempoSheet("Rachmaninoff Suite No.2, Op.17 Tarantella",
    pages: _makePages());

List<MusicPage> _makePages() {
  return [
    //MusicPage(0, [Bar(halfBar: true)] + makeBars(15)),
    MusicPage(0, [
      Bar(halfBar: true, barRect: const Rect.fromLTRB(87, 181, 114, 308)),
      Bar(barRect: const Rect.fromLTRB(114, 181, 173, 308)),
      Bar(barRect: const Rect.fromLTRB(173, 181, 212, 308)),
      Bar(barRect: const Rect.fromLTRB(212, 181, 261, 308)),
      Bar(barRect: const Rect.fromLTRB(261, 181, 313, 308)),
      Bar(barRect: const Rect.fromLTRB(313, 181, 366, 308)),
    ] + makeBars(10)),

    MusicPage(1, makeBars(16)),
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
