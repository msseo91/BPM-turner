import 'dart:async';

import 'package:bpm_turner/global.dart';
import 'package:bpm_turner/route/editor_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:bpm_turner/model/sample/rach_op17.dart' as rach;
import 'package:pdf_render/pdf_render.dart';
import '../overlay/overlay_progress.dart';
import 'dart:ui' as ui;

class MusicRoute extends StatefulWidget {
  const MusicRoute({super.key});

  @override
  State<MusicRoute> createState() => _MusicRouteState();
}

class _MusicRouteState extends State<MusicRoute> with TickerProviderStateMixin {
  final double iconSize = 40;

  var _pdfPath = "";
  var _bpm = 160;
  var _isPlaying = false;
  var _controlOpacity = 0.0;
  Timer? _controlTabTimer;

  // TODO - Implement pick sheet.
  var sheet = rach.sheet;
  List<ui.Image> sheetImages = [];
  var currentPage = 0;
  var overlayController = OverlayController();
  var sheetImageKey = GlobalKey();
  var showControl = false;
  var _makeMetronomeSound = false;

  @override
  void initState() {
    super.initState();

    sheet.init(this);

    // Open default page.
    setState(() {
      _makePdfImage(assetName: "assets/rach-tarantella.pdf").then((value) => setState(() {
        sheetImages = value;
        currentPage = 0;
      }));
    });
  }

  void _showPickFile() async {
    final pickResult =
        await FilePicker.platform.pickFiles(allowMultiple: false);

    // if no file is picked
    if (pickResult == null) return;

    setState(() {
      _pdfPath = pickResult.files.first.path ?? "";
      _makePdfImage(path: _pdfPath).then((value) => setState(() {
            sheetImages = value;
            currentPage = 0;
          }));
    });
  }

  Future<List<ui.Image>> _makePdfImage({String? path, String? assetName}) async {
    var doc = path != null ? await PdfDocument.openFile(path)
        : await PdfDocument.openAsset(assetName!);

    int pageCount = doc.pageCount;
    List<ui.Image> images = [];
    for (var i = 1; i <= pageCount; i++) {
      logger.d("Making $i page to image.");
      PdfPage page = await doc.getPage(i);
      PdfPageImage pageImage = await page.render();
      images.add(await pageImage.createImageIfNotAvailable());
    }
    return images;
  }

  void setBpm(int toBpm) {
    setState(() {
      _bpm = toBpm;
    });
  }

  Future<void> startPlay() async {
    setState(() {
      _isPlaying = true;
    });

    final RenderBox renderBox =
        sheetImageKey.currentContext?.findRenderObject() as RenderBox;

    var barIndex = 0;
    sheet.play(_bpm, this, context, renderBox.size,
        barCallback: (bar, duration) {
      logger.d("Bar $barIndex is started.");
      barIndex++;
    }, lineChangeCallback: (bar) {
      barIndex = 0;
      logger.d("Line changed to ${bar.lineIndex}");
    }, pageChangeCallback: (pageIndex) {
      logger.d("Page changed to ${pageIndex + 1}");
      setState(() {
        currentPage = pageIndex + 1;
      });
    });
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
      currentPage = 0;
    });
    overlayController.clear();
    sheet.stop();
  }

  void onScreenTab() {
    setState(() {
      logger.d("InkWell tap!");
      if (_controlOpacity == 0) {
        _controlOpacity = 0.5;
        _controlTabTimer?.cancel();
        _controlTabTimer = Timer(const Duration(milliseconds: 3000),
            () => setState(() => _controlOpacity = 0));
      } else {
        _controlTabTimer?.cancel();
        _controlOpacity = 0;
      }
    });
  }

  void _nextPage() {
    setState(() {
      if(sheetImages.length - 1 > currentPage) {
        currentPage++;
      }
      logger.d("nextPage=$currentPage");
    });
  }

  void _prevPage() {
    setState(() {
      if(currentPage > 0) {
        currentPage--;
      }
      logger.d("prevPage=$currentPage");
    });
  }

  void toggleMetronome() {
    setState(() {
      _makeMetronomeSound = !_makeMetronomeSound;
      sheet.playMetronome = _makeMetronomeSound;
    });
  }

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: onScreenTab,
              behavior: HitTestBehavior.translucent,
              onHorizontalDragEnd: (dragEndDetails) {
                var velocity = dragEndDetails.primaryVelocity ?? 0;
                if (velocity < 0) {
                  _nextPage();
                } else if (velocity > 0) {
                  _prevPage();
                }
              },
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: sheetImages.isEmpty
                    ? const SizedBox()
                    : RawImage(key: sheetImageKey, image: sheetImages[currentPage]),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: _controlOpacity,
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      color: colors.secondaryContainer,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () => setBpm(_bpm - 5),
                              iconSize: iconSize,
                              color: colors.onSecondaryContainer,
                              icon: const Icon(Icons.remove)),
                          Text(
                            _bpm.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: colors.onSecondaryContainer,
                            ),
                          ),
                          IconButton(
                              onPressed: () => setBpm(_bpm + 5),
                              iconSize: iconSize,
                              color: colors.onSecondaryContainer,
                              icon: const Icon(Icons.add)),
                          IconButton(
                            iconSize: iconSize,
                            color: colors.onSecondaryContainer,
                            icon: Icon(
                                _isPlaying ? Icons.pause : Icons.play_arrow),
                            onPressed: _isPlaying ? pause : startPlay,
                          ),
                          IconButton(
                            iconSize: iconSize,
                            color: colors.onSecondaryContainer,
                            icon: const Icon(Icons.stop),
                            onPressed: stop,
                          ),
                          IconButton(
                            iconSize: iconSize,
                            color: colors.onSecondaryContainer,
                            icon: Icon(_makeMetronomeSound
                                ? Icons.volume_up
                                : Icons.volume_off),
                            onPressed: toggleMetronome,
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
                      color: colors.secondaryContainer,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EditorRoute(pdfPath: _pdfPath)),
                                );
                              },
                              iconSize: iconSize,
                              color: colors.onSecondaryContainer,
                              icon: const Icon(Icons.edit_note)),
                          IconButton(
                              onPressed: _showPickFile,
                              iconSize: iconSize,
                              color: colors.onSecondaryContainer,
                              icon: const Icon(Icons.file_open))
                        ],
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
