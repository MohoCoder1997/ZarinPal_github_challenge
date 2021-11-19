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
    
    if (event is UserFetchedData) {
      yield UserLoadInProgress();
      final _result = await _repository.getUserInfo();
      yield _result.fold(
        (fail) => UserLoadFailure(fail: fail),
        (user) => UserLoadSuccess(user: user),
      );
    }
    if(event is UserLogedOut){
      yield UserStateInital();
    }
  }
}
