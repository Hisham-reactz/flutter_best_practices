import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sized_context/sized_context.dart';

import '../../bloc/login_bloc.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _nodeText2 = FocusNode();
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          current.status == 'validation_error',
      builder: (context, state) {
        return SizedBox(
            width: context.widthPct(0.8),
            child: TextField(
              focusNode: _nodeText2,
              onEditingComplete: () {
                Future.delayed(
                    const Duration(milliseconds: 100), _nodeText2.unfocus);
              },
              onSubmitted: (d) {},
              key: const Key('loginForm_passwordInput_textField'),
              onChanged: (password) =>
                  context.read<LoginBloc>().add(LoginPasswordChanged(password)),
              obscureText: true,
              keyboardAppearance: Brightness.dark,
              decoration: InputDecoration(
                errorText:
                    state.password.isEmpty && state.status == 'validation_error'
                        ? 'invalid password'
                        : null,
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFEAEEF7)),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                fillColor: const Color(0xFFEAEEF7),
                border: const OutlineInputBorder(),
                filled: true,
                hintText: 'Password',
              ),
            ));
      },
    );
  }
}
