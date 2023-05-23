
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PDFView(
          key: ValueKey(widget.pdfPath),
          filePath: widget.pdfPath,
          enableSwipe: true,
          swipeHorizontal: true,
          autoSpacing: false,
          pageFling: true,
          pageSnap: true,
          fitPolicy: FitPolicy.BOTH,
          preventLinkNavigation: false,
        )
      ],
    );
  }
}
