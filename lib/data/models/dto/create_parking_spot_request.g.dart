// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_parking_spot_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateParkingSpotRequest _$CreateParkingSpotRequestFromJson(
        Map<String, dynamic> json) =>
    CreateParkingSpotRequest(
      spotNumber: json['spotNumber'] as String,
      location: LocationDto.fromJson(json['location'] as Map<String, dynamic>),
      type: $enumDecode(_$ParkingSpotTypeEnumMap, json['type']),
      hourlyRate: MoneyDto.fromJson(json['hourlyRate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateParkingSpotRequestToJson(
        CreateParkingSpotRequest instance) =>
    <String, dynamic>{
      'spotNumber': instance.spotNumber,
      'location': instance.location,
      'type': _$ParkingSpotTypeEnumMap[instance.type]!,
      'hourlyRate': instance.hourlyRate,
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
