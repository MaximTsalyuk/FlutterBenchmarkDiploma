import 'package:flutter_diploma_benchmark_project/repositories/user_repository/interface_user_repository.dart';
import 'package:flutter_diploma_benchmark_project/repositories/user_repository/models/user_model.dart';
import 'package:flutter_diploma_benchmark_project/repositories/user_repository/services/user_service.dart';

class UserRepository implements IUserRepository {
  UserRepository({required this.userService});

  final UserService userService;

  @override
  Future<List<UserModel>> getUsers(int usersAmount) async {
    try {
      final List<UserModel> returnResult =
          await userService.getUsers(usersAmount);

      return returnResult;
    } catch (e) {
      throw Exception(e);
    }
  }
}
