import 'package:authentication_repository/authentication_repository.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_best_practices/app.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  runApp(FlutterApp(
    authenticationRepository: AuthenticationRepository(),
    userRepository: UserRepository(),
  ));
}
