import 'package:bpm_turner/model/sheet_bar.dart';
import 'package:collection/collection.dart';

class TempoSheet {
  TempoSheet(
    this.name, {
    required this.bars,
  });

  final String name;

  /// Array of bar
  List<Bar> bars = [];

  /// Current bar index in currentPage.
  int currentBarIndex = 0;

  /// Current page index.
  int currentPage() {
    int page = 0;

    for (int i = 0; i < bars.length; i++) {
      if (i == currentBarIndex) {
        return page;
      }
      if (bars[i].lastBarInPage) {
        page++;
      }
    }

    return page;
  }
}
