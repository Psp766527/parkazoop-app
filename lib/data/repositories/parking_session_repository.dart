import '../services/parking_session_service.dart';
import '../models/dto/parking_session_dto.dart';
import '../models/dto/reserve_parking_spot_request.dart';
import '../models/dto/start_parking_session_request.dart';

class ParkingSessionRepository {
  final ParkingSessionService service;

  ParkingSessionRepository(this.service);

  Future<ParkingSessionDto> reserve(ReserveParkingSpotRequest request) {
    return service.reserve(request);
  }

  Future<ParkingSessionDto> start(StartParkingSessionRequest request) {
    return service.start(request);
  }

  Future<void> end(String sessionId, Map<String, dynamic> body) {
    return service.end(sessionId, body);
  }

  Future<void> cancel(String sessionId, Map<String, dynamic> body) {
    return service.cancel(sessionId, body);
  }

  Future<ParkingSessionDto> getById(String sessionId) {
    return service.getById(sessionId);
  }
}
