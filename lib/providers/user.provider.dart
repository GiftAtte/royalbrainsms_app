import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:royalbrainsmsapp/models/user.model.dart';
import 'package:royalbrainsmsapp/services/auth/login.service.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserProvider extends ChangeNotifier {
  final LoginService _loginService=LoginService();
  User? _user;
  String? _accessToken;

  User? get user => _user;
  String? get accessToken => _accessToken;

  UserProvider();

  Future<void> login(String username, String password) async {
    final loginData = await _loginService.login(username, password);
    _accessToken = loginData['token'];
    _user = loginData['user'];

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', _accessToken!);
    await prefs.setString('user', _user!.toJson().toString());

    notifyListeners();
  }

  Future<void> logout() async {
    _loginService.logout();

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken');
    await prefs.remove('user');

    _user = null;
    _accessToken = null;
    notifyListeners();
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    _accessToken = prefs.getString('accessToken');
    final userJson = prefs.getString('user');

    if (_accessToken != null && userJson != null) {
      _user = User.fromJson(jsonDecode(userJson));
      notifyListeners();
    }
  }
}
