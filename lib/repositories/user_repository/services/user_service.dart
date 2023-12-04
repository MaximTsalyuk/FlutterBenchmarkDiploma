import 'dart:convert';

import 'package:flutter_diploma_benchmark_project/repositories/user_repository/models/user_model.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class UserService {
  final Client _httpClient = http.Client();
  final String _baseUrl = 'https://randomuser.me/api';

  Uri _getUrl({
    required String url,
    Map<String, String>? extraParameters,
  }) {
    final queryParameters = <String, String>{};

    if (extraParameters != null) {
      queryParameters.addAll(extraParameters);
    }

    return Uri.parse('$_baseUrl/$url')
        .replace(queryParameters: queryParameters);
  }

  Future<List<UserModel>> getUsers(int usersAmount) async {
    try {
      final response = await _httpClient.get(
        _getUrl(
          url: '/',
          extraParameters: {'results': usersAmount.toString()},
        ),
      );

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body) as Map<String, dynamic>;
        var usersJson = List.from(json['results']);

        final List<UserModel> users =
            usersJson.map((e) => UserModel.fromJson(e)).toList();

        return users;
      } else {
        throw Exception('Get Users Request Failed...');
      }
    } catch (e) {
      throw Exception('Get Users Request Failed...');
    }
  }
}
