
import 'package:bpm_turner/ui/viewmodel/select_sheet_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'data/repository/sheet_repository.dart';
import 'data/service/sheet_database.dart';

Logger logger = Logger(printer: SimplePrinter(printTime: true));

final getIt = GetIt.instance;

void setup() {
  getIt
    ..registerFactory(() => SelectSheetViewModel())
    ..registerFactory(() => SheetRepository())
    ..registerFactory(() => SheetDatabase());
}