import 'dart:core';
import 'dart:io';
import 'dart:ui';

import 'package:bpm_turner/data/model/tempo_sheet.dart';
import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:pdf_render/pdf_render.dart';

import 'package:bpm_turner/global.dart';
import 'package:sqflite/sqflite.dart';

const TABLE_SHEET = 'sheet';
const TABLE_PAGE = 'page';
const TABLE_BAR = 'bar';

class SheetRepository {
  late Future<Database> _database;

  SheetRepository() {
    _database = getDatabase();
  }

  Future<Database> getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'sheet_database.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE $TABLE_SHEET(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)',
        );

        await db.execute(
          'CREATE TABLE $TABLE_PAGE(id INTEGER PRIMARY KEY AUTOINCREMENT, sheetId INTEGER, pageIndex INTEGER, sheetImage BLOB)',
        );

        await db.execute(
          'CREATE TABLE $TABLE_BAR(id INTEGER PRIMARY KEY AUTOINCREMENT, pageId INTEGER, left REAL, top REAL, right REAL, bottom REAL)',
        );
      },
      version: 1,
    );
  }

  Future insertSheet(TempoSheet tempoSheet) async {
    var database = await _database;

    var value = {
      'name': tempoSheet.name,
    };
    int sheetId = await database.insert(TABLE_SHEET, value);

    tempoSheet.pages.forEachIndexed((index, page) async {
      if(page.sheetImage == null) {
        throw Exception("Sheet image is null.");
      }
      var bytes = await page.sheetImage?.toByteData();
      var value = {
        'sheetId': sheetId,
        'pageIndex': index,
        'sheetImage': bytes?.buffer.asUint8List(),
      };
      var pageId = await database.insert(TABLE_PAGE, value);

      page.bars.forEach((bar) async {
        var value = {
          'pageId': pageId,
          'left': bar.barRectInPercent.left,
          'top': bar.barRectInPercent.top,
          'right': bar.barRectInPercent.right,
          'bottom': bar.barRectInPercent.bottom,
        };
        await database.insert(TABLE_BAR, value);
      });
    });
  }

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

  Stream<Image> loadSheetImages({required String path, required Size size}) async* {
    var doc = await PdfDocument.openFile(path);
    int pageCount = doc.pageCount;
    for (var i = 1; i <= pageCount; i++) {
      PdfPage page = await doc.getPage(i);
      PdfPageImage pageImage = await page.render(width: size.width.toInt(), height: size.height.toInt());
      yield await pageImage.createImageIfNotAvailable();
    }
  }

  Future<File?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    return result != null ? File(result.files.single.path!) : null;
  }
}
