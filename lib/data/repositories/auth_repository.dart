import 'package:dio/dio.dart';
import '../models/dto/auth_request.dart';

class AuthRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://localhost:9080", // 🔥 change to your backend URL
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

  Future<Map<String, dynamic>> login(AuthRequest request) async {
    try {
      final response = await _dio.post(
        "/api/auth/login",
        data: request.toJson(),
      );

      return response.data; // token, user, anything returned
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response!.data.toString());
      }
      throw Exception("Network error: ${e.message}");
    }
  }
}

final authRepository = AuthRepository();
