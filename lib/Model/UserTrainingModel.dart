class UserTrainingModel {
  int id;
  int userId; // foreign key to user table
  int trainingId; // foreign key to training table
  String date;
  int isCompleted;

  UserTrainingModel(
      {required this.id,
      required this.userId,
      required this.trainingId,
      required this.date,
      required this.isCompleted});

  // Convert UserTraining object to Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'training_id': trainingId,
      'date': date,
      'is_completed': isCompleted,
    };
  }

  // Convert Map object to UserTraining object
  factory UserTrainingModel.fromMap(Map<String, dynamic> map) {
    return UserTrainingModel(
      id: map['id'],
      userId: map['user_id'],
      trainingId: map['training_id'],
      date: map['date'],
      isCompleted: map['is_completed'],
    );
  }
}
