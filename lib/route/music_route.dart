
import 'dart:async';

import 'package:bpm_turner/global.dart';
import 'package:bpm_turner/pdf_view.dart';
import 'package:bpm_turner/route/editor_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bpm_turner/model/sample/rach_op17.dart' as rach;

import '../mwidget/raw_gesture.dart';
import '../overlay/overlay_progress.dart';

class MusicRoute extends StatefulWidget {
  const MusicRoute({super.key});

  @override
  State<MusicRoute> createState() => _MusicRouteState();
}

class _MusicRouteState extends State<MusicRoute> with TickerProviderStateMixin {
  final double iconSize = 40;

  var _pdfPath = "";
  var _bpm = 140;
  var _isPlaying = false;
  var _controlOpacity = 0.0;
  Timer? _controlTabTimer;

  // TODO - Implement pick sheet.
  var sheet = rach.sheet;
  var overlayController = OverlayController();
  var pdfWidgetKey = GlobalKey();
  var showControl = false;
  var _makeMetronomeSound = false;

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
        pageChangeCallback: (pageIndex) {
          logger.d("Page changed to ${pageIndex + 1}");
          pdfViewController?.setPage(pageIndex + 1);
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
        _controlTabTimer?.cancel();
        _controlTabTimer = Timer(const Duration(milliseconds: 3000), () => setState(() => _controlOpacity = 0));
      } else {
        _controlTabTimer?.cancel();
        _controlOpacity = 0;
      }
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
    return Scaffold(
        body: SafeArea(
            child: Stack(
              children: <Widget>[
                InkWell(
                  onTap: onScreenTab,
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: RawGestureCatcher(
                      onTap: onScreenTab,
                      child: PDFScreen(key: pdfWidgetKey, pdfPath: _pdfPath, sheet: rach.sheet),
                    ),
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
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () => setBpm(_bpm - 5),
                                  iconSize: iconSize,
                                  icon: const Icon(Icons.remove)
                              ),
                              Text(
                                _bpm.toString(),
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              IconButton(
                                  onPressed: () => setBpm(_bpm + 5),
                                  iconSize: iconSize,
                                  icon: const Icon(Icons.add)
                              ),
                              IconButton(
                                iconSize: iconSize,
                                icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                                onPressed: _isPlaying ? pause : startPlay,
                              ),
                              IconButton(
                                iconSize: iconSize,
                                icon: const Icon(Icons.stop),
                                onPressed: stop,
                              ),
                              IconButton(
                                iconSize: iconSize,
                                icon: Icon(_makeMetronomeSound ? Icons.volume_up : Icons.volume_off),
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
                          color: Colors.black26,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => EditorRoute(pdfPath: _pdfPath)),
                                    );
                                  },
                                  icon: const Icon(Icons.edit_note)
                              ),
                              IconButton(
                                  onPressed: _showPickFile,
                                  iconSize: iconSize,
                                  icon: const Icon(Icons.file_open)
                              )
                            ],
                          ))),
                ),
              ],
            )));
  }
}

