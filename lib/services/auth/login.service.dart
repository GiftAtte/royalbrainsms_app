import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:royalbrainsmsapp/config/dio_client.dart';
import 'package:royalbrainsmsapp/models/user.model.dart';

class LoginService {
  final DioClient _dioService = DioClient();


  Future<Map<String, dynamic>> login(String username, String password) async {
    final inputs = {'usernam': username, 'password': password};
        print(inputs);
        print(_dioService.client);
    try {
      final response = await _dioService.client.post(
        '/auth/login',
        data: jsonEncode({'username': username, 'password': password}),
      );
  
      if (response.statusCode == 200) {
        final loginData = response.data;
        print(loginData);
        final accessToken = loginData['token'];
        final user = User.fromJson(loginData['user']);
        return {'token': accessToken, 'user': user};
      } else {
        throw Exception('Failed to login');
      }
    } on DioError catch (e) {
       print(e);
      throw Exception('Failed to login: ${e.message}');

    }
  }

  Future<void> logout() async {
    // Implement logout functionality if required
  }
}
