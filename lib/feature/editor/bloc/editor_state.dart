part of 'editor_bloc.dart';

@immutable
abstract class EditorState {
  const EditorState({
    required this.rects,
    required this.sheet,
    required this.drawMode,
    required this.barDividers,
  });

  final List<Rect> rects;
  final List<BarDivider> barDividers;
  final TempoSheet? sheet;
  final DrawMode drawMode;
}

class EditorStateInitial extends EditorState {
  EditorStateInitial() : super(
      rects: List<Rect>.empty(),
      sheet: null,
      drawMode: DrawMode.line,
      barDividers: List<BarDivider>.empty(),
  );
}

class EditorStateRects extends EditorState {
  const EditorStateRects({
    required super.rects, required super.sheet, required super.drawMode, required super.barDividers,
  });
}

class EditorStateLoaded extends EditorState {
  const EditorStateLoaded({
    required super.rects, required super.sheet, required super.drawMode, required super.barDividers,
  });
}