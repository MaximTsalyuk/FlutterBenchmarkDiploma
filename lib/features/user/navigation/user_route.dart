import 'package:flutter/material.dart';
import 'package:flutter_diploma_benchmark_project/features/user/user_view.dart';
import 'package:flutter_diploma_benchmark_project/repositories/user_repository/models/user_model.dart';

class UserRoute extends MaterialPageRoute {
  UserRoute({
    required UserModel userModel,
  }) : super(
          builder: (context) => UserView(
            userModel: userModel,
          ),
        );
}
