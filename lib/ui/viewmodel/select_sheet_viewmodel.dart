
import 'package:bpm_turner/data/repository/sheet_repository.dart';
import 'package:bpm_turner/global.dart';

class SelectSheetViewModel {
  final SheetRepository _sheetRepository;

  SelectSheetViewModel():
      _sheetRepository = getIt.get<SheetRepository>();
}
