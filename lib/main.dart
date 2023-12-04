import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_diploma_benchmark_project/repositories/user_repository/interface_user_repository.dart';
import 'package:flutter_diploma_benchmark_project/repositories/user_repository/services/user_service.dart';
import 'package:flutter_diploma_benchmark_project/repositories/user_repository/user_repository.dart';
import 'package:flutter_diploma_benchmark_project/views/home/home_view.dart';

class DebugBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint(event.toString());
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint(transition.toString());
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint(error.toString());
  }
}

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IUserRepository>(
          lazy: true,
          create: (context) => UserRepository(
            userService: UserService(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Benchmark',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
