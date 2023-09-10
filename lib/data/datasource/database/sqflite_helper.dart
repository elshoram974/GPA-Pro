import 'package:gpa_pro/core/constants/app_info.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/data/datasource/database/grades/grade_table_db.dart';
import 'package:gpa_pro/data/datasource/database/subjects/subject_table_db.dart';
import 'package:sqflite/sqflite.dart';

class SQFLiteHelper {
  static Database? _myDb;
  static Future<Database> get _db async => _myDb ??= await _getDb();

  static Future<Database> _getDb() async {
    // Get a location using getDatabasesPath
    String databasesPath = await getDatabasesPath();
    String path = "$databasesPath/cumulative.db";

    // open the database
    Database database = await openDatabase(
      path,
      version: AppInfo.dbVersion,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await GradeTableDB.createGradesTable(db);
        await SubjectTableDB.createSubjectsTable(db);
      },
    );

    return database;
  }

  // insert
  static Future<int> insertData(String table, Map<String, dynamic> map) async {
    Database db = await _db;
    int count = await db.insert(
      table,
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return count;
  }

  static Future<int> updateData(
      int id, String table, Map<String, dynamic> map) async {
    Database db = await _db;
    int count = await db.update(
      table,
      map,
      where: "id = ?",
      whereArgs: [id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return count;
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    Database db = await _db;
    List<Map<String, dynamic>> map = await db.query(table);

    return map;
  }

  static Future<int> delete(String table, int id) async {
    Database db = await _db;
    int count = 0;

    try {
      count = await db.delete(table, where: "id = ?", whereArgs: [id]);
    } catch (e) {
      CustomDialog.errorDialog("$e");
    }
    return count;
  }

  static Future<int> clear(String table) async {
    Database db = await _db;
    int count = 0;

    try {
      count = await db.rawDelete("DELETE FROM $table");
    } catch (e) {
      CustomDialog.errorDialog("$e");
    }
    return count;
  }
}
