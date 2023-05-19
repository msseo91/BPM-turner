import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:bpm_turner/model/sample/rach_op17.dart';

import 'delay_test.dart';

void main() {
  test('rach test', () async {
    sheet.play(200,
      barCallback: (bar, duration) {
        logger.d("BarCallback dur=$duration");
      },
      lineChangeCallback: (bar) {
        logger.d("Line changed line=${bar.lineIndex}");
      },
      pageChangeCallback: (page) {
        logger.d('Page changed page=$page');
      },
    );

    await Future.delayed(const Duration(seconds: 60));
  });
}