part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState({
    this.errorMessage = '',
    this.isBusy = false,
    this.users = const [],
  });

  final bool isBusy;
  final String errorMessage;
  final List<UserModel>? users;

  HomeState copyWith({
    bool? isBusy,
    String? errorMessage,
    List<UserModel>? users,
  }) =>
      HomeInitial(
        errorMessage: errorMessage ?? '',
        isBusy: isBusy ?? this.isBusy,
        users: users ?? this.users,
      );

  @override
  List<Object?> get props => [
        isBusy,
        errorMessage,
        users,
      ];
}

final class HomeInitial extends HomeState {
  const HomeInitial({
    super.errorMessage,
    super.isBusy,
    super.users,
  });
}
