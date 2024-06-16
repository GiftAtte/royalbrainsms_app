import 'package:flutter/material.dart';
import 'package:royalbrainsmsapp/models/student.model.dart';
import 'package:royalbrainsmsapp/services/auth/student.service.dart';


class StudentProvider extends ChangeNotifier {
  final StudentService _studentService=StudentService();
  List<Student> _students = [];

  List<Student> get students => _students;

  StudentProvider();

  Future<void> loadStudents() async {
    _students = await _studentService.fetchStudents();
    notifyListeners();
  }

  Future<void> addStudent(Student student) async {
    await _studentService.addStudent(student);
    await loadStudents();
  }

  Future<void> updateStudent(Student student) async {
    await _studentService.updateStudent(student);
    await loadStudents();
  }

  Future<void> deleteStudent(int id) async {
    await _studentService.deleteStudent(id);
    await loadStudents();
  }
}
