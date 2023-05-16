import 'dart:async';

import 'package:bpm_turner/pdf_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:bpm_turner/global.dart' as global;

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

class _MyHomePageState extends State<MyHomePage> {
  var _pdfPath = "";
  var _bpm = 140;
  var _isPlaying = false;
  Timer? _playTimer;

  void _showPickFile() async {
    final pickResult =
        await FilePicker.platform.pickFiles(allowMultiple: false);

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
    if(global.pdfViewController == null) return;

    setState(() {
      _isPlaying = true;
      // TODO - Implement play
    });

    _playTimer = Timer.periodic(const Duration(seconds: 1), play);
  }

  Future<void> play(Timer t) async {
    var currentPage = await global.pdfViewController?.getCurrentPage();
    global.pdfViewController?.setPage((currentPage ?? 0) + 1);
  }

  void pause() {
    setState(() {
      _isPlaying = false;
      // TODO - Implement pause
    });

    _playTimer?.cancel();
  }

  void stop() {
    setState(() {
      _isPlaying = false;
      // TODO -Implement stop
    });

    _playTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        actions: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 40, 0),
            child: Row(children: [
              IconButton(onPressed: () { setBpm(_bpm - 5); }, icon: const Icon(Icons.remove)),
              Text(
                _bpm.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              IconButton(onPressed: () { setBpm(_bpm + 5); }, icon: const Icon(Icons.add)),
            ]),
          ),
          IconButton(
            icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow ),
            onPressed: _isPlaying ? pause : startPlay,
          ),
          IconButton(
            icon: const Icon(Icons.stop),
            onPressed: stop,
          ),
        ],
      ),
      body: PDFScreen(pdfPath: _pdfPath),
      floatingActionButton: FloatingActionButton(
        onPressed: _showPickFile,
        tooltip: 'Pick PDF file from storage.',
        child: const Icon(Icons.file_open),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
