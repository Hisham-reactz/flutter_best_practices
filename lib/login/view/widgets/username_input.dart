import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sized_context/sized_context.dart';

import '../../bloc/login_bloc.dart';

class UsernameInput extends StatelessWidget {
  const UsernameInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _nodeText1 = FocusNode();
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.username != current.username ||
          current.status == 'validation_error',
      builder: (context, state) {
        return SizedBox(
            width: context.widthPct(0.8),
            child: TextField(
              focusNode: _nodeText1,
              onEditingComplete: _nodeText1.nextFocus,
              onSubmitted: (d) {},
              key: const Key('loginForm_usernameInput_textField'),
              keyboardAppearance: Brightness.dark,
              keyboardType: TextInputType.name,
              onChanged: (username) =>
                  context.read<LoginBloc>().add(LoginUsernameChanged(username)),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'User Name',
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFEAEEF7)),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                fillColor: const Color(0xFFEAEEF7),
                filled: true,
                errorText:
                    state.username.isEmpty && state.status == 'validation_error'
                        ? 'invalid username'
                        : null,
              ),
            ));
      },
    );
  }
}
