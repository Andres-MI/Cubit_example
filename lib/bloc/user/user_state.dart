part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserActive extends UserState {
  final User user;

  UserActive(this.user);
}
