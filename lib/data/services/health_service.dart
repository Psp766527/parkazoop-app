import 'package:dio/dio.dart';
import '../../data/models/dto/api_response.dart';

class HealthService {
  final Dio _dio;
  HealthService(this._dio);

  Future<Map<String, dynamic>> health() async {
    final res = await _dio.get('/health');
    final apiResp = ApiResponse<Map<String, dynamic>>.fromJson(
      res.data,
          (json) => json as Map<String, dynamic>,
    );
    return apiResp.data ?? {};
  }

  Future<Map<String, dynamic>> ready() async {
    final res = await _dio.get('/health/ready');
    final apiResp = ApiResponse<Map<String, dynamic>>.fromJson(
      res.data,
          (json) => json as Map<String, dynamic>,
    );
    return apiResp.data ?? {};
  }
}
