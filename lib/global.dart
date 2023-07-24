
import 'package:bpm_turner/ui/viewmodel/select_sheet_viewmodel.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

Logger logger = Logger(printer: SimplePrinter(printTime: true));

final getIt = GetIt.instance;

void setup() {
  getIt..
    registerFactory(() => SelectSheetViewModel());
}