import 'package:github_challenge/domain/core/failure_response.dart';
import 'package:github_challenge/infrastructure/core/api_call_handler.dart';
import 'package:github_challenge/infrastructure/models/repo_dto.dart';
import 'package:github_challenge/infrastructure/models/user_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class RemoteDataSource {
  final ApiCallHandler _apiCallHandler;
  static const int ITEMS_PER_PAGE = 10;
  int _shownPagesCount = 0;
  RemoteDataSource(this._apiCallHandler);

  Future<UserDto> getUserInfo({required String userName}) async =>
      UserDto.fromJson(await _apiCallHandler.get(url: 'users/$userName'));

  Future<List<RepoDto>> getRepoInfo({
    required String userName,
    required bool isNewLoad,
  }) async {
    if (isNewLoad) _shownPagesCount = 0;
    _shownPagesCount++;
    final List<RepoDto> _repoList = [];
    final _result = await _apiCallHandler.get(
      url:
          'users/$userName/repos?page=$_shownPagesCount&per_page=$ITEMS_PER_PAGE',
    );
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
}
