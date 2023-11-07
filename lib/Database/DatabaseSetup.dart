import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart';

class DatabaseSetup {
  static Future<sql.Database> db() async {
    // get a path to the database
    String databasesPath = await sql.getDatabasesPath();
    String path = join(databasesPath, 'coachApp.db');
    // open the database or create a new one if it doesn't exist
    return sql.openDatabase(
      path,
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<void> createTables(sql.Database database) async {
    await createUserTable(database);
    await createTrainingTable(database);
    await createUserTrainingTable(database);
    await createExerciseTable(database);
    await createExerciseProgressTable(database);
  }

  static Future<void> createUserTable(sql.Database database) async {
    await database.execute("""CREATE TABLE user(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT NOT NULL,
        birth_date TEXT NOT NULL,
        height INTEGER NOT NULL,
        weight INTEGER NOT NULL
      )
      """);
  }

  static Future<void> createTrainingTable(sql.Database database) async {
    await database.execute("""CREATE TABLE training(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
        name TEXT NOT NULL
      )
      """);
  }

  static Future<void> createUserTrainingTable(sql.Database database) async {
    await database.execute("""CREATE TABLE userTraining(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
        FOREIGN KEY (training_id) REFERENCES training (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
        date TEXT NOT NULL,
        is_completed INTEGER NOT NULL
      )
      """);
  }

  static Future<void> createExerciseTable(sql.Database database) async {
    await database.execute("""CREATE TABLE exercise(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        FOREIGN KEY (training_id) REFERENCES training (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
        name TEXT NOT NULL,
        sets INTEGER NOT NULL,
        reps INTEGER NOT NULL,
        rest_time INTEGER NOT NULL
      )
      """);
  }

  static Future<void> createExerciseProgressTable(sql.Database database) async {
    await database.execute("""CREATE TABLE exerciseProgress(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        FOREIGN KEY (exercise_id) REFERENCES exercise (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
        date TEXT NOT NULL,
        weight_used INTEGER NOT NULL
      )
      """);
  }
}
