import 'package:bpm_turner/model/sheet_bar.dart';
import 'package:bpm_turner/model/sheet_map.dart';

/// Rachmaninoff Suite No.2, Op.17 Tarantella

TempoSheet sheet =
    TempoSheet("Rachmaninoff Suite No.2, Op.17 Tarantella", bars: _makeBars());

List<Bar> _makeBars() {
  List<Bar> bars = [];

  bars.addAll([
    Bar(timeSignature68, halfBar: true),
    Bar(timeSignature68),
    Bar(timeSignature68),
    Bar(timeSignature68),
    Bar(timeSignature68),
    Bar(timeSignature68, lastBarInLine: true),
  ]);
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  // 2
  bars.addAll(Bar.makeBarLine(6, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  // 3
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  // 4
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  // 10
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(4, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(4, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(6, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(6, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(6, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(6, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(6, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(6, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(6, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(6, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(6, timeSignature68, lineIndex: 2, lastLineInPage: true));

  // 14
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  // 15
  bars.addAll(Bar.makeBarLine(6, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  // 20
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  // 25
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  // 30
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(6, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  // 35
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(6, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(6, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(6, timeSignature68, lineIndex: 2, lastLineInPage: true));

  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 0));
  bars.addAll(Bar.makeBarLine(5, timeSignature68, lineIndex: 1));
  bars.addAll(Bar.makeBarLine(6, timeSignature68, lineIndex: 2, lastLineInPage: true));

  return bars;
}
