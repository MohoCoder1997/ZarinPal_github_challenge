part of 'repo_bloc.dart';

abstract class RepoState extends Equatable {
  const RepoState();

  @override
  List<Object?> get props => [];
}

class RepoLoadInProgress extends RepoState {}

class RepoLoadSuccess extends RepoState {
  final List<Repo> repos;
  final bool isEndOfPage;
  final HttpFail? fail;

  RepoLoadSuccess({
    required this.repos,
    required this.isEndOfPage,
    this.fail,
  });

  RepoLoadSuccess copyWith({
    List<Repo>? repos,
    bool? isEndOfPage,
    HttpFail? fail,
  }) =>
      RepoLoadSuccess(
        repos: repos ?? this.repos,
        isEndOfPage: isEndOfPage ?? this.isEndOfPage,
        fail: fail ,
      );

  @override
  List<Object?> get props => [
        repos,
        isEndOfPage,
        fail,
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
