// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoneyDto _$MoneyDtoFromJson(Map<String, dynamic> json) => MoneyDto(
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$MoneyDtoToJson(MoneyDto instance) => <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
    };
