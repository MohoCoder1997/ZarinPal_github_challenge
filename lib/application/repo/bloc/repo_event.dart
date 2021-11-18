part of 'repo_bloc.dart';

abstract class RepoEvent extends Equatable {
  const RepoEvent();

  @override
  List<Object> get props => [];
}

class RepoFetchedData extends RepoEvent {


 const RepoFetchedData();

  @override
  List<Object> get props => [

      ];
}

class RepoFetchedNextPage extends RepoEvent {


 const RepoFetchedNextPage();

  @override
  List<Object> get props => [

      ];
}
