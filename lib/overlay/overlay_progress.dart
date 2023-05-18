import 'package:flutter/material.dart';

class OverlayController {
  OverlayEntry? lastOverlay;

  void draw(BuildContext context, Duration duration, TickerProvider vsync,
      Rect barRect) async {
    var controller = AnimationController(duration: duration, vsync: vsync);
    var barWidth = barRect.width;
    var moveWidth = barWidth / 60;
    var animation = IntTween(begin: 0, end: 60).animate(controller);
    animation.addListener(() {
      lastOverlay?.remove();

      var leftPosition = moveWidth * animation.value;
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
    controller.forward();
  }
}
