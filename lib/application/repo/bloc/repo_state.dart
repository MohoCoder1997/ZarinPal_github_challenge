part of 'repo_bloc.dart';

abstract class RepoState extends Equatable {
  const RepoState();

  @override
  List<Object> get props => [];
}

class RepoLoadInProgress extends RepoState {}

class RepoLoadSuccess extends RepoState {
  final List<Repo> repos;
  final bool isEndOfPage;

  RepoLoadSuccess({
    required this.repos,
    required this.isEndOfPage,
  });

  RepoLoadSuccess copyWith({
    List<Repo>? repos,
    bool? isEndOfPage,
  }) =>
      RepoLoadSuccess(
        repos: repos ?? this.repos,
        isEndOfPage: isEndOfPage ?? this.isEndOfPage,
      );

  @override
  List<Object> get props => [
        repos,
        isEndOfPage,
      ];
}

class RepoLoadFailure extends RepoState {
  final HttpFail fail;
  final String userName;

  RepoLoadFailure({
    required this.fail,
    required this.userName,
  });

  @override
  List<Object> get props => [
        fail,
        userName,
      ];
}

class RepoIsEmpty extends RepoState {}
