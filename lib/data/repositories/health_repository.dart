import '../services/health_service.dart';

class HealthRepository {
  final HealthService service;

  HealthRepository(this.service);

  /// Calls /health endpoint
  Future<Map<String, dynamic>> getHealth() {
    return service.health();
  }

  /// Calls /health/ready endpoint
  Future<Map<String, dynamic>> getReadiness() {
    return service.ready();
  }
}
