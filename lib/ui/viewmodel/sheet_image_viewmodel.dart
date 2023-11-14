import 'dart:async';
import 'dart:ui';

import 'package:bpm_turner/data/sample/chopin_10_1.dart';
import 'package:bpm_turner/global.dart';
import 'package:bpm_turner/ui/route/player_route.dart';
import 'package:flutter/foundation.dart';
import 'package:pdf_render/pdf_render.dart';

const Duration controlDuration = Duration(milliseconds: 3000);

class SheetImageViewModel extends ChangeNotifier {
  final PlayerScreenArgs _args;
  List<Image>? _renderedSheet;

  Image? get currentSheetImage => _renderedSheet?.elementAtOrNull(_currentPage);
  int _currentPage = 0;
  double controlOpacity = 0;
  Timer? _controlTabTimer;

  SheetImageViewModel(this._args) {
    if (_args.isAsset) {
      makePdfImage(assetName: _args.path).then((value) => _updateRenderedSheet(value));
    } else {
      makePdfImage(path: _args.path).then((value) => _updateRenderedSheet(value));
    }
  }

  Future<List<Image>> makePdfImage({String? path, String? assetName}) async {
    var doc = path != null ? await PdfDocument.openFile(path) : await PdfDocument.openAsset(assetName!);

    int pageCount = doc.pageCount;
    List<Image> images = [];
    for (var i = 1; i <= pageCount; i++) {
      logger.d("Making $i page to image.");
      PdfPage page = await doc.getPage(i);
      PdfPageImage pageImage = await page.render(width: 1200, height: 1920);
      images.add(await pageImage.createImageIfNotAvailable());
    }
    return images;
  }

  void _updateRenderedSheet(List<Image> sheets) {
    _renderedSheet = sheets;
    notifyListeners();
  }

  void nextPage() {
    var sheets = _renderedSheet;
    if(sheets == null) return;

    if(_currentPage >= sheets.length - 1) {
      logger.w("Your at last page of music.");
      return;
    }
    _currentPage++;
    notifyListeners();
  }

  void prevPage() {
    if(_currentPage < 1) {
      logger.w("Your at first of page of music.");
      return;
    }
    _currentPage--;
    notifyListeners();
  }

  void onScreenTab() {
    logger.d("tap!");

    _controlTabTimer?.cancel();
    if (controlOpacity == 0) {
      controlOpacity = 0.5;
      _controlTabTimer = Timer(controlDuration, () {
        controlOpacity = 0;
        notifyListeners();
      });
    } else {
      controlOpacity = 0;
    }
    notifyListeners();
  }
}
