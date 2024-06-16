// services/user_service.dart
import 'package:dio/dio.dart';
import 'package:royalbrainsmsapp/config/dio_client.dart';
import 'package:royalbrainsmsapp/models/user.model.dart';


class UserService {
  final Dio _dio;

  UserService() : _dio = DioClient().client;

  Future<List<User>> getUsers() async {
    try {
      final response = await _dio.get('/users');
      if (response.statusCode == 200) {
        final List<dynamic> usersJson = response.data['users'];
        return usersJson.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load users');
      }
    } on DioException catch (e) {
      throw Exception('Error loading users: ${e.response?.data}');
    }
  }
}
