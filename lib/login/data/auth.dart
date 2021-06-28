import 'dart:async';

class AuthModel {
  String loginStat = 'false';
  Future<dynamic> status() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return loginStat;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2), () {
      setLogin(password.length > 5);
    });
  }

  void setLogin(dynamic statz) async => loginStat = statz.toString();

  void logOut() => setLogin('false');

  void dispose() => setLogin('false');
}
