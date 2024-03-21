import 'dart:core';
import 'dart:io';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:pdf_render/pdf_render.dart';

import 'package:bpm_turner/global.dart';

class SheetRepository {
  void insertSheet() {}

  /// Load sheetMusic(Image) from asset or file in local.
  Future<List<Image>> loadSheetMusic({String? path, String? assetName, required Size size}) async {
    var doc = path != null
        ? await PdfDocument.openFile(path)
        : await PdfDocument.openAsset(assetName!);

    int pageCount = doc.pageCount;
    List<Image> images = [];
    for (var i = 1; i <= pageCount; i++) {
      logger.d("Making $i page to image.");
      PdfPage page = await doc.getPage(i);
      PdfPageImage pageImage = await page.render(width: size.width.toInt(), height: size.height.toInt());
      images.add(await pageImage.createImageIfNotAvailable());
    }
    return images;
  }

  Future<File?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    return result != null ? File(result.files.single.path!) : null;
  }
}
