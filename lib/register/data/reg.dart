import 'dart:async';

class RegModel {
  bool _regStatus = false;

  Future<void> register({
    required Object formdata,
  }) async {
    await Future.delayed(const Duration(seconds: 2), () {
      setReg(formdata != (''));
    });
  }

  Future<dynamic> status() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return _regStatus;
  }

  void setReg(bool statz) async => _regStatus = statz;

  void dispose;
}
