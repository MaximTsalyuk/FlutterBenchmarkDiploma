import 'package:flutter_diploma_benchmark_project/repositories/user_repository/models/user_model.dart';

abstract class IUserRepository {
  Future<List<UserModel>> getUsers(int usersAmount);
}
