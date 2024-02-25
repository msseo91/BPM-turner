
import 'package:bpm_turner/data/model/sheet_page.dart';
import 'package:equatable/equatable.dart';

/// Represent music sheet.
class TempoSheet extends Equatable {
  final String name;
  final List<MusicPage> pages;
  final int pageIndex;

  const TempoSheet(this.name, {
    required this.pages,
    this.pageIndex = 0,
  });

  MusicPage get currentPage => pages[pageIndex];

  @override
  List<Object> get props => [name];
}