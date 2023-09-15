import 'package:bpm_turner/ui/route/select_sheet_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SplashRoute extends HookWidget {
  static const String route = "/";

  const SplashRoute({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: SimpleTextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SelectSheetRoute.route);
                        },
                        text: "Select sheet music"),
                  )
                ],
              ),
            ),
            Expanded(
              child: SimpleTextButton(
                  onPressed: () {
                    // TODO
                  },
                  text: "Make auto-turning sheet music"),
            ),
          ],
        ),
      ),
    );
  }
}

class SimpleTextButton extends StatelessWidget {
  static const buttonTextStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  static ButtonStyle buttonStyle = OutlinedButton.styleFrom(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
  );

  final String text;
  final VoidCallback? onPressed;

  const SimpleTextButton(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: buttonStyle,
      onPressed: onPressed,
      child: Text(
        text,
        style: buttonTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
