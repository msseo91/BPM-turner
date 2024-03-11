part of 'editor_bloc.dart';

@immutable
abstract class EditorEvent {
  const EditorEvent();
}

final class EditorEventLoad extends EditorEvent {}

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

final class EditorEventChangePage extends EditorEvent {
  const EditorEventChangePage({required this.pageIndex});

  final int pageIndex;
}
