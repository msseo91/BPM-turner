import 'package:flutter/material.dart';

class EditorPainter extends CustomPainter {
  final List<Rect> rects;

  EditorPainter(this.rects);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    if(rects.isNotEmpty) {
      for (var rect in rects) {
        canvas.drawRect(rect, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
