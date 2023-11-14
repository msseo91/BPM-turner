import 'package:bpm_turner/data/model/sheet_bar.dart';
import 'package:bpm_turner/data/model/sheet_line.dart';
import 'package:bpm_turner/data/model/sheet_music.dart';
import 'package:bpm_turner/data/model/sheet_page.dart';

import '../model/tempo_sheet.dart';

TempoSheet sheet = TempoSheet("Chopin etudes Op.10 No.1", pages: _makePages());

List<MusicPage> _makePages() {
  return [
    MusicPage(0, [
      Line.makeBarLine(index: 0, barCount: 3, timeSignature: timeSignature44),
      Line.makeBarLine(index: 1, barCount: 3, timeSignature: timeSignature44),
      Line.makeBarLine(index: 2, barCount: 3, timeSignature: timeSignature44),
      Line.makeBarLine(index: 3, barCount: 3, timeSignature: timeSignature44),
      Line.makeBarLine(index: 4, barCount: 3, timeSignature: timeSignature44),
      Line.makeBarLine(index: 5, barCount: 3, timeSignature: timeSignature44, lastLineInPage: true),
    ]),

    MusicPage(1, [
      Line.makeBarLine(index: 0, barCount: 3, timeSignature: timeSignature44),
      Line.makeBarLine(index: 1, barCount: 3, timeSignature: timeSignature44),
      Line.makeBarLine(index: 2, barCount: 3, timeSignature: timeSignature44),
      Line.makeBarLine(index: 3, barCount: 3, timeSignature: timeSignature44),
      Line.makeBarLine(index: 4, barCount: 3, timeSignature: timeSignature44),
      Line.makeBarLine(index: 5, barCount: 3, timeSignature: timeSignature44),
      Line.makeBarLine(index: 6, barCount: 3, timeSignature: timeSignature44, lastLineInPage: true),
    ]),

    MusicPage(2, [
      Line.makeBarLine(index: 0, barCount: 3, timeSignature: timeSignature44),
      Line.makeBarLine(index: 1, barCount: 3, timeSignature: timeSignature44),
      Line.makeBarLine(index: 2, barCount: 3, timeSignature: timeSignature44),
      Line.makeBarLine(index: 3, barCount: 3, timeSignature: timeSignature44),
      Line.makeBarLine(index: 4, barCount: 3, timeSignature: timeSignature44),
      Line.makeBarLine(index: 5, barCount: 3, timeSignature: timeSignature44),
      Line.makeBarLine(index: 6, barCount: 3, timeSignature: timeSignature44, lastLineInPage: true),
    ]),

    MusicPage(3, [
      Line.makeBarLine(index: 0, barCount: 3, timeSignature: timeSignature44),
      Line.makeBarLine(index: 1, barCount: 3, timeSignature: timeSignature44),
      Line.makeBarLine(index: 2, barCount: 3, timeSignature: timeSignature44),
      Line.makeBarLine(index: 3, barCount: 3, timeSignature: timeSignature44),
      Line.makeBarLine(index: 4, barCount: 3, timeSignature: timeSignature44),
      Line.makeBarLine(index: 5, barCount: 4, timeSignature: timeSignature44, lastLineInPage: true),
    ]),
  ];
}
