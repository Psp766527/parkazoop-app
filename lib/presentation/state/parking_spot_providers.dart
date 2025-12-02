// lib/presentation/state/parking_spot_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../../core/dio/api_client.dart';
import '../../data/repositories/parking_spot_repository.dart';
import '../../data/services/parking_spot_service.dart';
import '../../data/models/dto/parking_spot_dto.dart';
import '../../data/models/dto/create_parking_spot_request.dart';
import 'package:flutter/foundation.dart';

/// Dio provider (uses ApiClient.create())
final apiDioProvider = Provider<Dio>((ref) {
  return ApiClient.create().dio;
});

/// Service provider
final parkingSpotServiceProvider = Provider<ParkingSpotService>((ref) {
  final dio = ref.watch(apiDioProvider);
  return ParkingSpotService(dio);
});

/// Repository provider
final parkingSpotRepositoryProvider = Provider<ParkingSpotRepository>((ref) {
  final svc = ref.watch(parkingSpotServiceProvider);
  return ParkingSpotRepository(svc);
});

/// Params map: { 'type': String?, 'lat': double?, 'lng': double?, 'maxDistance': double?, 'limit': int? }
final availableSpotsProvider = FutureProvider.family<List<ParkingSpotDto>, Map<String, dynamic>>((ref, params) async {
  final repo = ref.watch(parkingSpotRepositoryProvider);
  return repo.fetchAvailable(
    type: params['type'] as String?,
    lat: params['lat'] as double?,
    lng: params['lng'] as double?,
    maxDistance: params['maxDistance'] as double?,
    limit: params['limit'] as int?,
  );
});

/// Parking spot detail provider (by id)
final parkingSpotDetailProvider = FutureProvider.family<ParkingSpotDto, String>((ref, id) async {
  final repo = ref.watch(parkingSpotRepositoryProvider);
  return repo.getById(id);
});

/// State notifier to handle create spot action (loading/error/result)
class CreateSpotState {
  final bool isLoading;
  final ParkingSpotDto? created;
  final String? error;

  CreateSpotState({
    this.isLoading = false,
    this.created,
    this.error,
  });

  CreateSpotState copyWith({bool? isLoading, ParkingSpotDto? created, String? error}) {
    return CreateSpotState(
      isLoading: isLoading ?? this.isLoading,
      created: created ?? this.created,
      error: error,
    );
  }
}

class CreateSpotNotifier extends StateNotifier<CreateSpotState> {
  final ParkingSpotRepository _repo;
  CreateSpotNotifier(this._repo) : super(CreateSpotState());

  Future<void> createSpot(CreateParkingSpotRequest request) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final created = await _repo.createSpot(request);
      state = state.copyWith(isLoading: false, created: created, error: null);
    } catch (e, st) {
      if (kDebugMode) {
        // you can log error/st
      }
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

final createParkingSpotNotifierProvider = StateNotifierProvider<CreateSpotNotifier, CreateSpotState>((ref) {
  final repo = ref.watch(parkingSpotRepositoryProvider);
  return CreateSpotNotifier(repo);
});
