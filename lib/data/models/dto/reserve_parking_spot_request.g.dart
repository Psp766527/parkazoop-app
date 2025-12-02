// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserve_parking_spot_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReserveParkingSpotRequest _$ReserveParkingSpotRequestFromJson(
        Map<String, dynamic> json) =>
    ReserveParkingSpotRequest(
      vehicleId: json['vehicleId'] as String,
      userId: json['userId'] as String,
      userLocation:
          LocationDto.fromJson(json['userLocation'] as Map<String, dynamic>),
      preferredType:
          $enumDecode(_$ParkingSpotTypeEnumMap, json['preferredType']),
      maxDistance: (json['maxDistance'] as num?)?.toDouble(),
      reservationDurationMinutes:
          (json['reservationDurationMinutes'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReserveParkingSpotRequestToJson(
        ReserveParkingSpotRequest instance) =>
    <String, dynamic>{
      'vehicleId': instance.vehicleId,
      'userId': instance.userId,
      'userLocation': instance.userLocation,
      'preferredType': _$ParkingSpotTypeEnumMap[instance.preferredType]!,
      'maxDistance': instance.maxDistance,
      'reservationDurationMinutes': instance.reservationDurationMinutes,
    };

const _$ParkingSpotTypeEnumMap = {
  ParkingSpotType.standard: 'STANDARD',
  ParkingSpotType.handicap: 'HANDICAP',
  ParkingSpotType.electricVehicle: 'ELECTRIC_VEHICLE',
  ParkingSpotType.motorcycle: 'MOTORCYCLE',
  ParkingSpotType.truck: 'TRUCK',
  ParkingSpotType.loadingZone: 'LOADING_ZONE',
  ParkingSpotType.timeLimited: 'TIME_LIMITED',
  ParkingSpotType.reserved: 'RESERVED',
};
