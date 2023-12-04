part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class BlocReady extends HomeEvent {}

class UserTileTap extends HomeEvent {
  final UserModel userModel;

  const UserTileTap({required this.userModel});
}
