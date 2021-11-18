// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_device_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDeviceDto _$LoginDeviceDtoFromJson(Map<String, dynamic> json) {
  return LoginDeviceDto(
    expiresIn: json['expires_in'] as int,
    interval: json['interval'] as String,
    varificationUri: json['verification_uri'] as String,
    deviceCode: json['device_code'] as String,
    userCode: json['user_code'] as String,
  );
}

Map<String, dynamic> _$LoginDeviceDtoToJson(LoginDeviceDto instance) =>
    <String, dynamic>{
      'device_code': instance.deviceCode,
      'user_code': instance.userCode,
      'verification_uri': instance.varificationUri,
      'expires_in': instance.expiresIn,
      'interval': instance.interval,
    };
