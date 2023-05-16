
import 'package:bpm_turner/model/sheet_bar.dart';

class TempoSheet {
  final String name;

  /// 2-dimensional array of the sheet
  List<List<Bar>> bars = [];

  TempoSheet(this.name,
  {
    required this.bars,
  });
}