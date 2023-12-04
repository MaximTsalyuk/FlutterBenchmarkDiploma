import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_diploma_benchmark_project/features/user/bloc/user_bloc.dart';
import 'package:flutter_diploma_benchmark_project/features/user/navigation/user_navigator.dart';
import 'package:flutter_diploma_benchmark_project/repositories/user_repository/models/user_model.dart';
import 'package:flutter_diploma_benchmark_project/services/overlay_service.dart';
import 'package:flutter_diploma_benchmark_project/services/toast_service.dart';

class UserView extends StatelessWidget {
  const UserView({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        navigator: UserNavigator(context),
      )..add(BlocReady()),
      child: UserViewLayout(
        userModel: userModel,
      ),
    );
  }
}

class UserViewLayout extends StatelessWidget {
  const UserViewLayout({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state.isBusy) {
          OverlayService.instance.showBusyOverlay(
            context: context,
            size: MediaQuery.of(context).size,
          );
        } else {
          OverlayService.instance.closeBusyOverlay(context);
        }

        if (state.errorMessage != '') {
          ToastService.showToast(
            message: state.errorMessage,
            context: context,
            error: true,
          );
        }
      },
      builder: (context, state) {
        final UserBloc bloc = context.read<UserBloc>();

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                bloc.navigator.pop();
              },
              icon: const Icon(CupertinoIcons.chevron_back),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Center(
                    child: CircleAvatar(
                      radius: 100.0,
                      backgroundImage: NetworkImage(
                        userModel.picture.large,
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
                Text(
                  'First Name: ${userModel.firstName}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Last Name: ${userModel.lastName}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Email: ${userModel.email}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Phone: ${userModel.phone}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Gender: ${userModel.gender}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
