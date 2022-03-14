class User {
  final String? name;
  final String? surname;
  final int? age;

  User({required this.name, required this.surname, required this.age});

  Map<String, dynamic> toJson() => {
    'name': name,
    'surname': surname,
    'age': age,
  };

  static User fromJson(Map<String, dynamic> json) => User(
    name: json['name'],
    surname: json['surname'],
    age: json['age'],
  );
}