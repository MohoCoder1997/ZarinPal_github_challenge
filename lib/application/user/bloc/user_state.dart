part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserStateInital extends UserState {}

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

  const UserLoadFailure({
    required this.fail,
  });
  @override
  List<Object> get props => [
        fail,
      ];
}
