import 'package:chatup/Models/CoreUser.dart';
import 'package:chatup/Storage/databaseCreator.dart';

class UsersRepository {
  static Future<List<CoreUser>> getAllUsers() async {
    await Future.delayed(Duration(seconds: 3));
    await DatabaseCreator().initDatabase();
    final sql = '''
      SELECT * FROM '${DatabaseCreator.UsersTable}'
    ''';
    final data = await db.rawQuery(sql);
    List<CoreUser> users = List();

    for (final node in data) {
      final user = CoreUser.fromJson(node);
      users.add(user);
    }
    return users;
  }

  static Future<CoreUser> getConnectedUser() async {
    await DatabaseCreator().initDatabase();
    final sql = '''
      SELECT * FROM '${DatabaseCreator.UsersTable}'
    ''';
    final data = await db.rawQuery(sql);
    if(data.length!=0){
      final user = CoreUser.fromJson(data.last);
      return user;
    }
    return null;
  }

  static Future<CoreUser> getUser(int id) async {
    final sql = '''
      SELECT * FROM ${DatabaseCreator.UsersTable}
      WHERE "id" = ?
    ''';

    List<dynamic> params = [id];

    final data = await db.rawQuery(sql, params);

    final user = CoreUser.fromJson(data.first);
    return user;
  }

  static Future<void> addUser(CoreUser user) async {
    await DatabaseCreator().initDatabase();

    final sql = '''INSERT INTO ${DatabaseCreator.UsersTable}
    (
      "id",
      "firstName",
      "lastName",
      "email",
      "password",
      "phone",
      "avatar",
      "token",
      "pincode",
      "touchId"
    )
    VALUES (?,?,?,?,?,?,?,?,?,?)''';

    List<dynamic> params = [user.id,user.firstName, user.lastName, user.email, user.password,user.phone,user.avatar,user.token,user.pincode,user.touchId];

    final result = await db.rawInsert(sql, params);
    print("user inserted");
  }

  static Future<void> deleteUser(CoreUser user) async {

    final sql = '''DELETE FROM ${DatabaseCreator.UsersTable}
    WHERE "id" = ?
    ''';

    List<dynamic> params = [user.id];
    final result = await db.rawDelete(sql, params);

    print("user deleted");
  }

  static Future<void> deleteConnectedUser() async {
    CoreUser user = await getConnectedUser();
    final sql = '''DELETE FROM ${DatabaseCreator.UsersTable}
    WHERE "id" = ?
    ''';

    List<dynamic> params = [user.id];
    final result = await db.rawDelete(sql, params);

    print("user deleted");
  }

  static Future<void> updateUser(CoreUser user) async {
    final sql = '''
    UPDATE ${DatabaseCreator.UsersTable}
    SET "firstName" = ?, 
        "lastName" = ?, 
        "email" = ?,
        "password" = ?,
        "phone" = ?,
        "avatar" = ?,
        "token" = ?,
        "pincode" = ?,
        "touchId" = ?
    WHERE "id" = ?
    ''';

    List<dynamic> params = [user.firstName, user.lastName, user.email, user.password, user.phone, user.avatar, user.token, user.pincode, user.touchId, user.id];
    final result = await db.rawUpdate(sql, params);

    print("user updated");
  }

}