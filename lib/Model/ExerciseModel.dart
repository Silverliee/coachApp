class ExerciseModel {
  int id;
  int trainingId; // foreign key to training table
  String name;
  int sets;
  int reps;
  int restTime;

  ExerciseModel(
      {required this.id,
      required this.trainingId,
      required this.name,
      required this.sets,
      required this.reps,
      required this.restTime});

  // Convert Exercise object to Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'training_id': trainingId,
      'name': name,
      'sets': sets,
      'reps': reps,
      'rest_time': restTime,
    };
  }

  // Convert Map object to Exercise object
  factory ExerciseModel.fromMap(Map<String, dynamic> map) {
    return ExerciseModel(
      id: map['id'],
      trainingId: map['training_id'],
      name: map['name'],
      sets: map['sets'],
      reps: map['reps'],
      restTime: map['rest_time'],
    );
  }
}
