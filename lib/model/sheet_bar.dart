
const (int, int) timeSignature44 = (4, 4);
const (int, int) timeSignature34 = (3, 4);
const (int, int) timeSignature24 = (2, 4);
const (int, int) timeSignature68 = (6, 8);
const (int, int) timeSignature38 = (3, 8);


class Bar {
  /// Time signature. Ex) 4/4
  /// (3,8) means 3/8
  (int, int) timeSignature;

  /// Tempo parameter for representing 'tempo change' like 'ritardando'.
  /// If 0, no change.
  /// If positive, tempo will be faster.
  /// If negative, tempo will be slower.
  int tempoParam;

  /// If this bar is first bar in page, this value is true.
  bool firstBarInPage;

  /// If this bar is half bar, this value is true.
  bool halfBar;

  Bar(this.timeSignature, {
    this.tempoParam = 0,
    this.firstBarInPage = false,
    this.halfBar = false,
  });

  static List<Bar> makeBars(int count, (int, int) timeSignature, {bool firstBarInPage = false}) {
    var bars = <Bar>[];
    for(int i=0; i < count; i++) {
      bars.add(Bar(timeSignature, firstBarInPage: firstBarInPage));
    }
    return bars;
  }

}

/// *** Basic idea ***
/// Divide bar into n segments and calculate time of each segment.
/// Each segment has different time, so we can express 'Ritardando' etc.
extension BarCalculator on Bar {

  List<int> makePlaySegment(int segmentCount, int bpm) {
    var segments = <int>[];
    // Duration of a bar in microsecond
    var barDuration = (60 * 1000 * 1000) / bpm;
    var baseSegDuration = barDuration ~/ segmentCount;

    if(tempoParam == 0) {
      segments = List.generate(segmentCount, (index) => baseSegDuration);
    } else {
      for(int i =0; i < segmentCount; i++) {
        var segDurationWithTempo = baseSegDuration + (tempoParam * i * -1);
        segments.add(segDurationWithTempo);
      }
    }

    return segments;
  }
}