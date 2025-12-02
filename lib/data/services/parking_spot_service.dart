// lib/data/services/parking_spot_service.dart

import 'package:dio/dio.dart';
import '../models/dto/parking_spot_dto.dart';
import '../models/dto/create_parking_spot_request.dart';
import '../../data/models/dto/api_response.dart';

class ParkingSpotService {
  final Dio _dio;

  ParkingSpotService(this._dio);

  /// GET /parking-spots/available
  Future<List<ParkingSpotDto>> getAvailable({
    String? type,
    double? lat,
    double? lng,
    double? maxDistance,
    int? limit,
  }) async {
    final query = <String, dynamic>{};
    if (type != null && type.isNotEmpty) query['type'] = type;
    if (lat != null) query['lat'] = lat;
    if (lng != null) query['lng'] = lng;
    if (maxDistance != null) query['maxDistance'] = maxDistance;
    if (limit != null) query['limit'] = limit;

    final resp = await _dio.get('/parking-spots/available', queryParameters: query);
    // ApiResponse<List<ParkingSpotDto>>
    final apiResp = ApiResponse<List<ParkingSpotDto>>.fromJson(
      resp.data as Map<String, dynamic>,
          (json) => (json as List).map((e) => ParkingSpotDto.fromJson(e as Map<String, dynamic>)).toList(),
    );
    return apiResp.data ?? <ParkingSpotDto>[];
  }

  /// GET /parking-spots/{id}
  Future<ParkingSpotDto> getById(String id) async {
    final resp = await _dio.get('/parking-spots/$id');
    final apiResp = ApiResponse<ParkingSpotDto>.fromJson(
      resp.data as Map<String, dynamic>,
          (json) => ParkingSpotDto.fromJson(json as Map<String, dynamic>),
    );
    if (apiResp.data == null) throw Exception(apiResp.message ?? 'Empty response');
    return apiResp.data!;
  }

  /// POST /parking-spots
  Future<ParkingSpotDto> create(CreateParkingSpotRequest request) async {
    final resp = await _dio.post('/parking-spots', data: request.toJson());
    final apiResp = ApiResponse<ParkingSpotDto>.fromJson(
      resp.data as Map<String, dynamic>,
          (json) => ParkingSpotDto.fromJson(json as Map<String, dynamic>),
    );
    if (apiResp.data == null) throw Exception(apiResp.message ?? 'Failed to create parking spot');
    return apiResp.data!;
  }
}
