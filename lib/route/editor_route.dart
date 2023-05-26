import 'package:bpm_turner/global.dart';
import 'package:bpm_turner/mwidget/raw_gesture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

/// This class is responsible to edit overlay of sheet music.
/// - View sheet music..
/// - Draw&Edit multiple overlay box.
///
class EditorRoute extends StatefulWidget {
  EditorRoute({
    super.key,
    required this.pdfPath,
  });

  String pdfPath;

  @override
  State createState() => _EditorRouteState();
}

class _EditorRouteState extends State<EditorRoute> {
  bool _showToolbar = false;
  bool _isDrawingMode = false;

  PDFViewController? _controller;

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return Scaffold(
        //appBar: AppBar(title: const Text("Edit your sheet music overlay"), backgroundColor: colors.primaryContainer),
        body: SafeArea(
      child: Stack(
        children: [
          RawGestureCatcher(
            onTap: onScreenTab,
            //onTapDown: onTabDown,
            //onTapUp: onTabUp,
            child: PDFView(
              key: ValueKey(widget.pdfPath),
              filePath: widget.pdfPath,
              swipeHorizontal: true,
              autoSpacing: false,
              fitPolicy: FitPolicy.BOTH,
              preventLinkNavigation: false,
              onViewCreated: (c) => _controller = c,
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
    if(_controller == null) return;

    var page = (await _controller!.getCurrentPage()) ?? 0;
    if(page > 0) page -= 1;
    _controller?.setPage(page);
  }

  void turnPageForward() async {
    if(_controller == null) return;

    var page = (await _controller!.getCurrentPage()) ?? 0;
    _controller?.setPage(page + 1);
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
