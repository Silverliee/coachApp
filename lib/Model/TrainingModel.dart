class TrainingModel {
  int id;
  int userId; // foreign key to user table
  String name;

  TrainingModel({required this.id, required this.userId, required this.name});

  // Convert a Training object into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'name': name,
    };
  }

  // Convert a Map into a Training object
  factory TrainingModel.fromMap(Map<String, dynamic> map) {
    return TrainingModel(
      id: map['id'],
      userId: map['user_id'],
      name: map['name'],
    );
  }
}
