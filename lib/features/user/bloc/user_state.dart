part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState({
    this.errorMessage = '',
    this.isBusy = false,
  });

  final bool isBusy;
  final String errorMessage;

  UserState copyWith({
    bool? isBusy,
    String? errorMessage,
  }) =>
      UserInitial(
        errorMessage: errorMessage ?? '',
        isBusy: isBusy ?? this.isBusy,
      );

  @override
  List<Object> get props => [
        isBusy,
        errorMessage,
      ];
}

final class UserInitial extends UserState {
  const UserInitial({super.errorMessage, super.isBusy});
}
