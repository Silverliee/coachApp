import 'package:coach_app/Model/UserModel.dart';
import 'package:coach_app/database/DatabaseSetup.dart';
import 'package:sqflite/sqflite.dart' as sql;

class UserRepository {
  static Future<sql.Database> db() async {
    return await DatabaseSetup.db();
  }

  static Future<void> insertUser(UserModel user) async {
    final sql.Database db = await UserRepository.db();
    await db.insert(
      'user',
      user.toMap(),
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<UserModel>> getUsers() async {
    final sql.Database db = await UserRepository.db();
    List<Map<String, dynamic>> usersMapList =
        await db.query('user', orderBy: "id");
    return usersMapList.map((userMap) => UserModel.fromMap(userMap)).toList();
  }

  static Future<UserModel?> getUser(int id) async {
    final sql.Database db = await UserRepository.db();
    List<Map<String, dynamic>> usersMapList =
        await db.query('user', where: "id = ?", whereArgs: [id], limit: 1);
    if (usersMapList.isNotEmpty) {
      return UserModel.fromMap(usersMapList.first);
    }
    return null;
  }

  static Future<void> updateUser(UserModel user) async {
    final sql.Database db = await UserRepository.db();
    await db.update(
      'user',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  static Future<void> deleteUser(int id) async {
    final sql.Database db = await UserRepository.db();
    await db.delete(
      'user',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
