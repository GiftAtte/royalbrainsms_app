import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  static final DioClient _singleton = DioClient._internal();
  Dio _dio;

  factory DioClient() {
    return _singleton;
  }

  DioClient._internal()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://portal.thinkschoolapp.com/api',
            headers: {
              'Content-Type': 'application/json',
              'Referer': 'https://be.thinkschoolapp.com',
            },
          ),
        ) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final prefs = await SharedPreferences.getInstance();
        final String? token = prefs.getString('access_token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    ));
  }

  Dio get client => _dio;
}
