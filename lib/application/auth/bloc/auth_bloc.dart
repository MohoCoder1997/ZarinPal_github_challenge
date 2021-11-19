import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_challenge/core/persistent_storage_handler.dart';
import 'package:github_challenge/core/url_luncher.dart';
import 'package:github_challenge/domain/core/app_register_config.dart';
import 'package:github_challenge/domain/core/failure_response.dart';
import 'package:github_challenge/domain/entities/access_token.dart';
import 'package:github_challenge/domain/entities/login_device.dart';
import 'package:github_challenge/domain/repository/i_repository.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@Injectable()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IRepository _repository;
  final PersistentStorageHandler _storageHandler;
  final UrlLuncher _urlLuncher;
  AuthBloc(this._repository, this._storageHandler, this._urlLuncher)
      : super(AuthTokenNotAvailable());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthLogedInDevice) {
      yield AuthLoadInProgress();
      final _result = await _repository.loginDevice();
      yield _result.fold(
        (fail) => AuthLogeInLoadFail(fail: fail),
        (loginDevice) {
          RegisterConfig.deviceCode = loginDevice.deviceCode;
          return AuthLogeInLoadSuccess(loginDevice: loginDevice, urlFail: null);
        },
      );
    }
    if (event is AuthFetchdToken) {
      yield AuthLoadInProgress();
      final _result = await _repository.getAccessToken();
      yield await _result.fold(
        (fail) => AuthGetTokenLoadFail(fail: fail),
        (accessToken) async {
          RegisterConfig.token = accessToken.accessToken;
          await _storageHandler.save(key: 'token', value: accessToken.accessToken);
          await _storageHandler.save(
              key: 'token', value: accessToken.accessToken);
          return AuthGetTokenLoadSuccess(accessToken: accessToken);
        },
      );
    }

    if (event is AuthChekedToken) {
      yield AuthLoadInProgress();
      final _token = _storageHandler.load(key: 'token');
      if (_token != null) {
        RegisterConfig.token = _token;
        yield AuthTokenIsAvailable();
      } else {
        yield AuthTokenNotAvailable();
      }
    }

    if (event is AuthOpenedLink) {
      if (await _urlLuncher.canLunchUrl(
          url: event.loginDevice.varificationUri)) {
        final _result =
            await _urlLuncher.openLink(url: event.loginDevice.varificationUri);
        yield await _result.fold(
          (fail) => AuthLogeInLoadSuccess(
              loginDevice: event.loginDevice, urlFail: fail),
          (r) async => AuthOpenLinkSuccess(),
        );
      }
    }

    if(event is AuthLogedOut){
      _storageHandler.delete(key: 'token');
      yield AuthTokenNotAvailable();
    }
  }
}
