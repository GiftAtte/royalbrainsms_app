class Student {
  final int id;
  final String name;
  final int age;
  final String grade;
  final String parentName;
  final String parentEmail;

  Student({
    required this.id,
    required this.name,
    required this.age,
    required this.grade,
    required this.parentName,
    required this.parentEmail,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      grade: json['grade'],
      parentName: json['parent_name'],
      parentEmail: json['parent_email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'grade': grade,
      'parent_name': parentName,
      'parent_email': parentEmail,
    };
  }
}
