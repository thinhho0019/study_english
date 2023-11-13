import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_study_english/model/category.dart';
import 'package:flutter_study_english/model/question.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'db_english.db');
    return await openDatabase(path, version: 1);
  }

  Future<void> copyDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'db_english.db');
    // Kiểm tra xem tệp đã tồn tại hay chưa
    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      // Nếu chưa tồn tại, sao chép từ assets
      ByteData data = await rootBundle.load('assets/db_english.db');
      List<int> bytes = data.buffer.asUint8List();
      await File(path).writeAsBytes(bytes);
    }
  }

  Future<List<category>> getAllCategory() async {
    Database db = await database;
    List<Map<dynamic, dynamic>> temp =
        await db.rawQuery("select * from category");

    return temp.map((e) => category.fromMap(e)).toList();
  }

  Future<List<question>> getAllAsk(int id) async {
    Database db = await database;
    List<Map<dynamic, dynamic>> temp = await db.rawQuery(
      "select * from question where id_category=?",
      [id],
    );
    List<question> cate = temp.map((e) => question.fromMap(e)).toList();
    //print(cate);
    return cate;
  }
}
