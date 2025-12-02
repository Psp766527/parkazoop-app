import 'package:json_annotation/json_annotation.dart';

import '../enums/parking_spot_type.dart';
import 'location_dto.dart';

part 'reserve_parking_spot_request.g.dart';

/// Request DTO for reserving a parking spot
@JsonSerializable()
class ReserveParkingSpotRequest {
  final String vehicleId;
  final String userId;
  final LocationDto userLocation;
  final ParkingSpotType preferredType;

  final double? maxDistance;
  final int? reservationDurationMinutes;

  ReserveParkingSpotRequest({
    required this.vehicleId,
    required this.userId,
    required this.userLocation,
    required this.preferredType,
    this.maxDistance,
    this.reservationDurationMinutes,
  });

  factory ReserveParkingSpotRequest.fromJson(Map<String, dynamic> json) =>
      _$ReserveParkingSpotRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ReserveParkingSpotRequestToJson(this);
}
