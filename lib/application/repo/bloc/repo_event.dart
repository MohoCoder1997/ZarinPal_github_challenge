part of 'repo_bloc.dart';

abstract class RepoEvent extends Equatable {
  const RepoEvent();

  @override
  List<Object> get props => [];
}

class RepoFetchedData extends RepoEvent {
  final String userName;

  RepoFetchedData({
    required this.userName,
  });

  @override
  List<Object> get props => [
        userName,
      ];
}

class RepoFetchedNextPage extends RepoEvent {
  final String userName;

  RepoFetchedNextPage({
    required this.userName,
  });

  @override
  List<Object> get props => [
        userName,
      ];
}
