
import 'package:bpm_turner/api/sheet_runner.dart';
import 'package:bpm_turner/data/model/tempo_sheet.dart';
import 'package:flutter/material.dart' hide Image;

import '../../data/model/square_data.dart';

const Duration controlDuration = Duration(milliseconds: 3000);

class PlayerViewModel extends ChangeNotifier {
  SheetRunner? _sheetRunner;
  SquareData? squareData;

  PlayerViewModel() {
    _sheetRunner?.squareDataSubject.listen((squareData) {
      this.squareData = squareData;
      notifyListeners();
    });
  }

  void startPlay(Size size, TempoSheet sheet, int bpm, Function(int) pageChangeCallback) {
    _sheetRunner = SheetRunner(size, sheet, bpm: bpm, pageChangeCallback: pageChangeCallback)..playSheet();
  }

  void stopPlay() {
    _sheetRunner?.stop();
  }

}