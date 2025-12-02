// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_session_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParkingSessionDto _$ParkingSessionDtoFromJson(Map<String, dynamic> json) =>
    ParkingSessionDto(
      id: json['id'] as String,
      parkingSpotId: json['parkingSpotId'] as String,
      vehicleId: json['vehicleId'] as String,
      userId: json['userId'] as String,
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      hourlyRate: MoneyDto.fromJson(json['hourlyRate'] as Map<String, dynamic>),
      status: $enumDecode(_$ParkingSessionStatusEnumMap, json['status']),
      totalCost: json['totalCost'] == null
          ? null
          : MoneyDto.fromJson(json['totalCost'] as Map<String, dynamic>),
      paymentId: json['paymentId'] as String?,
      durationInMinutes: (json['durationInMinutes'] as num).toInt(),
      isActive: json['isActive'] as bool,
      isPaid: json['isPaid'] as bool,
    );

Map<String, dynamic> _$ParkingSessionDtoToJson(ParkingSessionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parkingSpotId': instance.parkingSpotId,
      'vehicleId': instance.vehicleId,
      'userId': instance.userId,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'hourlyRate': instance.hourlyRate,
      'status': _$ParkingSessionStatusEnumMap[instance.status]!,
      'totalCost': instance.totalCost,
      'paymentId': instance.paymentId,
      'durationInMinutes': instance.durationInMinutes,
      'isActive': instance.isActive,
      'isPaid': instance.isPaid,
    };

const _$ParkingSessionStatusEnumMap = {
  ParkingSessionStatus.ACTIVE: 'ACTIVE',
  ParkingSessionStatus.COMPLETED: 'COMPLETED',
  ParkingSessionStatus.CANCELLED: 'CANCELLED',
  ParkingSessionStatus.EXPIRED: 'EXPIRED',
  ParkingSessionStatus.VIOLATION: 'VIOLATION',
};
