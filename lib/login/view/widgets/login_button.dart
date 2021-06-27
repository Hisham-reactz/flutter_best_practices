import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../register/register.dart';
import '../../bloc/login_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    void _openMyPage() async {
      await Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const RegisterPage(),
        ),
      );
    }

    raisedButtonStyle(dynamic type) => ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary:
              type == 0 ? const Color(0xFF1A3B68) : const Color(0xFF5567B3),
          minimumSize: Size(MediaQuery.of(context).size.width / 1.2, 50),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        );
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == 'pending'
            ? const CircularProgressIndicator()
            : Column(children: [
                ElevatedButton(
                  key: const Key('loginForm_continue_raisedButton'),
                  style: raisedButtonStyle(0),
                  child: const Text('Sign In'),
                  onPressed: [
                    'validation_error',
                    'false',
                    'login_false',
                    'timeout'
                  ].contains(state.status)
                      ? () {
                          context.read<LoginBloc>().add(const LoginSubmitted());
                        }
                      : null,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                ElevatedButton(
                  key: const Key('register_raisedButton'),
                  style: raisedButtonStyle(1),
                  child: const Text('Sign Up'),
                  onPressed: () async {
                    _openMyPage();
                  },
                )
              ]);
      },
    );
  }
}
