import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class AccessToken extends Equatable {
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'token_type')
  final String tokenType;

  const AccessToken({
    required this.accessToken,
    required this.tokenType,
  });

  @override
  List<Object?> get props => [
        accessToken,
        tokenType,
      ];
}
