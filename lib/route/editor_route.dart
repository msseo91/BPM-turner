import 'package:bpm_turner/global.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

/// This class is responsible to edit overlay of sheet music.
/// - View sheet music..
/// - Draw&Edit multiple overlay box.
///
class EditorRoute extends StatefulWidget {
  EditorRoute({
    super.key,
    required this.sheetImages,
  });

  List<ui.Image> sheetImages = [];

  @override
  State createState() => _EditorRouteState();
}

class _EditorRouteState extends State<EditorRoute> {
  bool _showToolbar = false;
  bool _isDrawingMode = false;
  var sheetImageKey = GlobalKey();
  var currentPage = 0;

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return Scaffold(
        //appBar: AppBar(title: const Text("Edit your sheet music overlay"), backgroundColor: colors.primaryContainer),
        body: SafeArea(
      child: Stack(
        children: [
          GestureDetector(
            onTap: onScreenTab,
            //onTapDown: onTabDown,
            //onTapUp: onTabUp,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: widget.sheetImages.isEmpty
                  ? const SizedBox()
                  : RawImage(key: sheetImageKey, image: widget.sheetImages[currentPage]),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Opacity(
                  opacity: 0.9,
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    color: colors.primaryContainer,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: turnPageBackward,
                          iconSize: 40,
                          color: colors.onPrimary,
                          icon: const Icon(Icons.arrow_back),
                        ),
                        IconButton(
                          onPressed: turnPageForward,
                          iconSize: 40,
                          color: colors.onPrimary,
                          icon: const Icon(Icons.arrow_forward),
                        ),
                        IconButton(
                          iconSize: 40,
                          color: colors.onPrimary,
                          icon: Icon(_isDrawingMode ? Icons.edit : Icons.edit_off, color: colors.onTertiary),
                          onPressed: () => setState(() => _isDrawingMode = !_isDrawingMode),
                        ),
                      ],
                    ),
                  )))
        ],
      ),
    ));
  }

  void turnPageBackward() async {
    setState(() {
      if (currentPage > 0) {
        currentPage--;
      }
      logger.d("prevPage=$currentPage");
    });
  }

  void turnPageForward() async {
    setState(() {
      if (widget.sheetImages.length - 1 > currentPage) {
        currentPage++;
      }
      logger.d("nextPage=$currentPage");
    });
  }

  void onScreenTab() {
    logger.d("Tab!");
    setState(() => _showToolbar = !_showToolbar);
  }

  void onTabDown(TapDownDetails details) {
    logger.d("Down x=${details.localPosition.dx}, y=${details.localPosition.dy}");
  }

  void onTabUp(TapUpDetails details) {
    logger.d("Up x=${details.localPosition.dx}, y=${details.localPosition.dy}");
  }
}
