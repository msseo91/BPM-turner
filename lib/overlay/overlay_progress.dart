import 'package:flutter/material.dart';

class OverlayController {
  OverlayEntry? lastOverlay;
  AnimationController? _controller;

  void draw(BuildContext context, Duration duration, TickerProvider vsync,
      Rect barRect) async {
    _controller = AnimationController(duration: duration, vsync: vsync);

    var barWidth = barRect.width;
    var moveWidth = barWidth / 60;
    var animation = IntTween(begin: 0, end: 60).animate(_controller!);
    animation.addListener(() {
      lastOverlay?.remove();

      var leftPosition = barRect.left + moveWidth * animation.value;
      lastOverlay = OverlayEntry(
        builder: (BuildContext context) {
          return Positioned(
            left: leftPosition,
            top: barRect.top,
            height: barRect.height,
            child: const VerticalDivider(
              color: Colors.red,
            ),
          );
        },
      );

      Overlay.of(context).insert(lastOverlay!);
    });
    _controller?.forward(from: 0);
  }

  void clear() {
    _controller?.dispose();
    _controller = null;
  }
}
