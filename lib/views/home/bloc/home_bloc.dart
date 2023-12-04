import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_diploma_benchmark_project/repositories/user_repository/interface_user_repository.dart';
import 'package:flutter_diploma_benchmark_project/repositories/user_repository/models/user_model.dart';
import 'package:flutter_diploma_benchmark_project/views/home/navigation/home_navigator.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IUserRepository userRepository;

  final HomeNavigator navigator;

  HomeBloc({
    required this.userRepository,
    required this.navigator,
  }) : super(const HomeInitial()) {
    on<UserTileTap>((event, emit) async {
      log('Navigation Start Timestamp: ${DateTime.now().toString()}');

      navigator.goToUserPage(userModel: event.userModel);
    });

    on<BlocReady>((event, emit) async {
      log('Users Fetch Start Timestamp: ${DateTime.now().toString()}');

      emit(state.copyWith(isBusy: true));

      try {
        final users = await userRepository.getUsers(1000);

        emit(state.copyWith(users: users, isBusy: false));

        log('Users Fetch End Timestamp: ${DateTime.now().toString()}');
      } catch (e) {
        emit(state.copyWith(isBusy: false, errorMessage: e.toString()));
      }
    });
  }
}
