import 'dart:convert';

import 'package:github_challenge/domain/core/app_register_config.dart';
import 'package:github_challenge/domain/core/failure_response.dart';
import 'package:github_challenge/infrastructure/core/api_call_handler.dart';
import 'package:github_challenge/infrastructure/models/access_token_dto.dart';
import 'package:github_challenge/infrastructure/models/login_device_dto.dart';
import 'package:github_challenge/infrastructure/models/repo_dto.dart';
import 'package:github_challenge/infrastructure/models/user_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class RemoteDataSource {
  final ApiCallHandler _apiCallHandler;
  static const int ITEMS_PER_PAGE = 10;
  int _shownPagesCount = 0;
  RemoteDataSource(this._apiCallHandler);

  Future<UserDto> getUserInfo() async =>
      UserDto.fromJson(await _apiCallHandler.get(
          url: 'user',
          header: {"Authorization": "token ${RegisterConfig.token}" ,
          "Accept": "application/json",
          }));

  Future<List<RepoDto>> getRepoInfo({
    required bool isNewLoad,
  }) async {
    if (isNewLoad) _shownPagesCount = 0;
    _shownPagesCount++;
    final List<RepoDto> _repoList = [];
    final _result = await _apiCallHandler.get(
        url: 'user/repos',
        body: {
          'page' : _shownPagesCount,
          'per_page' : ITEMS_PER_PAGE
        },
        header: {"Authorization": "token ${RegisterConfig.token}"});
      
    if ((_result as List).length != 0) {
      _result.forEach((repo) {
        _repoList.add(RepoDto.fromJson(repo));
      });
      return _repoList;
    } else {
      // if (_shownPagesCount == 1)
      //   return _repoList;
      // else
      throw NoNextPageFail(message: 'End of Items');
    }
  }

  Future<AccessTokenDto> getAccessToken() async => AccessTokenDto.fromJson(
          await _apiCallHandler.post(url: 'login/oauth/access_token', header: {
        "Accept": "application/json",
      }, body: {
        "client_id": RegisterConfig.CLIENT_ID,
        "device_code": RegisterConfig.deviceCode,
        "grant_type": RegisterConfig.GRANT_TYPE,
      }));

  Future<LoginDeviceDto> loginDevice() async => LoginDeviceDto.fromJson(
          await _apiCallHandler.post(url: 'login/device/code', header: {
        "Accept": "application/json",
      }, body: {
        "client_id": RegisterConfig.CLIENT_ID,
        "scope": RegisterConfig.SCOPE,
      }));
}
