import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/dio/api_client.dart';
import '../../data/models/dto/parking_spot_dto.dart';
import '../../data/services/parking_spot_service.dart';
import '../../data/repositories/parking_spot_repository.dart';
import '../../data/services/parking_session_service.dart';
import '../../data/repositories/parking_session_repository.dart';
import '../../data/services/health_service.dart';
import '../../data/repositories/health_repository.dart';

final dioProvider = Provider((ref) => ApiClient.create().dio);

final parkingSpotServiceProvider = Provider((ref) => ParkingSpotService(ref.read(dioProvider)));
final parkingSpotRepositoryProvider = Provider((ref) => ParkingSpotRepository(ref.read(parkingSpotServiceProvider)));

final parkingSessionServiceProvider = Provider((ref) => ParkingSessionService(ref.read(dioProvider)));
final parkingSessionRepositoryProvider = Provider((ref) => ParkingSessionRepository(ref.read(parkingSessionServiceProvider)));

final healthServiceProvider = Provider((ref) => HealthService(ref.read(dioProvider)));
final healthRepositoryProvider = Provider((ref) => HealthRepository(ref.read(healthServiceProvider)));

// Example future provider for list
final availableSpotsProvider = FutureProvider.family<List<ParkingSpotDto>, Map<String, dynamic>>((ref, params) async {
  return ref.read(parkingSpotRepositoryProvider).fetchAvailable(
    type: params['type'] as String?,
    lat: params['lat'] as double?,
    lng: params['lng'] as double?,
    maxDistance: params['maxDistance'] as double?,
    limit: params['limit'] as int?,
  );
});
