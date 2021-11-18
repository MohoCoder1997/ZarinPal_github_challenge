import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_challenge/domain/core/failure_response.dart';
import 'package:github_challenge/domain/entities/repo.dart';
import 'package:github_challenge/domain/repository/i_repository.dart';
import 'package:github_challenge/infrastructure/datasources/remote_data_source.dart';
import 'package:injectable/injectable.dart';

part 'repo_event.dart';
part 'repo_state.dart';

@Injectable()
class RepoBloc extends Bloc<RepoEvent, RepoState> {
  final IRepository _repository;
  RepoBloc(this._repository) : super(RepoLoadInProgress());
  @override
  Stream<RepoState> mapEventToState(RepoEvent event) async* {
    if (event is RepoFetchedData) {
      final _result = await _repository.getRepoInfo(
        userName: event.userName,
        isNewLoad: true,
      );
      yield _result.fold(
        (fail) => fail is NoNextPageFail
            ? RepoIsEmpty()
            : RepoLoadFailure(fail: fail, userName: event.userName),
        (repoList) => repoList.length < RemoteDataSource.ITEMS_PER_PAGE
            ? RepoLoadSuccess(
                repos: repoList,
                isEndOfPage: true,
                fail: null,
              )
            : RepoLoadSuccess(
                repos: (state is RepoLoadSuccess)
                    ? (state as RepoLoadSuccess).repos + repoList
                    : repoList,
                isEndOfPage: false,
                fail: null,
              ),
      );
    }
    if (event is RepoFetchedNextPage) {
      final _state = state as RepoLoadSuccess;
      final _result = await _repository.getRepoInfo(
        userName: event.userName,
        isNewLoad: false,
      );

      yield _result.fold(
        (fail) => fail is NoNextPageFail
            ? _state.copyWith(isEndOfPage: true)
            : _state.copyWith(fail: fail),
        (repoList) => _state.copyWith(
          repos: _state.repos + repoList,
          isEndOfPage: false,
          fail: null,
        ),
      );
    }
  }
}
