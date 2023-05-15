import 'dart:io';
import 'dart:typed_data';

import 'package:bpm_turner/pdf_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

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

  void _showPickFile() async {
    final pickResult = await FilePicker.platform.pickFiles(allowMultiple: false);

    // if no file is picked
    if (pickResult == null) return;

    setState(() {
      _pdfPath = pickResult.files.first.path ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDFScreen(pdfPath: _pdfPath),
      floatingActionButton: FloatingActionButton(
        onPressed: _showPickFile,
        tooltip: 'Pick PDF file from storage.',
        child: const Icon(Icons.file_open),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
