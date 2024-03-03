import 'package:bpm_turner/data/model/progress_line.dart';
import 'package:bpm_turner/data/model/tempo_sheet.dart';

class RunnerState {
  final bool shouldTurnPage;
  final bool isEnd;
  final ProgressLine progressLine;
  final /**/TempoSheet sheet;

  RunnerState(
      {required this.shouldTurnPage,
      required this.progressLine,
      required this.isEnd,
      required this.sheet,});
}
