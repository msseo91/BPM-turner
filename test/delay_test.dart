import 'package:logger/logger.dart';
import 'package:test/test.dart';

var logger = Logger(printer: SimplePrinter(printTime: true));

void main() {
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
}

Future<void> delayTime(int mils) async {
  var start = DateTime.now().millisecondsSinceEpoch;
  await Future.delayed(Duration(milliseconds: mils));
  var elapse = DateTime.now().millisecondsSinceEpoch - start;
  logger.i("Elapse: $elapse");
}