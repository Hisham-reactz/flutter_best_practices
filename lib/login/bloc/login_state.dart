part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = false,
    this.username = '',
    this.password = '',
  });

  final bool status;
  final String username;
  final String password;

  LoginState copyWith({
    bool? status,
    String? username,
    String? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, username, password];
}
