import 'dart:ui';

import 'package:bpm_turner/data/model/progress_line.dart';
import 'package:bpm_turner/data/repository/sheet_repository.dart';
import 'package:bpm_turner/feature/player/player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../test/delay_test.dart';


void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Music', () {
    testWidgets('Sheet runner can run music.', (tester) async {
      logger.d("Start runner test");

      await tester.pumpWidget(
        const Scaffold(
          body: Stack(
            children: [
              ProgressLineWidget(
                progressLine: ProgressLine(
                  left: 300,
                  top: 200,
                  height: 100,
                ),
              ),
            ],
          ),
        ),


      );

      await Future.delayed(const Duration(seconds: 60));
    });
  });
}
