import 'package:bpm_turner/model/sheet_bar.dart';
import 'package:bpm_turner/model/sheet_line.dart';
import 'package:bpm_turner/model/sheet_music.dart';
import 'package:bpm_turner/model/sheet_page.dart';

/// Rachmaninoff Suite No.2, Op.17 Tarantella

TempoSheet sheet = TempoSheet("Rachmaninoff Suite No.2, Op.17 Tarantella", pages: _makePages());

List<MusicPage> _makePages() {
  return [
    MusicPage(0, [
      Line(0, [
        // Default lineIndex is 0.
        Bar(timeSignature68, halfBar: true),
        Bar(timeSignature68),
        Bar(timeSignature68),
        Bar(timeSignature68),
        Bar(timeSignature68),
        Bar(timeSignature68, lastBarInLine: true)]),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(1, [
      Line.makeBarLine(index: 0, barCount: 6, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(2, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(3, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(4, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(5, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(6, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(7, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(8, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(9, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 4, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 4, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(10, [
      Line.makeBarLine(index: 0, barCount: 6, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 6, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 6, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(11, [
      Line.makeBarLine(index: 0, barCount: 6, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 6, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 6, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(12, [
      Line.makeBarLine(index: 0, barCount: 6, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 6, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 6, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(13, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(14, [
      Line.makeBarLine(index: 0, barCount: 6, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(15, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(16, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(17, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(18, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(19, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(20, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(21, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(22, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(23, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(24, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(25, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(26, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(27, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(28, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(29, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(30, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(31, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 6, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(32, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(33, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(34, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(35, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 6, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(36, [
      Line.makeBarLine(index: 0, barCount: 6, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 6, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    MusicPage(37, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 6, timeSignature: timeSignature68, lastLineInPage: true),
    ]),
  ];
}
