part of 'editor_bloc.dart';

@immutable
abstract class EditorState {
  const EditorState({
    required this.lines,
    required this.sheet,
    required this.drawMode,
  });

  final List<SheetLine> lines;
  final TempoSheet? sheet;
  final DrawMode drawMode;
}

class EditorStateInitial extends EditorState {
  EditorStateInitial() : super(
      lines: List<SheetLine>.empty(),
      sheet: null,
      drawMode: DrawMode.line,
  );
}

class EditorStateRects extends EditorState {
  const EditorStateRects({
    required super.lines, required super.sheet, required super.drawMode,
  });
}

class EditorStateLoaded extends EditorState {
  const EditorStateLoaded({
    required super.lines, required super.sheet, required super.drawMode,
  });
}