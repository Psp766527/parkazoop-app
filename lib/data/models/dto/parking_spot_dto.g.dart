// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_spot_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParkingSpotDto _$ParkingSpotDtoFromJson(Map<String, dynamic> json) =>
    ParkingSpotDto(
      id: json['id'] as String,
      spotNumber: json['spotNumber'] as String,
      location: LocationDto.fromJson(json['location'] as Map<String, dynamic>),
      type: $enumDecode(_$ParkingSpotTypeEnumMap, json['type']),
      status: $enumDecode(_$ParkingSpotStatusEnumMap, json['status']),
      hourlyRate: MoneyDto.fromJson(json['hourlyRate'] as Map<String, dynamic>),
      currentVehicleId: json['currentVehicleId'] as String?,
      description: json['description'] as String?,
      isAccessible: json['isAccessible'] as bool,
      hasCharging: json['hasCharging'] as bool,
    );

Map<String, dynamic> _$ParkingSpotDtoToJson(ParkingSpotDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'spotNumber': instance.spotNumber,
      'location': instance.location,
      'type': _$ParkingSpotTypeEnumMap[instance.type]!,
      'status': _$ParkingSpotStatusEnumMap[instance.status]!,
      'hourlyRate': instance.hourlyRate,
      'currentVehicleId': instance.currentVehicleId,
      'description': instance.description,
      'isAccessible': instance.isAccessible,
      'hasCharging': instance.hasCharging,
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

const _$ParkingSpotStatusEnumMap = {
  ParkingSpotStatus.available: 'AVAILABLE',
  ParkingSpotStatus.occupied: 'OCCUPIED',
  ParkingSpotStatus.reserved: 'RESERVED',
  ParkingSpotStatus.maintenance: 'MAINTENANCE',
  ParkingSpotStatus.outOfService: 'OUT_OF_SERVICE',
  ParkingSpotStatus.blocked: 'BLOCKED',
};
