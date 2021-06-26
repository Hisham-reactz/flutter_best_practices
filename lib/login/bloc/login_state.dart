part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = 'false',
    this.username = '',
    this.password = '',
  });

  final String status;
  final String username;
  final String password;

  LoginState copyWith({String? status, String? username, String? password}) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, username, password];
}
