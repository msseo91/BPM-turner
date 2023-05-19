import 'package:bpm_turner/model/sheet_bar.dart';
import 'package:bpm_turner/model/sheet_line.dart';
import 'package:bpm_turner/model/sheet_music.dart';
import 'package:bpm_turner/model/sheet_page.dart';

/// Rachmaninoff Suite No.2, Op.17 Tarantella

TempoSheet sheet =
TempoSheet("Rachmaninoff Suite No.2, Op.17 Tarantella", pages: _makePages());

List<Page> _makePages() {
  return [
    Page(0, [
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

    Page(1, [
      Line.makeBarLine(index: 0, barCount: 6, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(2, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(3, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(4, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(5, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(6, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(7, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(8, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(9, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 4, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 4, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(10, [
      Line.makeBarLine(index: 0, barCount: 6, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 6, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 6, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(11, [
      Line.makeBarLine(index: 0, barCount: 6, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 6, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 6, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(12, [
      Line.makeBarLine(index: 0, barCount: 6, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 6, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 6, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(13, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(14, [
      Line.makeBarLine(index: 0, barCount: 6, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(15, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(16, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(17, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(18, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(19, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(20, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(21, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(22, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(23, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(24, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(25, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(26, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(27, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(28, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(29, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(30, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(31, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 6, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(32, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(33, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(34, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 5, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(35, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 6, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(36, [
      Line.makeBarLine(index: 0, barCount: 6, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 6, timeSignature: timeSignature68, lastLineInPage: true),
    ]),

    Page(37, [
      Line.makeBarLine(index: 0, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 1, barCount: 5, timeSignature: timeSignature68),
      Line.makeBarLine(index: 2, barCount: 6, timeSignature: timeSignature68, lastLineInPage: true),
    ]),
  ];
}
