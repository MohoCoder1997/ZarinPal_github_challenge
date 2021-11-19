part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserFetchedData extends UserEvent{

 const UserFetchedData();

  @override
  List<Object> get props => [

  ];

}

class UserLogedOut extends UserEvent{


}


