import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database db;

class DatabaseCreator {
  static const UsersTable = 'Users';

  Future<void> createUsersTable(Database db) async {
    final UsersSql = '''CREATE TABLE $UsersTable
    (
      "id" TEXT PRIMARY KEY,
      "firstName" TEXT,
      "lastName" TEXT,
      "email" TEXT,
      "password" TEXT,  
      "phone" TEXT,
      "avatar" TEXT,
      "token" TEXT,
      "pincode" TEXT,
      "touchId" TEXT
    )''';

    await db.execute(UsersSql);
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    //make sure the folder exists
    if (await Directory(dirname(path)).exists()) {
      //await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDatabase() async {
    final path = await getDatabasePath('MixChat_db');
    db = await openDatabase(path, version: 1, onCreate: onCreate);
    print("database init success");
  }

  Future<void> onCreate(Database db, int version) async {
    await createUsersTable(db);

  }
}
