// models/parent.dart
class Parent {
  final int id;
  final String name;
  final String email;
  final List<int> childrenIds;

  Parent({
    required this.id,
    required this.name,
    required this.email,
    required this.childrenIds,
  });

  factory Parent.fromJson(Map<String, dynamic> json) {
    return Parent(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      childrenIds: List<int>.from(json['childrenIds']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'childrenIds': childrenIds,
    };
  }
}
