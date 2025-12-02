// lib/data/repositories/parking_spot_repository.dart

import '../services/parking_spot_service.dart';
import '../models/dto/parking_spot_dto.dart';
import '../models/dto/create_parking_spot_request.dart';

class ParkingSpotRepository {
  final ParkingSpotService service;

  ParkingSpotRepository(this.service);

  Future<List<ParkingSpotDto>> fetchAvailable({
    String? type,
    double? lat,
    double? lng,
    double? maxDistance,
    int? limit,
  }) =>
      service.getAvailable(
        type: type,
        lat: lat,
        lng: lng,
        maxDistance: maxDistance,
        limit: limit,
      );

  Future<ParkingSpotDto> getById(String id) => service.getById(id);

  Future<ParkingSpotDto> createSpot(CreateParkingSpotRequest request) => service.create(request);
}
