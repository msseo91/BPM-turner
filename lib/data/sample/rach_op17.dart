import 'dart:ui';

import 'package:bpm_turner/data/model/sheet_bar.dart';
import 'package:bpm_turner/data/model/sheet_page.dart';

import '../model/tempo_sheet.dart';

/// Rachmaninoff Suite No.2, Op.17 Tarantella
TempoSheet tarantella = TempoSheet("Rachmaninoff Suite No.2, Op.17 Tarantella",
    pages: _makePages());

List<MusicPage> _makePages() {
  return [
    MusicPage(0, [
      Bar(
          halfBar: true,
          barRectInPercent: const Rect.fromLTRB(0.235, 0.139, 0.307, 0.342)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.307, 0.139, 0.438, 0.342)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.438, 0.139, 0.536, 0.342)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.536, 0.139, 0.653, 0.342)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.653, 0.139, 0.776, 0.342)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.776, 0.139, 0.907, 0.342)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.182, 0.415, 0.316, 0.631)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.316, 0.415, 0.439, 0.631)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.439, 0.415, 0.573, 0.631)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.573, 0.415, 0.739, 0.631)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.739, 0.415, 0.903, 0.631)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.177, 0.697, 0.333, 0.915)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.333, 0.697, 0.468, 0.915)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.468, 0.697, 0.612, 0.915)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.612, 0.697, 0.735, 0.915)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.735, 0.697, 0.904, 0.915)),
    ]),
    MusicPage(1, [
      Bar(barRectInPercent: const Rect.fromLTRB(0.159, 0.154, 0.335, 0.325)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.335, 0.154, 0.544, 0.325)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.544, 0.154, 0.683, 0.325)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.683, 0.154, 0.822, 0.325)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.822, 0.154, 0.931, 0.325)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.822, 0.154, 0.931, 0.325)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.156, 0.385, 0.31, 0.578)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.31, 0.385, 0.452, 0.578)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.452, 0.385, 0.586, 0.578)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.586, 0.385, 0.753, 0.578)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.753, 0.385, 0.931, 0.578)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.31, 0.82, 0.485, 0.823)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.485, 0.82, 0.65, 0.823)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.65, 0.82, 0.781, 0.823)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.781, 0.82, 0.926, 0.823)),
    ]),
    MusicPage(2, [
      Bar(barRectInPercent: const Rect.fromLTRB(0.154, 0.151, 0.313, 0.322)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.313, 0.151, 0.477, 0.322)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.477, 0.151, 0.633, 0.322)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.633, 0.151, 0.769, 0.322)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.769, 0.151, 0.931, 0.322)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.156, 0.396, 0.321, 0.586)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.321, 0.396, 0.506, 0.586)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.506, 0.396, 0.636, 0.586)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.636, 0.396, 0.783, 0.586)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.783, 0.396, 0.931, 0.586)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.156, 0.666, 0.33, 0.855)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.33, 0.666, 0.463, 0.855)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.463, 0.666, 0.619, 0.855)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.619, 0.666, 0.764, 0.855)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.764, 0.666, 0.937, 0.855)),
    ]),

    /**
     *
        Bar(barRectInPercent: const Rect.fromLTRB()),
        Bar(barRectInPercent: const Rect.fromLTRB()),
        Bar(barRectInPercent: const Rect.fromLTRB()),
        Bar(barRectInPercent: const Rect.fromLTRB()),
        Bar(barRectInPercent: const Rect.fromLTRB()),
     */
    MusicPage(3, [
      Bar(barRectInPercent: const Rect.fromLTRB(0.156, 0.155, 0.313, 0.325)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.307, 0.155, 0.482, 0.325)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.48, 0.155, 0.633, 0.325)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.636, 0.155, 0.775, 0.325)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.767, 0.155, 0.929, 0.325)),

      Bar(barRectInPercent: const Rect.fromLTRB(0.151, 0.396, 0.293, 0.596)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.293, 0.396, 0.463, 0.596)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.463, 0.396, 0.622, 0.596)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.622, 0.396, 0.789, 0.596)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.789, 0.396, 0.934, 0.596)),

      Bar(barRectInPercent: const Rect.fromLTRB(0.156, 0.661, 0.313, 0.863)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.313, 0.661, 0.493, 0.863)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.493, 0.661, 0.633, 0.863)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.633, 0.661, 0.778, 0.863)),
      Bar(barRectInPercent: const Rect.fromLTRB(0.778, 0.661, 0.929, 0.863)),
    ]),

    MusicPage(4, [
      /*Bar(barRectInPercent: const Rect.fromLTRB()),
      Bar(barRectInPercent: const Rect.fromLTRB()),
      Bar(barRectInPercent: const Rect.fromLTRB()),
      Bar(barRectInPercent: const Rect.fromLTRB()),
      Bar(barRectInPercent: const Rect.fromLTRB()),
      Bar(barRectInPercent: const Rect.fromLTRB()),

      Bar(barRectInPercent: const Rect.fromLTRB()),
      Bar(barRectInPercent: const Rect.fromLTRB()),
      Bar(barRectInPercent: const Rect.fromLTRB()),
      Bar(barRectInPercent: const Rect.fromLTRB()),
      Bar(barRectInPercent: const Rect.fromLTRB()),

      Bar(barRectInPercent: const Rect.fromLTRB()),
      Bar(barRectInPercent: const Rect.fromLTRB()),
      Bar(barRectInPercent: const Rect.fromLTRB()),
      Bar(barRectInPercent: const Rect.fromLTRB()),*/
    ]),

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
