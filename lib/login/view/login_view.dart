import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';
import 'widgets/login_button.dart';
import 'widgets/password_input.dart';
import 'widgets/username_input.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Bloc statz = context.watch<LoginBloc>();
    if (statz.state.status == 'true') {
      statz.close();
    }
    double height(BuildContext context) => MediaQuery.of(context).size.height;
    double width(BuildContext context) => MediaQuery.of(context).size.width;
    var rememberUser = true;
    ScrollController _scrollctrl;
    _scrollctrl = ScrollController();
    _scrollctrl.addListener(() {
      _scrollctrl.position.moveTo(
          statz.state.keyboard == true ? height(context) : 00.00,
          duration:
              Duration(milliseconds: statz.state.keyboard == true ? 300 : 0),
          clamp: true);
    });

    Color getColor(Set<MaterialState> states) {
      return const Color(0xFF1A3B68);
    }

    return Scaffold(
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
                physics: const ClampingScrollPhysics(),
                controller: _scrollctrl,
                child: Column(children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Stack(children: [
                      Container(
                        padding: const EdgeInsets.all(0),
                        color: const Color(0xFF1A3B68),
                        width: width(context),
                        height: height(context) / 5,
                      ),
                      Positioned(
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Image.asset('assets/images/gadgets.png',
                                  width: width(context),
                                  height: height(context) / 4,
                                  colorBlendMode: BlendMode.luminosity)))
                    ]),
                  ),
                  const Text(
                    'AUCTION TITLE',
                    style: TextStyle(color: Color(0xFF1A3B68), fontSize: 23),
                  ),
                  const Text('SUB TITLE'),
                  SizedBox(
                    height: height(context) / 17,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                      buildWhen: (previous, current) =>
                          previous.status != current.status,
                      builder: (context, state) {
                        return Padding(
                            padding: EdgeInsets.only(
                                left: width(context) / 27,
                                right: width(context) / 27),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const UsernameInput(),
                                const Padding(padding: EdgeInsets.all(12)),
                                const PasswordInput(),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Checkbox(
                                        checkColor: Colors.white,
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                                getColor),
                                        value: rememberUser,
                                        onChanged: (bool? value) {
                                          rememberUser = value!;
                                        },
                                      ),
                                      const Text('Remember Me'),
                                      const Text('|'),
                                      TextButton(
                                          onPressed: () {},
                                          child: const Text('Forgot Password'))
                                    ]),
                                const Padding(padding: EdgeInsets.all(12)),
                                const LoginButton(),
                              ],
                            ));
                      })
                ]))));
  }
}
