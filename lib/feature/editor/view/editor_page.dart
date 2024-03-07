import 'package:bpm_turner/data/model/tempo_sheet.dart';
import 'package:bpm_turner/feature/editor/bloc/editor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditorPage extends StatelessWidget {
  const EditorPage({super.key, required this.tempoSheet});

  final TempoSheet tempoSheet;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditorBloc(),
      child: EditorView(tempoSheet: tempoSheet),
    );
  }
}

class EditorView extends StatelessWidget {
  const EditorView({super.key, required this.tempoSheet});

  final TempoSheet tempoSheet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: SafeArea(
            child: Stack(
          children: [
            GestureDetector(
              child: Container(
                color: Colors.white,
                child: RawImage(
                  image: tempoSheet.currentPage.sheetImage,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
