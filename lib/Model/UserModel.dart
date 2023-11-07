class UserModel {
  int id;
  String name;
  String birthDate;
  int height;
  int weight;

  UserModel(
      {required this.id,
      required this.name,
      required this.birthDate,
      required this.height,
      required this.weight});

  // Convert a User object into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'birth_date': birthDate,
      'height': height,
      'weight': weight,
    };
  }

  // Convert a Map into a User object
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      birthDate: map['birth_date'],
      height: map['height'],
      weight: map['weight'],
    );
  }
}
