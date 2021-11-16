part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserFetchedData extends UserEvent{
  final String userName;

 const UserFetchedData({required this.userName,});

  @override
  List<Object> get props => [
    userName
  ];

}


