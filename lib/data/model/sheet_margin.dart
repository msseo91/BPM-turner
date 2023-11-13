/// Temporal class.
/// Represent margin in music sheet.
/// This class should be replaced after implementing Sheet Editor.
class SheetMargin {
  final int top;
  final int bottom;
  final int left;
  final int right;

  const SheetMargin({
    required this.top,
    required this.bottom,
    required this.left,
    required this.right,
  });
}
