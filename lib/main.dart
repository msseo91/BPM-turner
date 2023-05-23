import 'dart:async';

import 'package:bpm_turner/overlay/overlay_progress.dart';
import 'package:bpm_turner/pdf_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:bpm_turner/global.dart';
import 'model/sample/rach_op17.dart' as rach;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BPM turner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BPM turner'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  var _pdfPath = "";
  var _bpm = 140;
  var _isPlaying = false;
  var _controlOpacity = 0.0;

  // TODO - Implement pick sheet.
  var sheet = rach.sheet;
  var overlayController = OverlayController();
  var pdfWidgetKey = GlobalKey();
  var showControl = false;

  @override
  void initState() {
    super.initState();
  }

  void _showPickFile() async {
    final pickResult = await FilePicker.platform.pickFiles(allowMultiple: false);

    // if no file is picked
    if (pickResult == null) return;

    setState(() {
      _pdfPath = pickResult.files.first.path ?? "";
    });
  }

  void setBpm(int toBpm) {
    setState(() {
      _bpm = toBpm;
    });
  }

  Future<void> startPlay() async {
    if (pdfViewController == null) return;

    setState(() {
      _isPlaying = true;
    });

    final RenderBox renderBox = pdfWidgetKey.currentContext?.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    final baseH = size.height / 3;
    final baseW = size.width / 5;

    var barIndex = 0;
    sheet.play(_bpm,
        barCallback: (bar, duration) {
          logger.d("Bar $barIndex is started.");
          var l = baseW * barIndex;
          var t = baseH * bar.lineIndex;
          overlayController.draw(
              context, Duration(milliseconds: duration), this, Rect.fromLTRB(l, t, l + baseW, t + baseH));
          barIndex++;
        },
        lineChangeCallback: (bar) {
          barIndex = 0;
          logger.d("Line changed to ${bar.lineIndex}");
        },
        pageChangeCallback: (pageIndex) =>
            {logger.d("Page changed to ${pageIndex + 1}"), pdfViewController?.setPage(pageIndex + 1)});
  }

  void pause() {
    setState(() {
      _isPlaying = false;
    });

    sheet.pause();
  }

  void stop() {
    setState(() {
      _isPlaying = false;
    });
    pdfViewController?.setPage(0);
    overlayController.clear();
    sheet.stop();
  }

  void onScreenTab() {
    setState(() {
      logger.d("InkWell tap!");
      if (_controlOpacity == 0) {
        _controlOpacity = 0.5;
        Timer(const Duration(milliseconds: 3000), () => setState(() => _controlOpacity = 0));
      } else {
        _controlOpacity = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
              children: <Widget>[
              InkWell(
                onTap: onScreenTab,
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: PDFScreen(key: pdfWidgetKey, pdfPath: _pdfPath, sheet: rach.sheet),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: _controlOpacity,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                        color: Colors.black26,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setBpm(_bpm - 5);
                                },
                                icon: const Icon(Icons.remove)),
                            Text(
                              _bpm.toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            IconButton(onPressed: () => setBpm(_bpm + 5), icon: const Icon(Icons.add)),
                            IconButton(
                              icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                              onPressed: _isPlaying ? pause : startPlay,
                            ),
                            IconButton(
                              icon: const Icon(Icons.stop),
                              onPressed: stop,
                            ),
                          ],
                        ))),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: _controlOpacity,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        color: Colors.black26,
                        child: Row(
                          children: [IconButton(onPressed: _showPickFile, icon: const Icon(Icons.file_open))],
                        ))),
              ),
            ],
          )));
  }
}
