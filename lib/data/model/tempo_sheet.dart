import 'package:bpm_turner/data/model/sheet_bar.dart';
import 'package:bpm_turner/data/model/sheet_page.dart';
import 'package:equatable/equatable.dart';

/// Represent music sheet.
class TempoSheet extends Equatable {
  final String name;
  final List<MusicPage> pages;
  int pageIndex;

  TempoSheet(
    this.name, {
    required this.pages,
    this.pageIndex = 0,
  });

  MusicPage get currentPage => pages[pageIndex];

  Bar get currentBar => currentPage.currentBar;

  @override
  List<Object> get props => [name, pageIndex];

  Bar? nextBar() {
    var bar = currentPage.nextBar();
    if(bar != null) return bar;

    // End of the music.
    return null;
  }

  MusicPage? nextPage() {
    if(pageIndex < pages.length - 1) {
      pageIndex++;
      return currentPage;
    } else {
      return null;
    }
  }

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
