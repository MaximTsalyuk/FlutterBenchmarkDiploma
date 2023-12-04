import 'package:flutter/material.dart';
import 'package:flutter_diploma_benchmark_project/features/user/navigation/user_route.dart';
import 'package:flutter_diploma_benchmark_project/repositories/user_repository/models/user_model.dart';

class HomeNavigator {
  final NavigatorState _navigator;

  HomeNavigator(BuildContext context) : _navigator = Navigator.of(context);

  void goToUserPage({
    required UserModel userModel,
  }) {
    _navigator.push(UserRoute(userModel: userModel));
  }
}
