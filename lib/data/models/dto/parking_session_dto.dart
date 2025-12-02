import 'package:json_annotation/json_annotation.dart';

import '../enums/parking_session_status.dart';
import 'money_dto.dart';

part 'parking_session_dto.g.dart';

/// DTO for parking session information
@JsonSerializable()
class ParkingSessionDto {
  final String id;
  final String parkingSpotId;
  final String vehicleId;
  final String userId;

  final DateTime? startTime;
  final DateTime? endTime;

  final MoneyDto hourlyRate;
  final ParkingSessionStatus status;

  final MoneyDto? totalCost;
  final String? paymentId;

  final int durationInMinutes;

  final bool isActive;
  final bool isPaid;

  ParkingSessionDto({
    required this.id,
    required this.parkingSpotId,
    required this.vehicleId,
    required this.userId,
    this.startTime,
    this.endTime,
    required this.hourlyRate,
    required this.status,
    this.totalCost,
    this.paymentId,
    required this.durationInMinutes,
    required this.isActive,
    required this.isPaid,
  });

  factory ParkingSessionDto.fromJson(Map<String, dynamic> json) =>
      _$ParkingSessionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ParkingSessionDtoToJson(this);
}
