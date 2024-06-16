import 'package:flutter/material.dart';
import 'package:royalbrainsmsapp/models/student.model.dart';


class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: Text(
            student.name[0],
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(student.name),
        subtitle: Text('Grade: ${student.grade}\nParent: ${student.parentName}'),
        isThreeLine: true,
      ),
    );
  }
}
