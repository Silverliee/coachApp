class ExerciseProgressModel {
  int id;
  int exerciseId; // foreign key to exercise table
  String date;
  int weightUsed;

  ExerciseProgressModel(
      {required this.id,
      required this.exerciseId,
      required this.date,
      required this.weightUsed});

  // Convert ExerciseProgress object to Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'exercise_id': exerciseId,
      'date': date,
      'weight_used': weightUsed,
    };
  }

  // Convert Map object to ExerciseProgress object
  factory ExerciseProgressModel.fromMap(Map<String, dynamic> map) {
    return ExerciseProgressModel(
      id: map['id'],
      exerciseId: map['exercise_id'],
      date: map['date'],
      weightUsed: map['weight_used'],
    );
  }
}
