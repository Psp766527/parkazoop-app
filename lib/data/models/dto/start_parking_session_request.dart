import 'package:json_annotation/json_annotation.dart';

part 'start_parking_session_request.g.dart';

/// Request DTO for starting a parking session
@JsonSerializable()
class StartParkingSessionRequest {
  final String vehicleId;
  final String userId;
  final String parkingSpotId;

  StartParkingSessionRequest({
    required this.vehicleId,
    required this.userId,
    required this.parkingSpotId,
  });

  factory StartParkingSessionRequest.fromJson(Map<String, dynamic> json) =>
      _$StartParkingSessionRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$StartParkingSessionRequestToJson(this);
}
