import 'package:bpm_turner/ui/editor/drawing_board.dart';
import 'package:bpm_turner/ui/editor/drawing_mode.dart';
import 'package:bpm_turner/ui/editor/sketch.dart';
import 'package:bpm_turner/global.dart';
import 'package:flutter/material.dart' hide Image;
import 'dart:ui';

import 'package:flutter_hooks/flutter_hooks.dart';

/// This class is responsible to edit overlay of sheet music.
/// - View sheet music..
/// - Draw&Edit multiple overlay box.
///
class EditorRoute extends HookWidget {
  static const route = "/editor";

  const EditorRoute({
    Key? key,
    required this.sheetImages,
  }) : super(key: key);

  final List<Image> sheetImages;

  @override
  Widget build(BuildContext context) {
    final selectedColor = useState(Colors.red);
    final strokeSize = useState<double>(2);
    final eraserSize = useState<double>(30);
    final drawingMode = useState(DrawingMode.square);
    final filled = useState<bool>(false);
    final polygonSides = useState<int>(3);
    final backgroundImage = useState<Image?>(sheetImages.firstOrNull);
    final currentPage = useState(0);
    final drawOn = useState<bool>(true);

    final canvasGlobalKey = GlobalKey();

    ValueNotifier<Sketch?> currentSketch = useState(null);
    ValueNotifier<List<Sketch>> allSketches = useState([]);

    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 150),
      initialValue: 1,
    );

    var colors = Theme.of(context).colorScheme;

    void nextPage() {
      if (sheetImages.length - 1 > currentPage.value) {
        backgroundImage.value = sheetImages[++currentPage.value];
      }
      logger.d("nextPage=${currentPage.value}");
    }

    void prevPage() {
      if (currentPage.value > 0) {
        backgroundImage.value = sheetImages[--currentPage.value];
      }
      logger.d("prevPage=${currentPage.value}");
    }

    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: DrawingBoard(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          drawingMode: drawingMode,
          selectedColor: selectedColor,
          strokeSize: strokeSize,
          eraserSize: eraserSize,
          sideBarController: animationController,
          currentSketch: currentSketch,
          allSketches: allSketches,
          canvasGlobalKey: canvasGlobalKey,
          filled: filled,
          polygonSides: polygonSides,
          backgroundImage: backgroundImage,
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(7),
        color: colors.primaryContainer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => prevPage(),
              iconSize: 40,
              color: colors.onPrimaryContainer,
              icon: const Icon(Icons.arrow_back),
            ),
            IconButton(
              onPressed: () => nextPage(),
              iconSize: 40,
              color: colors.onPrimaryContainer,
              icon: const Icon(Icons.arrow_forward),
            ),
            IconButton(
              iconSize: 40,
              color: colors.onPrimaryContainer,
              icon: Icon(drawOn.value ? Icons.edit : Icons.edit_off),
              onPressed: () => drawOn.value = !drawOn.value,
            ),
          ],
        ),
      ),
    );
  }
}
