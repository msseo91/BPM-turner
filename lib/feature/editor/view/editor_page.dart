import 'package:bpm_turner/data/model/tempo_sheet.dart';
import 'package:bpm_turner/feature/editor/bloc/editor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Editor page.
/// Initial - 마지막으로 편집했던 악보를 불러온다.
/// 편집기록이 없다면, 빈화면에 악보 파일을 고를 수 있는 버튼을 제공한다. (버튼은 항시)
///
class EditorPage extends StatelessWidget {
  const EditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditorBloc(),
      child: EditorView(),
    );
  }
}

class EditorView extends StatelessWidget {
  const EditorView({super.key});

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
                  // TODO
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
