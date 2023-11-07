import 'package:coach_app/Model/ExerciseModel.dart';
import 'package:coach_app/database/DatabaseSetup.dart';
import 'package:sqflite/sqflite.dart' as sql;

class ExerciseRepository {
  static Future<sql.Database> db() async {
    return await DatabaseSetup.db();
  }

  static Future<void> insertExercise(ExerciseModel exercise) async {
    final sql.Database db = await ExerciseRepository.db();
    await db.insert(
      'exercise',
      exercise.toMap(),
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<ExerciseModel>> getExercises() async {
    final sql.Database db = await ExerciseRepository.db();
    List<Map<String, dynamic>> exercisesMapList =
        await db.query('exercise', orderBy: "id");
    return exercisesMapList
        .map((exerciseMap) => ExerciseModel.fromMap(exerciseMap))
        .toList();
  }

  static Future<ExerciseModel?> getExercise(int id) async {
    final sql.Database db = await ExerciseRepository.db();
    List<Map<String, dynamic>> exerciseMapList =
        await db.query('exercise', where: "id = ?", whereArgs: [id], limit: 1);
    if (exerciseMapList.isNotEmpty) {
      return ExerciseModel.fromMap(exerciseMapList.first);
    }
    return null;
  }

  static Future<void> updateExercise(ExerciseModel exercise) async {
    final sql.Database db = await ExerciseRepository.db();
    await db.update(
      'exercise',
      exercise.toMap(),
      where: 'id = ?',
      whereArgs: [exercise.id],
    );
  }

  static Future<void> deleteExercise(int id) async {
    final sql.Database db = await ExerciseRepository.db();
    await db.delete(
      'exercise',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
