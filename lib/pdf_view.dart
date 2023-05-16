import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import "global.dart" as global;

class PDFScreen extends StatefulWidget {
  final String pdfPath;

  const PDFScreen({Key? key, required this.pdfPath}) : super(key: key);

  @override
  State<PDFScreen> createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  var pages = 0;
  var currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    if (widget.pdfPath.isEmpty) {
      return const Center(child: Text("Load pdf sheet."));
    }
    print("Build PdfScreen with ${widget.pdfPath}");

    return Stack(
      children: <Widget>[
        PDFView(
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
          // if set to true the link is handled in flutter
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
            print(error.toString());
          },
          onPageError: (page, error) {
            setState(() {
              errorMessage = '$page: ${error.toString()}';
            });
            print('$page: ${error.toString()}');
          },
          onViewCreated: (PDFViewController pdfViewController) {
            global.pdfViewController = pdfViewController;
          },
          onLinkHandler: (String? uri) {
            print('goto uri: $uri');
          },
          onPageChanged: (int? page, int? total) {
            print('page change: $page/$total');
            setState(() {
              currentPage = page ?? 0;
            });
          },
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
