import 'package:dio/dio.dart';
import '../models/dto/parking_session_dto.dart';
import '../models/dto/reserve_parking_spot_request.dart';
import '../models/dto/start_parking_session_request.dart';
import '../../data/models/dto/api_response.dart';

class ParkingSessionService {
  final Dio _dio;

  ParkingSessionService(this._dio);

  Future<ParkingSessionDto> reserve(ReserveParkingSpotRequest req) async {
    final res = await _dio.post('/parking-sessions/reserve', data: req.toJson());
    final apiResp = ApiResponse<ParkingSessionDto>.fromJson(
      res.data,
          (json) => ParkingSessionDto.fromJson(json as Map<String, dynamic>),
    );
    return apiResp.data!;
  }

  Future<ParkingSessionDto> start(StartParkingSessionRequest req) async {
    final res = await _dio.post('/parking-sessions/start', data: req.toJson());
    final apiResp = ApiResponse<ParkingSessionDto>.fromJson(
      res.data,
          (json) => ParkingSessionDto.fromJson(json as Map<String, dynamic>),
    );
    return apiResp.data!;
  }

  Future<void> end(String sessionId, Map<String, dynamic> body) async {
    await _dio.post('/parking-sessions/$sessionId/end', data: body);
  }

  Future<void> cancel(String sessionId, Map<String, dynamic> body) async {
    await _dio.post('/parking-sessions/$sessionId/cancel', data: body);
  }

  Future<ParkingSessionDto> getById(String sessionId) async {
    final res = await _dio.get('/parking-sessions/$sessionId');
    final apiResp = ApiResponse<ParkingSessionDto>.fromJson(
      res.data,
          (json) => ParkingSessionDto.fromJson(json as Map<String, dynamic>),
    );
    return apiResp.data!;
  }
}
