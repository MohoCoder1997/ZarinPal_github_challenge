import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_challenge/domain/core/failure_response.dart';
import 'package:github_challenge/domain/entities/repo.dart';
import 'package:github_challenge/domain/repository/i_repository.dart';
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
      final _result = await _repository.getRepoInfo(userName: event.userName);
      yield _result.fold(
        (fail) => fail is NoNextPageFail
            ? (state as RepoLoadSuccess).copyWith(isEndOfPage: true)
            : RepoLoadFailure(fail: fail, userName: event.userName),
        (repoList) => repoList.length == 0
            ? RepoIsEmpty()
            : RepoLoadSuccess(
                repos: (state as RepoLoadSuccess).repos + repoList,
                isEndOfPage: false,
              ),
      );
    }
  }
}
