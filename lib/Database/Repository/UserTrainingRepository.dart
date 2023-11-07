import 'package:coach_app/Model/UserTrainingModel.dart';
import 'package:coach_app/database/DatabaseSetup.dart';
import 'package:sqflite/sqflite.dart' as sql;

class UserTrainingRepository {
  static Future<sql.Database> db() async {
    return await DatabaseSetup.db();
  }

  static Future<void> insertUserTraining(UserTrainingModel userTraining) async {
    final sql.Database db = await UserTrainingRepository.db();
    await db.insert(
      'userTraining',
      userTraining.toMap(),
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<UserTrainingModel>> getUserTrainings() async {
    final sql.Database db = await UserTrainingRepository.db();
    List<Map<String, dynamic>> userTrainingsMapList =
        await db.query('userTraining', orderBy: "id");
    return userTrainingsMapList
        .map((userTrainingMap) => UserTrainingModel.fromMap(userTrainingMap))
        .toList();
  }

  static Future<UserTrainingModel?> getUserTraining(int id) async {
    final sql.Database db = await UserTrainingRepository.db();
    List<Map<String, dynamic>> userTrainingMapList = await db
        .query('userTraining', where: "id = ?", whereArgs: [id], limit: 1);
    if (userTrainingMapList.isNotEmpty) {
      return UserTrainingModel.fromMap(userTrainingMapList.first);
    }
    return null;
  }

  static Future<void> updateUserTraining(UserTrainingModel userTraining) async {
    final sql.Database db = await UserTrainingRepository.db();
    await db.update(
      'userTraining',
      userTraining.toMap(),
      where: 'id = ?',
      whereArgs: [userTraining.id],
    );
  }

  static Future<void> deleteUserTraining(int id) async {
    final sql.Database db = await UserTrainingRepository.db();
    await db.delete(
      'userTraining',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
