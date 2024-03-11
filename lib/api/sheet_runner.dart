
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:bpm_turner/data/model/runner_state.dart';
import 'package:bpm_turner/data/model/sheet_bar.dart';
import 'package:bpm_turner/data/model/tempo_sheet.dart';
import 'package:bpm_turner/global.dart';
import 'package:bpm_turner/utils/tab_utils.dart';

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
  final Size size;

  Duration _barDuration = Duration.zero;
  int _lastTickTime = 0;
  int _lastBeatTime = 0;
  int _lastBarTime = 0;
  ProgressLine _currentProgressLine = ProgressLine.initial();
  bool _isFirstTick = true;
  /// Beat(metronome) duration.
  int _beatDuration = 0;

  /// Audio for metronome sound.
  final AudioPlayer _player = AudioPlayer()
    ..setSource(AssetSource('metronome.mp3'))
    // ..setPlayerMode(PlayerMode.lowLatency)
    ..setReleaseMode(ReleaseMode.stop)
    ..seek(Duration.zero);

  SheetRunner({
    required this.size,
    required this.sheet,
    required this.bpm,
    required this.isMetronome,
  }) {
    _barDuration = Duration(milliseconds: barDuration(bpm));
    _beatDuration = _barDuration.inMilliseconds ~/ 2;
    logger.i("Bar duration: ${_barDuration.inMilliseconds}", "Beat duration: $_beatDuration");

    _currentProgressLine = ProgressLine(
      left: sheet.currentBar.barRectInPercent.leftPoint(size),
      top: sheet.currentBar.barRectInPercent.topPoint(size),
      height: sheet.currentBar.barRectInPercent.heightPixel(size),
    );
  }

  RunnerState onTick(Duration elapse) {
    var shouldTurnPage = false;
    var isEndMusic = false;
    var elapseFromBeat = elapse.inMilliseconds - _lastBeatTime;
    var elapseFromTick = elapse.inMilliseconds - _lastTickTime;
    _lastTickTime = elapse.inMilliseconds;

    var barWidth = sheet.currentBar.barRectInPercent.widthPixel(size);
    var barDuration = sheet.currentBar.halfBar
        ? (_barDuration.inMilliseconds ~/ 2)
        : _barDuration.inMilliseconds;
    var distance = barWidth / (barDuration / elapseFromTick);

    // Check end of the bar.
    if ((elapse.inMilliseconds - _lastBarTime >= barDuration)) {
      // We passed 'end of the bar'. Change it!
      logger.d("Next bar");
      if(sheet.nextBar() == null) {
        shouldTurnPage = true;
        logger.d("Turn page!");
        // We are end of the page.
        if(sheet.nextPage() == null) {
          // End of music.
          isEndMusic = true;
        }
      }
      _currentProgressLine = ProgressLine(
        left: sheet.currentBar.barRectInPercent.leftPoint(size),
        top: sheet.currentBar.barRectInPercent.topPoint(size),
        height: sheet.currentBar.barRectInPercent.heightPixel(size),
      );
      _lastBarTime = elapse.inMilliseconds;
    } else {
      // We are in the middle of the bar.
      // Move progressLine.
      _currentProgressLine = ProgressLine(
        left: _currentProgressLine.left + distance,
        top: _currentProgressLine.top,
        height: _currentProgressLine.height,
      );
    }

    // Check make beat.
    if (_isFirstTick || elapseFromBeat >= _beatDuration) {
      logger.i("Elapse between beat: $elapseFromBeat ms");
      _lastBeatTime = elapse.inMilliseconds;

      if (isMetronome) {
        _player.resume().then((value) => _player.seek(Duration.zero));
      }
    }

    _isFirstTick = false;
    return RunnerState(
        shouldTurnPage: shouldTurnPage,
        isEnd: isEndMusic,
        progressLine: _currentProgressLine,
        sheet: sheet,
    );
  }
}
