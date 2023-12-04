import 'package:flutter/material.dart';
import 'package:flutter_diploma_benchmark_project/repositories/user_repository/models/user_model.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.user,
    this.onTap,
  });

  final UserModel user;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(.08),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                  user.picture.thumbnail,
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
            const Text(
              'Hi, My name is',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              user.firstName,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
