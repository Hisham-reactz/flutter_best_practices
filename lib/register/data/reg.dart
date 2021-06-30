import 'dart:async';

class RegModel {
  bool _regStatus = false;

  Future<void> register(
      {required Object formdata, required List images}) async {
    await Future.delayed(const Duration(seconds: 2), () {
      setReg(formdata != ('') && images.isNotEmpty);
    });
  }

  Future<dynamic> status() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return _regStatus;
  }

  void setReg(bool statz) async => _regStatus = statz;

  void dispose;
}
