import 'package:dio/dio.dart';

class DioService {
  late Dio dio;

  DioService() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://portal.thinkschoolapp.com/api',
        headers: {
          'Content-Type': 'application/json',
          'Referer': 'https://be.thinkschoolapp.com',
        },
      ),
    );

    dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  Dio get client => dio;
}
