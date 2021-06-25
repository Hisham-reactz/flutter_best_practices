part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUsernameChanged extends LoginEvent {
  const LoginUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class KeyboardOpen extends LoginEvent {
  const KeyboardOpen(this.keyboard);

  final bool keyboard;

  @override
  List<Object> get props => [keyboard];
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}
