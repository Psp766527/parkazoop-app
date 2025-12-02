import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

/// Generic API response model matching your Spring Boot ApiResponse<T>
@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  final bool success;
  final String? message;
  final T? data;
  final DateTime? timestamp;
  final String? errorCode;

  ApiResponse({
    required this.success,
    this.message,
    this.data,
    this.timestamp,
    this.errorCode,
  });

  /// Deserialize JSON → ApiResponse<T>
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);

  /// Serialize ApiResponse<T> → JSON
  Map<String, dynamic> toJson(
    Object? Function(T value) toJsonT,
  ) =>
      _$ApiResponseToJson(this, toJsonT);
}
