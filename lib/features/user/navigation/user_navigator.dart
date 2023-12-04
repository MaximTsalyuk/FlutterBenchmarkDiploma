import 'package:flutter/material.dart';

class UserNavigator {
  final NavigatorState _navigator;

  UserNavigator(BuildContext context) : _navigator = Navigator.of(context);

  void pop() {
    _navigator.pop();
  }
}
