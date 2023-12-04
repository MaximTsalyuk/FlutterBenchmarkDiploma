import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_diploma_benchmark_project/features/user/navigation/user_navigator.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserNavigator navigator;

  UserBloc({
    required this.navigator,
  }) : super(const UserInitial()) {
    on<BlocReady>((event, emit) {
      log('Navigation End Timestamp: ${DateTime.now().toString()}');
    });
  }
}
