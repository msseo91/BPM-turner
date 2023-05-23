import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RawGestureCatcher extends StatelessWidget {
  const RawGestureCatcher({
    super.key,
    this.child,
    this.onTap,
    this.onTapDown,
    this.onTapUp,
  });

  final GestureTapCallback? onTap;

  final GestureTapDownCallback? onTapDown;

  final GestureTapUpCallback? onTapUp;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(gestures: {
      AllowMultipleGestureRecognizer: GestureRecognizerFactoryWithHandlers<AllowMultipleGestureRecognizer>(
            () => AllowMultipleGestureRecognizer(), //constructor
            (AllowMultipleGestureRecognizer instance) {
          //initializer
          instance.onTap = onTap;
          instance.onTapDown = onTapDown;
          instance.onTapUp = onTapUp;
        },
      )
    },
    child: child,);
  }
}

class AllowMultipleGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}