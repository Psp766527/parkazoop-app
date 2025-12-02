import 'package:json_annotation/json_annotation.dart';

import '../enums/parking_spot_type.dart';
import 'location_dto.dart';
import 'money_dto.dart';

part 'create_parking_spot_request.g.dart';

/// Request payload for creating a parking spot
@JsonSerializable()
class CreateParkingSpotRequest {
  final String spotNumber;
  final LocationDto location;
  final ParkingSpotType type;
  final MoneyDto hourlyRate;

  CreateParkingSpotRequest({
    required this.spotNumber,
    required this.location,
    required this.type,
    required this.hourlyRate,
  });

  factory CreateParkingSpotRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateParkingSpotRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateParkingSpotRequestToJson(this);
}
