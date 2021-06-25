import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';
import '../data/auth.dart';
import 'login_view.dart';

class LoginPage extends StatelessWidget {
  /// {@macro counter_page}
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(authModel: AuthModel()),
      child: const LoginForm(),
    );
  }
}
