import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RawGestureCatcher extends StatelessWidget {
  const RawGestureCatcher({
    super.key,
    this.child,
    this.onTap
  });

  final GestureTapCallback? onTap;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(gestures: {
      AllowMultipleGestureRecognizer: GestureRecognizerFactoryWithHandlers<AllowMultipleGestureRecognizer>(
            () => AllowMultipleGestureRecognizer(), //constructor
            (AllowMultipleGestureRecognizer instance) {
          //initializer
          instance.onTap = onTap;
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