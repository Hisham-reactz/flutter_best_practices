import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_best_practices/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sized_context/sized_context.dart';

import '../bloc/login_bloc.dart';
import 'widgets/login_button.dart';
import 'widgets/password_input.dart';
import 'widgets/username_input.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _openMyPage() async {
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return const HomePage();
          },
        ),
      );
    }

    double height(BuildContext context, double height) =>
        context.heightPct(height);

    double width(BuildContext context, double width) => context.widthPct(width);

    var rememberUser = true;

    Color getColor(Set<MaterialState> states) => const Color(0xFF1A3B68);

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          backgroundColor: const Color(0xFF1A3B68),
          elevation: 0,
          title: const Text('Auction Title'),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios))
          ],
          centerTitle: true,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: context.diagonalInches),
                child: Column(children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Stack(children: [
                      Container(
                        padding: const EdgeInsets.all(0),
                        color: const Color(0xFF1A3B68),
                        height: height(context, .15),
                      ),
                      Positioned(
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Image.asset('assets/images/gadgets.png',
                                  height: height(context, .20),
                                  colorBlendMode: BlendMode.luminosity)))
                    ]),
                  ),
                  Text(
                    'AUCTION TITLE',
                    style: TextStyle(
                        color: const Color(0xFF1A3B68),
                        fontSize: context.diagonalPx / 35),
                  ),
                  const Text('SUB TITLE'),
                  SizedBox(
                    height: height(context, .03),
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                      buildWhen: (previous, current) =>
                          previous.status != current.status,
                      builder: (context, state) {
                        if (state.status == 'login_true') {
                          Future.delayed(Duration.zero, _openMyPage);
                        }
                        return Padding(
                            padding: EdgeInsets.only(
                                left: width(context, .03),
                                right: width(context, .03)),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                    const UsernameInput(),
                                    Padding(
                                        padding: EdgeInsets.all(
                                            context.diagonalPx / 100)),
                                    const PasswordInput(),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              width: width(context, .1),
                                              child: Checkbox(
                                                checkColor: Colors.white,
                                                fillColor: MaterialStateProperty
                                                    .resolveWith(getColor),
                                                value: rememberUser,
                                                onChanged: (bool? value) {
                                                  rememberUser = value!;
                                                },
                                              )),
                                          SizedBox(
                                              width: width(context, .3),
                                              child: const Text('Remember |')),
                                          SizedBox(
                                              width: width(context, .4),
                                              child: TextButton(
                                                  onPressed: () {},
                                                  child: const Text(
                                                      'Forgot Password')))
                                        ]),
                                    const LoginButton(),
                                  ] +
                                  statusMsg(state, context),
                            ));
                      })
                ]))));
  }

  List<Widget> statusMsg(LoginState state, BuildContext context) {
    if (['timeout', 'login_true', 'login_false'].contains(state.status)) {
      return [SizedBox(height: context.heightPct(.01)), Text(state.status)];
    }
    return [];
  }
}
