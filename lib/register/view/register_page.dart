import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/register_bloc.dart';
import 'register_view.dart';

class RegisterPage extends StatelessWidget {
  /// {@macro counter_page}
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterBloc(),
      child: const RegisterView(),
    );
  }
}
