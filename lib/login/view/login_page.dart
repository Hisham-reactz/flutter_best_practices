import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc.dart';
import 'login_view.dart';

class LoginPage extends StatelessWidget {
  /// {@macro counter_page}
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authrepo = AuthenticationRepository();
    return BlocProvider(
      create: (_) => LoginBloc(authenticationRepository: authrepo),
      child: const LoginForm(),
    );
  }
}
