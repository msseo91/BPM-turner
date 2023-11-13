import 'package:bpm_turner/ui/route/editor_route.dart';
import 'package:bpm_turner/ui/route/player_route.dart';
import 'package:bpm_turner/ui/route/select_sheet_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:bpm_turner/data/sample/rach_op17.dart' as rach;
import 'package:bpm_turner/data/sample/chopin_10_1.dart' as chopin;

class SplashRoute extends HookWidget {
  static const String route = "/";

  const SplashRoute({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SelectorItemWidget(
                  onPressed: () {
                    Navigator.pushNamed(context, SelectSheetRoute.route);
                  },
                  text: "Select sheet music",
                ),
                const SizedBox(width: 16.0),
                SelectorItemWidget(
                  onPressed: () {
                    Navigator.pushNamed(context, EditorRoute.route);
                  },
                  text: "Make auto-turning sheet music",
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                SelectorItemWidget(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        PlayerRoute.route,
                        arguments:
                            PlayerScreenArgs(path: "assets/rach-tarantella.pdf", isAsset: true, sheet: rach.sheet),
                      );
                    },
                    text: "Rach tarantella"),
                const SizedBox(width: 16.0),
                SelectorItemWidget(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        PlayerRoute.route,
                        arguments: PlayerScreenArgs(path: "assets/chopin_10_1.pdf", isAsset: true, sheet: chopin.sheet),
                      );
                    },
                    text: "Chopin 10-1"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SelectorItemWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const SelectorItemWidget({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      height: 150.0,
      child: SimpleTextButton(text: text, onPressed: onPressed),
    ));
  }
}

class SimpleTextButton extends StatelessWidget {
  static const buttonTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  static ButtonStyle buttonStyle = OutlinedButton.styleFrom(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
  );

  final String text;
  final VoidCallback? onPressed;

  const SimpleTextButton({super.key, required this.onPressed, required this.text});

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
