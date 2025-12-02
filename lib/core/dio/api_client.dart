import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  static const _baseUrl = 'http://localhost:8080/api/v1';
  final Dio dio;

  ApiClient._internal(this.dio);

  factory ApiClient.create() {
    final options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    final dio = Dio(options);

    // Logging interceptor
    dio.interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
    ));

    // Auth interceptor: adds Basic header (from stored creds)
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        try {
          final prefs = await SharedPreferences.getInstance();
          final username = prefs.getString('auth_username');
          final password = prefs.getString('auth_password');

          if (username != null && password != null) {
            final token = base64Encode(utf8.encode('$username:$password'));
            options.headers['Authorization'] = 'Basic $token';
          }
        } catch (_) {}

        handler.next(options);
      },

      onError: (e, handler) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout) {
          return handler.reject(
            DioException(
              requestOptions: e.requestOptions,
              type: e.type,
              error: 'Connection timed out',
              message: 'Connection timed out',
            ),
          );
        }

        handler.next(e);
      },
    ));


    return ApiClient._internal(dio);
  }
}
