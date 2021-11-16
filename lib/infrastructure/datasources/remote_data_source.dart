import 'package:github_challenge/infrastructure/core/api_call_handler.dart';
import 'package:github_challenge/infrastructure/models/user_dto.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class RemoteDataSource {
  final ApiCallHandler _apiCallHandler;

  RemoteDataSource(this._apiCallHandler);

  Future<UserDto> getUserInfo({required String userName}) async =>
      UserDto.fromJson(await _apiCallHandler.get(url: 'users/$userName'));
}
