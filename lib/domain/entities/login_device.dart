import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class LoginDevice extends Equatable {
  @JsonKey(name: 'device_code')
  final String deviceCode;
  @JsonKey(name: 'user_code')
  final String userCode;
    @JsonKey(name: 'verification_uri')
  final String varificationUri;

  const LoginDevice({
    required this.deviceCode,
    required this.userCode,
    required this.varificationUri,
  });
  @override
  List<Object?> get props => [
        deviceCode,
        userCode,
        varificationUri,
      ];
}
