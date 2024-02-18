import 'dart:ui';

import 'package:bpm_turner/api/sheet_runner.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:bpm_turner/data/sample/rach_op17.dart';

import '../test/delay_test.dart';


void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Music', () {
    testWidgets('Sheet runner can run music.', (tester) async {
      logger.d("Start runner test");
      tester.createTicker((elapsed) { });

      var runner = SheetRunner(const Size(1040, 2560), tarantella,
          bpm: 180,
          barCallback: (bar, duration) => {
            logger.d("barCallback $bar, $duration")
          },
          lineChangeCallback: (bar) => {
            logger.d("lineChanged $bar")
          },
          pageChangeCallback: (page) => {
            logger.d("pageChanged $page")
          });

      runner.squareDataSubject.listen((squareData) {
        logger.d("Square $squareData");
      });

      runner.playSheet();

      await delayTime(1000 * 30);

      runner.stop();

    });
  });
}
