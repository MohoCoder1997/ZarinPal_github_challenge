import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_challenge/domain/core/failure_response.dart';
import 'package:github_challenge/domain/entities/user.dart';
import 'package:github_challenge/domain/repository/i_repository.dart';
import 'package:injectable/injectable.dart';

part 'user_event.dart';
part 'user_state.dart';

@Injectable()
class UserBloc extends Bloc<UserEvent, UserState> {
  final IRepository _repository;
  UserBloc(this._repository) : super(UserStateInital());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    yield UserLoadInProgress();
    if (event is UserFetchedData) {
      final _result = await _repository.getUserInfo(userName: event.userName);
      yield _result.fold(
        (fail) => UserLoadFailure(fail: fail, userName: event.userName),
        (user) => UserLoadSuccess(user: user),
      );
    }
  }
}
