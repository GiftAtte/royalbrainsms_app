// models/teacher.dart
class Employee {
  final int id;
  final String name;
  final String subject;
  final String email;

  Employee({
    required this.id,
    required this.name,
    required this.subject,
    required this.email,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['name'],
      subject: json['subject'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'subject': subject,
      'email': email,
    };
  }
}
