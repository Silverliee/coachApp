import 'package:coach_app/Model/ExerciseProgressModel.dart';
import 'package:coach_app/database/DatabaseSetup.dart';
import 'package:sqflite/sqflite.dart' as sql;

class ExerciseProgressRepository {
  static Future<sql.Database> db() async {
    return await DatabaseSetup.db();
  }

  static Future<void> insertExerciseProgress(
      ExerciseProgressModel exerciseProgress) async {
    final sql.Database db = await ExerciseProgressRepository.db();
    await db.insert(
      'exerciseProgress',
      exerciseProgress.toMap(),
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<ExerciseProgressModel>> getAllExerciseProgress() async {
    final sql.Database db = await ExerciseProgressRepository.db();
    List<Map<String, dynamic>> exerciseProgressMapList =
        await db.query('exerciseProgress', orderBy: "id");
    return exerciseProgressMapList
        .map((exerciseProgressMap) =>
            ExerciseProgressModel.fromMap(exerciseProgressMap))
        .toList();
  }

  static Future<ExerciseProgressModel?> getExerciseProgress(int id) async {
    final sql.Database db = await ExerciseProgressRepository.db();
    List<Map<String, dynamic>> exerciseProgressMapList = await db
        .query('exerciseProgress', where: "id = ?", whereArgs: [id], limit: 1);
    if (exerciseProgressMapList.isNotEmpty) {
      return ExerciseProgressModel.fromMap(exerciseProgressMapList.first);
    }
    return null;
  }

  static Future<void> updateExerciseProgress(
      ExerciseProgressModel exerciseProgress) async {
    final sql.Database db = await ExerciseProgressRepository.db();
    await db.update(
      'exerciseProgress',
      exerciseProgress.toMap(),
      where: 'id = ?',
      whereArgs: [exerciseProgress.id],
    );
  }

  static Future<void> deleteExerciseProgress(int id) async {
    final sql.Database db = await ExerciseProgressRepository.db();
    await db.delete(
      'exerciseProgress',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
