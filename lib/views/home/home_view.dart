import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_diploma_benchmark_project/repositories/user_repository/interface_user_repository.dart';
import 'package:flutter_diploma_benchmark_project/repositories/user_repository/models/user_model.dart';
import 'package:flutter_diploma_benchmark_project/services/overlay_service.dart';
import 'package:flutter_diploma_benchmark_project/services/toast_service.dart';
import 'package:flutter_diploma_benchmark_project/views/home/bloc/home_bloc.dart';
import 'package:flutter_diploma_benchmark_project/views/home/navigation/home_navigator.dart';
import 'package:flutter_diploma_benchmark_project/widget_helper/user_tile.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        userRepository: context.read<IUserRepository>(),
        navigator: HomeNavigator(context),
      )..add(BlocReady()),
      child: const HomeViewLayout(),
    );
  }
}

class HomeViewLayout extends StatelessWidget {
  const HomeViewLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
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
        final HomeBloc bloc = context.read<HomeBloc>();

        return Scaffold(
          body: GridView.count(
            crossAxisCount: 2,
            children: [
              for (UserModel user in (state.users ?? []))
                UserTile(
                  user: user,
                  onTap: () {
                    bloc.add(UserTileTap(userModel: user));
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
