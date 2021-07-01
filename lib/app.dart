import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_best_practices/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_best_practices/home/home.dart';
import 'package:flutter_best_practices/login/login.dart';
import 'package:flutter_best_practices/splash/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:user_repository/user_repository.dart';

class FlutterApp extends StatelessWidget {
  const FlutterApp({
    Key? key,
    required this.authenticationRepository,
    required this.userRepository,
  }) : super(key: key);

  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
          userRepository: userRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return const LoginPage();
                    },
                  ),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return const HomePage();
                    },
                  ),
                  (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return const SplashPage();
        },
      ),
    );
  }
}
