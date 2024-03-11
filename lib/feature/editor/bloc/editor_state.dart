part of 'editor_bloc.dart';

@immutable
abstract class EditorState {
  const EditorState({
    required this.rects,
    required this.sheet,
  });

  final List<Rect> rects;
  final TempoSheet? sheet;
}

class EditorStateInitial extends EditorState {
  EditorStateInitial() : super(rects: List<Rect>.empty(), sheet: null);
}

class EditorStateRects extends EditorState {
  const EditorStateRects({
    required super.rects, required super.sheet,
  });
}

class EditorStateLoaded extends EditorState {
  const EditorStateLoaded({
    required super.rects, required super.sheet,
  });
}