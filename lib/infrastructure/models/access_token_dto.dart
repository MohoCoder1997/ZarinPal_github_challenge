import 'package:github_challenge/domain/entities/access_token.dart';
import 'package:json_annotation/json_annotation.dart';

part 'access_token_dto.g.dart';

@JsonSerializable()
class AccessTokenDto extends AccessToken {
  @JsonKey(name: 'scope')
  final String scope;
  const AccessTokenDto({
    required this.scope,
    required String accessToken,
    required String tokenType,
  }) : super(
          accessToken: accessToken,
          tokenType: tokenType,
        );

         factory AccessTokenDto.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AccessTokenDtoToJson(this);
}
