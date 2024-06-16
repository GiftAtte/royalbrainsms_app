import 'package:dio/dio.dart';
import 'package:royalbrainsmsapp/models/student.model.dart';
import 'package:royalbrainsmsapp/services/auth/dio.service.dart';

class StudentService {
  final DioService _dioService=DioService();

  StudentService();

  Future<List<Student>> fetchStudents() async {
    try {
      final response = await _dioService.client.get('/students');

      if (response.statusCode == 200) {
        final List<dynamic> studentsJson = response.data['students'];
        return studentsJson.map((json) => Student.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load students');
      }
    } on DioError catch (e) {
      throw Exception('Failed to load students: ${e.message}');
    }
  }

  Future<void> addStudent(Student student) async {
    try {
      await _dioService.client.post(
        '/students',
        data: student.toJson(),
      );
    } on DioError catch (e) {
      throw Exception('Failed to add student: ${e.message}');
    }
  }

  Future<void> updateStudent(Student student) async {
    try {
      await _dioService.client.put(
        '/students/${student.id}',
        data: student.toJson(),
      );
    } on DioError catch (e) {
      throw Exception('Failed to update student: ${e.message}');
    }
  }

  Future<void> deleteStudent(int id) async {
    try {
      await _dioService.client.delete('/students/$id');
    } on DioError catch (e) {
      throw Exception('Failed to delete student: ${e.message}');
    }
  }
}
