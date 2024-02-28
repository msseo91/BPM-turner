import 'package:bpm_turner/data/model/sheet_bar.dart';
import 'package:bpm_turner/data/model/sheet_line.dart';
import 'package:bpm_turner/data/model/sheet_page.dart';
import 'package:equatable/equatable.dart';

/// Represent music sheet.
class TempoSheet extends Equatable {
  final String name;
  final List<MusicPage> pages;
  final int pageIndex;

  const TempoSheet(
    this.name, {
    required this.pages,
    this.pageIndex = 0,
  });

  MusicPage get currentPage => pages[pageIndex];

  Line get currentLine => currentPage.currentLine;

  Bar get currentBar => currentLine.currentBar;

  @override
  List<Object> get props => [name, pageIndex];

  TempoSheet copyWith({
    String? name,
    List<MusicPage>? pages,
    int? pageIndex,
  }) {
    return TempoSheet(
      name ?? this.name,
      pages: pages ?? this.pages,
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }
}
