import 'package:json_annotation/json_annotation.dart';

part 'money_dto.g.dart';

/// DTO for money information
@JsonSerializable()
class MoneyDto {
  final double amount;
  final String currency;

  MoneyDto({
    required this.amount,
    required this.currency,
  });

  factory MoneyDto.fromJson(Map<String, dynamic> json) =>
      _$MoneyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MoneyDtoToJson(this);
}
