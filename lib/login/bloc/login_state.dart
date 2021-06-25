part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState(
      {this.status = 'false',
      this.username = '',
      this.password = '',
      this.keyboard = false});

  final String status;
  final String username;
  final String password;
  final bool keyboard;

  LoginState copyWith(
      {String? status, String? username, String? password, bool? keyboard}) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      keyboard: keyboard ?? this.keyboard,
    );
  }

  @override
  List<Object> get props => [status, username, password, keyboard];
}
