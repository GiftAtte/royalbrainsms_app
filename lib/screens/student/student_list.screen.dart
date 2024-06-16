import 'package:flutter/material.dart';
import 'package:royalbrainsmsapp/components/student_card.component.dart';
import 'package:royalbrainsmsapp/models/student.model.dart';

class StudentListScreen extends StatelessWidget {
  final List<Student> students;

  const StudentListScreen({Key? key, required this.students}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students List'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return StudentCard(student: students[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/student');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
