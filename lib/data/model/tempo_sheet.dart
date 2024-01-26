
import 'package:bpm_turner/data/model/sheet_page.dart';
import 'package:equatable/equatable.dart';

class TempoSheet extends Equatable {
  final String name;
  final List<MusicPage> pages;

  TempoSheet(this.name, {
    required this.pages,
  });

  @override
  List<Object> get props => [name];
}