part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}


class AuthTokenNotAvailable extends AuthState {}

class AuthLoadInProgress extends AuthState {}

class AuthOpenLinkSuccess extends AuthState {}

class AuthTokenIsAvailable extends AuthState {}



class AuthLogeInLoadSuccess extends AuthState {
  final LoginDevice loginDevice;
  final UrlLuncherException? urlFail;
  const AuthLogeInLoadSuccess({
    required this.loginDevice,
    required this.urlFail,
  });
  @override
  List<Object?> get props => [
        loginDevice,
        urlFail,
      ];
}

class AuthGetTokenLoadSuccess extends AuthState {
  final AccessToken accessToken;

  const AuthGetTokenLoadSuccess({
    required this.accessToken,
  });
  @override
  List<Object> get props => [accessToken];
}

class AuthLogeInLoadFail extends AuthState {
  final HttpFail fail;

  const AuthLogeInLoadFail({
    required this.fail,
  });
  @override
  List<Object> get props => [fail];
}

class AuthGetTokenLoadFail extends AuthState {
  final HttpFail fail;

  const AuthGetTokenLoadFail({
    required this.fail,
  });
  @override
  List<Object> get props => [
        fail,
      ];
}
