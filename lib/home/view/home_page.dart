import 'package:flutter/material.dart';

import 'home_view.dart';

class HomePage extends StatelessWidget {
  /// {@macro counter_page}
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // BlocProvider(
        //   create: (_) => LoginBloc(authModel: AuthModel()),
        //   child:
        const HomePageView();
    // );
  }
}
