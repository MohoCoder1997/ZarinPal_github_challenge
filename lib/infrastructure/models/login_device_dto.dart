import 'package:github_challenge/domain/entities/login_device.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_device_dto.g.dart';

@JsonSerializable()
class LoginDeviceDto extends LoginDevice {

  @JsonKey(name: 'expires_in')
  final int expiresIn;
  @JsonKey(name: 'interval')
  final String interval;

  const LoginDeviceDto({
    required this.expiresIn,
    required this.interval,
    required  String varificationUri,
    required String deviceCode,
    required String userCode,
  }) : super(
          deviceCode: deviceCode,
          userCode: userCode,
          varificationUri: varificationUri,
        );
        factory LoginDeviceDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDeviceDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDeviceDtoToJson(this);
}
