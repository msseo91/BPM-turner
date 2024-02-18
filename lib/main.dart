import 'package:bloc/bloc.dart';
import 'package:bpm_turner/global.dart';
import 'package:bpm_turner/feature/player/player.dart';
import 'package:bpm_turner/feature/editor/editor.dart';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

void main() {
  Bloc.observer = Observer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BPM turner',
      home: PlayerPage(),
    );
  }
}

class Observer extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    logger.d("Create :: $bloc");
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    logger.d("Close :: $bloc");
    super.onClose(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    logger.d(change);
    super.onChange(bloc, change);
  }
}
