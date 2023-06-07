import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'global.dart';
import 'model/sheet_music.dart';
import 'mwidget/raw_gesture.dart';

class PDFScreen extends StatefulWidget {
  final String pdfPath;
  final TempoSheet? sheet;
  final GestureTapCallback? onScreenTab;

  const PDFScreen({Key? key, required this.pdfPath, this.sheet, this.onScreenTab}) : super(key: key);

  @override
  State<PDFScreen> createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  var pages = 0;
  var currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.pdfPath.isEmpty) {
      return RawGestureCatcher(
          onTap: widget.onScreenTab,
          child: Container(
            constraints: const BoxConstraints.expand(),
            child: const Center(child: Text("Load pdf sheet.")),
          ));
    }
    logger.d("Build PDF Screen with ${widget.pdfPath}");

    return Stack(
      children: <Widget>[
        RawGestureCatcher(
          onTap: widget.onScreenTab,
          child: PDFView(
            key: ValueKey(widget.pdfPath),
            filePath: widget.pdfPath,
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: false,
            pageFling: true,
            pageSnap: true,
            defaultPage: currentPage,
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation: false,
            onRender: (pages) {
              setState(() {
                this.pages = pages ?? 0;
                isReady = true;
              });
            },
            onError: (error) {
              setState(() {
                errorMessage = error.toString();
              });
              logger.e(error.toString());
            },
            onPageError: (page, error) {
              setState(() {
                errorMessage = '$page: ${error.toString()}';
              });
              logger.e('$page: ${error.toString()}');
            },
            onViewCreated: (PDFViewController controller) {
              pdfViewController = controller;
            },
            onLinkHandler: (String? uri) {
              logger.d('goto uri: $uri');
            },
            onPageChanged: (int? page, int? total) {
              logger.d('page change: $page/$total');
              setState(() {
                currentPage = page ?? 0;
              });
            },
          ),
        ),
        errorMessage.isEmpty
            ? !isReady
                ? const Center(child: CircularProgressIndicator())
                : Container()
            : Center(child: Text(errorMessage))
      ],
    );
  }
}

class SimpleRecognizer extends OneSequenceGestureRecognizer {

  @override
  void handleEvent(PointerEvent event) {
    logger.d("SimpleRecognizer: ${event.runtimeType}");
  }

  @override
  void didStopTrackingLastPointer(int pointer) {
    logger.d("SimpleRecognizer: didStopTrackingLastPointer");
  }

  @override
  String get debugDescription {
    return "SimpleRecognizer";
  }

}