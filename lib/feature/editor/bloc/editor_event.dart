part of 'editor_bloc.dart';

@immutable
abstract class EditorEvent {
  const EditorEvent();
}

final class EditorEventLoad extends EditorEvent {
  const EditorEventLoad({required this.screenSize});

  final Size screenSize;
}

final class EditorEventStartDrag extends EditorEvent {
  const EditorEventStartDrag({required this.position});

  final Offset position;
}

final class EditorEventDrag extends EditorEvent {
  const EditorEventDrag({required this.position});

  final Offset position;
}

final class EditorEventEndDrag extends EditorEvent {
  const EditorEventEndDrag();
}

final class EditorEventPageForward extends EditorEvent {
  const EditorEventPageForward();
}

final class EditorEventPageBackward extends EditorEvent {
  const EditorEventPageBackward();
}

