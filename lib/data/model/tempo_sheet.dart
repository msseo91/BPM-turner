
import 'package:bpm_turner/data/model/sheet_page.dart';

class TempoSheet {
  final String name;
  final List<MusicPage> pages;

  TempoSheet(this.name, {
    required this.pages,
  });
}