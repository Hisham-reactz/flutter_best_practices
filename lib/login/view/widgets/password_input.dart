import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/login_bloc.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController _passctrl;
    _passctrl = TextEditingController();
    _passctrl.addListener(() {
      context.read<LoginBloc>().add(const KeyboardOpen(true));
    });
    final _nodeText2 = FocusNode();
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return SizedBox(
            width: MediaQuery.of(context).size.width / 1.2,
            child: TextField(
              focusNode: _nodeText2,
              controller: _passctrl,
              onEditingComplete: () {
                context.read<LoginBloc>().add(const KeyboardOpen(false));
                Timer(const Duration(milliseconds: 100), _nodeText2.unfocus);
              },
              onSubmitted: (d) {
                context.read<LoginBloc>().add(const KeyboardOpen(false));
              },
              key: const Key('loginForm_passwordInput_textField'),
              onChanged: (password) =>
                  context.read<LoginBloc>().add(LoginPasswordChanged(password)),
              obscureText: true,
              keyboardAppearance: Brightness.dark,
              decoration: InputDecoration(
                errorText: state.password.isEmpty && state.status == 'pending'
                    ? 'invalid username'
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
