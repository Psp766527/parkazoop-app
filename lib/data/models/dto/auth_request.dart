import 'package:json_annotation/json_annotation.dart';

part 'auth_request.g.dart';

/// Auth login request model
@JsonSerializable()
class AuthRequest {
  final String username;
  final String password;

  AuthRequest({
    required this.username,
    required this.password,
  });

  factory AuthRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AuthRequestToJson(this);
}
