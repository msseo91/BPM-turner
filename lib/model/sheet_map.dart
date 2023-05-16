
import 'package:bpm_turner/model/sheet_bar.dart';

class SheetMap {
  final String name;

  /// 2-dimensional array of the sheet
  List<List<Bar>> sheet = [];

  SheetMap(this.name,
  {
    required this.sheet,
  });
}