import 'package:json_annotation/json_annotation.dart';

import '../enums/parking_spot_type.dart';
import '../enums/parking_spot_status.dart';
import 'location_dto.dart';
import 'money_dto.dart';

part 'parking_spot_dto.g.dart';

/// DTO for parking spot information
@JsonSerializable()
class ParkingSpotDto {
  final String id;
  final String spotNumber;
  final LocationDto location;
  final ParkingSpotType type;
  final ParkingSpotStatus status;
  final MoneyDto hourlyRate;

  final String? currentVehicleId;
  final String? description;

  final bool isAccessible;
  final bool hasCharging;

  ParkingSpotDto({
    required this.id,
    required this.spotNumber,
    required this.location,
    required this.type,
    required this.status,
    required this.hourlyRate,
    this.currentVehicleId,
    this.description,
    required this.isAccessible,
    required this.hasCharging,
  });

  factory ParkingSpotDto.fromJson(Map<String, dynamic> json) =>
      _$ParkingSpotDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ParkingSpotDtoToJson(this);
}
