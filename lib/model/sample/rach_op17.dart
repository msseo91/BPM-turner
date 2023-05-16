import 'package:bpm_turner/model/sheet_bar.dart';
import 'package:bpm_turner/model/sheet_map.dart';

/// Rachmaninoff Suite No.2, Op.17 Tarantella

TempoSheet sheet =
    TempoSheet("Rachmaninoff Suite No.2, Op.17 Tarantella", bars: _makeBars());

List<List<Bar>> _makeBars() {
  List<List<Bar>> bars = [];

  bars.add([
    Bar(timeSignature68, halfBar: true, firstBarInPage: true),
    Bar(timeSignature68),
    Bar(timeSignature68),
    Bar(timeSignature68),
    Bar(timeSignature68),
    Bar(timeSignature68),
  ]);
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  // 2
  bars.add(Bar.makeBars(6, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  // 3
  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  // 4
  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  // 10
  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(4, timeSignature68));
  bars.add(Bar.makeBars(4, timeSignature68));

  bars.add(Bar.makeBars(6, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(6, timeSignature68));
  bars.add(Bar.makeBars(6, timeSignature68));

  bars.add(Bar.makeBars(6, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(6, timeSignature68));
  bars.add(Bar.makeBars(6, timeSignature68));

  bars.add(Bar.makeBars(6, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(6, timeSignature68));
  bars.add(Bar.makeBars(6, timeSignature68));

  // 14
  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  // 15
  bars.add(Bar.makeBars(6, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  // 20
  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  // 25
  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  // 30
  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(6, timeSignature68));

  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  // 35
  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(5, timeSignature68));

  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(6, timeSignature68));

  bars.add(Bar.makeBars(6, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(6, timeSignature68));

  bars.add(Bar.makeBars(5, timeSignature68, firstBarInPage: true));
  bars.add(Bar.makeBars(5, timeSignature68));
  bars.add(Bar.makeBars(6, timeSignature68));

  return bars;
}
