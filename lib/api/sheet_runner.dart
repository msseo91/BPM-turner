import 'package:bpm_turner/data/model/runner_state.dart';
import 'package:bpm_turner/data/model/sheet_bar.dart';
import 'package:bpm_turner/data/model/tempo_sheet.dart';

import '../data/model/progress_line.dart';

///
/// 필요한것 정리
/// Elapse 를 기준으로 프로그레스를 움직이려면 필요한것.
/// 지금이 아니라, 나중에 마디와 단을 그렸을 때(모델) 을 기준으로 정해야 한다.
/// 1. 악보 페이지의 사이즈
/// 2. BPM
/// 3. 한 마디 모델
/// 4. 한 틱에 움질일 거리는 아래와 같다.
///   barWidth / (barDuration / elapseBetweenTick)
/// 5. 현재의 ProgressBar 를 리턴할 수 있어야 한다.
/// 6. 페이지 전환 여부를 리턴할 수 있어야 한다.
///
class SheetRunner {
  final TempoSheet sheet;
  int bpm;
  bool isMetronome = false;

  Duration _barDuration = Duration.zero;
  int _lastTickTime = 0;
  int _lastBeepTime = 0;
  ProgressLine _currentProgressLine = ProgressLine.initial();

  SheetRunner({
    required this.sheet,
    required this.bpm,
    required this.isMetronome,
  }) {
    _barDuration = Duration(milliseconds: bpmDuration(bpm));
    _currentProgressLine = ProgressLine(
      left: sheet.currentBar.barRect.left.toInt(),
      top: sheet.currentBar.barRect.top.toInt(),
      height: sheet.currentBar.barRect.height.toInt(),
    );
  }

  RunnerState onTick(Duration elapse) {
    var elapseBetweenBeep = elapse.inMilliseconds - _lastBeepTime;
    var elapseBetweenTick = elapse.inMilliseconds - _lastTickTime;
    _lastTickTime = elapse.inMilliseconds;

    var barWidth = sheet.currentBar.barRect.width;
    var barDuration = sheet.currentBar.halfBar
        ? (_barDuration.inMilliseconds ~/ 2)
        : _barDuration.inMilliseconds;
    var distance = barWidth ~/ (barDuration / elapseBetweenTick);

    // Move progressLine. TODO - Think when bar is ended.
    _currentProgressLine = ProgressLine(
      left: _currentProgressLine.left + distance,
      top: _currentProgressLine.top,
      height: _currentProgressLine.height,
    );
  }
}
