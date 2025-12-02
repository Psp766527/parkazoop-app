import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

/// Authentication response returned by Spring Boot after login
@JsonSerializable()
class AuthResponse {
  final String accessToken;
  final String refreshToken;
  final String tokenType;

  AuthResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
  });

  /// JSON → Dart
  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  /// Dart → JSON
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
