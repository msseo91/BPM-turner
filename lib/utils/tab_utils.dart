
import 'dart:ui';

import 'package:flutter/gestures.dart';


extension PercentCalculator on TapDownDetails {
  double leftPercent(Size size) {
    return ((localPosition.dx / size.width) * 1000).round() / 1000;
  }

  double topPercent(Size size) {
    return ((localPosition.dy / size.height) * 1000).round() / 1000;
  }
}

extension RectCalculator on Rect {
  double leftPoint(Size size) {
    return left * size.width;
  }

  double topPoint(Size size) {
    return top * size.height;
  }

  double heightPixel(Size size) {
    return height * size.height;
  }

  double widthPixel(Size size) {
    return width * size.width;
  }
}
