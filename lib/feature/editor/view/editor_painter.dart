import 'package:bpm_turner/data/model/sheet_line.dart';
import 'package:flutter/material.dart';

import '../../../data/model/bar_divider.dart';


class EditorPainter extends CustomPainter {
  final List<SheetLine> lines;

  EditorPainter(this.lines);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    if(lines.isNotEmpty) {
      for(var line in lines) {
        canvas.drawRect(line.rect, paint);
        for(var divider in line.barDividers) {
          canvas.drawLine(
            divider.top,
            divider.bottom,
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
