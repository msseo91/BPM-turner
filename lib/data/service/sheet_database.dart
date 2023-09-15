import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart' hide Image;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/sheet_page.dart';

const dbName = "sheet_database.db";
const sheetTableName = "sheet";
const columnId = "id";
const columnName = "name";
const columnImage = "image";

class SheetDatabase {
  late final Database database;

  void init() async {
    WidgetsFlutterBinding.ensureInitialized();

    final database = openDatabase(
      join(await getDatabasesPath(), dbName),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE $sheetTableName('
              '$columnId INTEGER PRIMARY KEY, '
              '$columnName TEXT, '
              '$columnImage BLOB'
              ')',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  void insertSheet(List<MusicPage> pages, List<Image> images) {

  }
}
