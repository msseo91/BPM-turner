
import 'dart:ui';

import 'package:flutter/gestures.dart';


extension PercentCalculator on TapDownDetails {
  double leftPercent(Size size) {
    return ((globalPosition.dx / size.width) * 1000).round() / 1000;
  }

  double topPercent(Size size) {
    return ((globalPosition.dy / size.height) * 1000).round() / 1000;
  }
}

extension RectCalculator on Rect {
  int leftPoint(Size size) {
    return (left * size.width).toInt();
  }

  int topPoint(Size size) {
    return (top * size.height).toInt();
  }

  int heightPixel(Size size) {
    return (height * size.height).toInt();
  }

  int widthPixel(Size size) {
    return (width * size.width).toInt();
  }
}
