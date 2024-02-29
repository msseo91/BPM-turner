import 'package:bpm_turner/data/model/progress_line.dart';

class RunnerState {
  final bool shouldTurnPage;
  final bool isEnd;
  final ProgressLine progressLine;

  RunnerState(
      {required this.shouldTurnPage,
      required this.progressLine,
      required this.isEnd});
}
