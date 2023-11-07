import 'package:coach_app/Model/TrainingModel.dart';
import 'package:coach_app/database/DatabaseSetup.dart';
import 'package:sqflite/sqflite.dart' as sql;

class TrainingRepository {
  static Future<sql.Database> db() async {
    return await DatabaseSetup.db();
  }

  static Future<void> insertTraining(TrainingModel training) async {
    final sql.Database db = await TrainingRepository.db();
    await db.insert(
      'training',
      training.toMap(),
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<TrainingModel>> getTrainings() async {
    final sql.Database db = await TrainingRepository.db();
    List<Map<String, dynamic>> trainingsMapList =
        await db.query('training', orderBy: "id");
    return trainingsMapList
        .map((trainingMap) => TrainingModel.fromMap(trainingMap))
        .toList();
  }

  static Future<TrainingModel?> getTraining(int id) async {
    final sql.Database db = await TrainingRepository.db();
    List<Map<String, dynamic>> trainingMapList =
        await db.query('training', where: "id = ?", whereArgs: [id], limit: 1);
    if (trainingMapList.isNotEmpty) {
      return TrainingModel.fromMap(trainingMapList.first);
    }
    return null;
  }

  static Future<void> updateTraining(TrainingModel training) async {
    final sql.Database db = await TrainingRepository.db();
    await db.update(
      'training',
      training.toMap(),
      where: 'id = ?',
      whereArgs: [training.id],
    );
  }

  static Future<void> deleteTraining(int id) async {
    final sql.Database db = await TrainingRepository.db();
    await db.delete(
      'training',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
