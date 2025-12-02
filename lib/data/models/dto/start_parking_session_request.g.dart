// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_parking_session_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartParkingSessionRequest _$StartParkingSessionRequestFromJson(
        Map<String, dynamic> json) =>
    StartParkingSessionRequest(
      vehicleId: json['vehicleId'] as String,
      userId: json['userId'] as String,
      parkingSpotId: json['parkingSpotId'] as String,
    );

Map<String, dynamic> _$StartParkingSessionRequestToJson(
        StartParkingSessionRequest instance) =>
    <String, dynamic>{
      'vehicleId': instance.vehicleId,
      'userId': instance.userId,
      'parkingSpotId': instance.parkingSpotId,
    };
