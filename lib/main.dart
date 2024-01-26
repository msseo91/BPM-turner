import 'package:bloc/bloc.dart';
import 'package:bpm_turner/global.dart';
import 'package:bpm_turner/ui/route/editor_route.dart';
import 'package:bpm_turner/ui/route/player_route.dart';
import 'package:bpm_turner/ui/route/select_sheet_route.dart';
import 'package:bpm_turner/ui/route/splash_route.dart';
import 'package:bpm_turner/ui/theme/color_schemes.g.dart';
import 'package:flutter/material.dart';

void main() {
  setup();
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      initialRoute: SplashRoute.route,
      routes: {
        SplashRoute.route: (context) => const SplashRoute(),
        SelectSheetRoute.route: (context) => SelectSheetRoute(),
        PlayerRoute.route: (context) => const PlayerRoute(),
        EditorRoute.route: (context) => const EditorRoute(sheetImages: [])
      },
    );
  }
}

class Observer extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    print("Create :: $bloc");
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    print("Close :: $bloc");
    super.onClose(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    print(change);
    super.onChange(bloc, change);
  }
}
