import 'package:flutter/material.dart';

import '../../../data/model/sheet_line.dart';

class EditorPainter extends CustomPainter {
  final List<Rect> rects;
  final List<BarDivider> barDividers;

  EditorPainter(this.rects, this.barDividers);

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

    if(barDividers.isNotEmpty) {
      for(var divider in barDividers) {
        canvas.drawLine(
          divider.top,
          divider.bottom,
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
