import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SplashRoute extends HookWidget {
  const SplashRoute({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var buttonSize = 300.0;
    var buttonStyle = OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
        )
    );
    var buttonTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: buttonSize,
                width: buttonSize,
                child: FilledButton(
                  style: buttonStyle,
                  onPressed: () {},
                  child: const Text(
                    "Select sheet music",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              SizedBox(
                height: buttonSize,
                width: buttonSize,
                child: FilledButton(
                  style: buttonStyle,
                  onPressed: () {},
                  child: const Text(
                    "Make auto-turning sheet music",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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