import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

var logger = Logger(printer: SimplePrinter(printTime: true));

void main() {
  var testDuration = const Duration(milliseconds: 450);

  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance
      ..resetEpoch()
      ..platformDispatcher.onBeginFrame = null
      ..platformDispatcher.onDrawFrame = null;
  });

  test('Delay timing',  () async {
    var start = DateTime.now().millisecondsSinceEpoch;
    var timeInEachBar = 450;
    var barCount = 10;

    for(var i = 0; i < barCount; i++) {
      await delayTime(timeInEachBar);
    }
    var totalElapse = DateTime.now().millisecondsSinceEpoch - start;
    logger.w("Total elapse: $totalElapse ms, Ideally ${timeInEachBar * barCount} ms");
  });

  test('Test ticker timing', () async {
    var vsync = TestVSync();
    var ticker = vsync.createTicker((elapsed) {
      logger.d("Ticker! ${elapsed.inMilliseconds} ms");
    });

    await ticker.start();
  });

  test('Test with timer', () async {
    var start = DateTime.now().millisecondsSinceEpoch;
    var timer = Timer.periodic(testDuration, (timer) {
      logger.i("Timer: ${timer.tick}");
      var now = DateTime.now().millisecondsSinceEpoch;
      logger.i("Elapse=${now - start} ms");
      start = now;
    });

    await Future.delayed(const Duration(seconds: 20));
  });
}

Future<void> delayTime(int mils) async {
  var start = DateTime.now().millisecondsSinceEpoch;
  await Future.delayed(Duration(milliseconds: mils));
  var elapse = DateTime.now().millisecondsSinceEpoch - start;
  logger.i("Elapse: $elapse");
}