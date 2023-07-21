import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SplashRoute extends HookWidget {
  const SplashRoute({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var buttonSize = 150.0;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: buttonSize,
                width: buttonSize,
                child: FilledButton(
                  onPressed: () {},
                  child: const Text(
                    "Select sheet music",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              const Spacer(),

              SizedBox(
                height: buttonSize,
                width: buttonSize,
                child: FilledButton(
                  onPressed: () {},
                  child: const Text(
                    "Make auto-turning sheet music",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}