import 'package:bloc/bloc.dart';
import 'package:bpm_turner/data/repository/sheet_repository.dart';
import 'package:bpm_turner/data/sample/rach_op17.dart';
import 'package:bpm_turner/feature/sheet_navigation.dart';
import 'package:bpm_turner/global.dart';
import 'package:bpm_turner/feature/player/player.dart';
import 'package:bpm_turner/feature/editor/editor.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

void main() {
  // Bloc.observer = Observer();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State createState() => _AppState();
}

class _AppState extends State<MyApp> {
  late final SheetRepository _sheetRepository;

  @override
  void initState() {
    super.initState();
    _sheetRepository = SheetRepository();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _sheetRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BPM turner',
      navigatorKey: _navigatorKey,
      home: const PlayerPage(),
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
    logger.d("onChange :: $change");
    super.onChange(bloc, change);
  }
}
