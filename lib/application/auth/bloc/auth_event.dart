part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLogedInDevice extends AuthEvent {}

class AuthFetchdToken extends AuthEvent {}

class AuthChekedToken extends AuthEvent {}

class AuthOpenedLink extends AuthEvent {
  final LoginDevice loginDevice;

 const AuthOpenedLink({
   required this.loginDevice,
  });
}
