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
  final String url;

 const AuthOpenedLink({
   required this.url,
  });
}
