part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserLoadInProgress extends UserState {}

class UserLoadSuccess extends UserState {
  final User user;

  const UserLoadSuccess({
    required this.user,
  });
  @override
  List<Object> get props => [
        user,
      ];
}

class UserLoadFailure extends UserState {
  final HttpFail fail;
  final String userName;

  const UserLoadFailure({
    required this.fail,
    required this.userName,
  });
  @override
  List<Object> get props => [
        fail,
        userName,
      ];
}
