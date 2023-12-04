import 'package:flutter_diploma_benchmark_project/repositories/user_repository/models/picture_model.dart';

class UserModel {
  final String gender, firstName, lastName, email, phone;
  final int age;
  final PictureModel picture;

  UserModel({
    required this.gender,
    required this.firstName,
    required this.age,
    required this.email,
    required this.lastName,
    required this.phone,
    required this.picture,
  });

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        gender: json['gender'],
        firstName: json['name']['first'],
        lastName: json['name']['last'],
        email: json['email'],
        phone: json['phone'],
        picture: PictureModel.fromJson(json['picture']),
        age: json['dob']['age'],
      );

  Map<String, dynamic> toJson() => {
        'gender': gender,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phone': phone,
        'picture': picture.toJson(),
        'age': age,
      };
}
