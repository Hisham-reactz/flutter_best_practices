import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const LoginState());

  final AuthenticationRepository _authenticationRepository;
  final _timeout = const Duration(minutes: 1);
  Timer? _timer;
  int _i = 0;

  void handleTimeout() {
    _i = 0;
    _timer!.cancel();
  }

  Timer? startTimeout() {
    _timer = Timer(_timeout, handleTimeout);
    return _timer;
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUsernameChanged) {
      yield _mapUsernameChangedToState(event, state);
    } else if (event is LoginPasswordChanged) {
      yield _mapPasswordChangedToState(event, state);
    } else if (event is LoginSubmitted) {
      yield* _mapLoginSubmittedToState(event, state);
    }
  }

  LoginState _mapUsernameChangedToState(
    LoginUsernameChanged event,
    LoginState state,
  ) {
    final username = event.username;
    return state.copyWith(
      username: username,
    );
  }

  LoginState _mapPasswordChangedToState(
    LoginPasswordChanged event,
    LoginState state,
  ) {
    final password = event.password;
    return state.copyWith(
      password: password,
    );
  }

  Stream<LoginState> _mapLoginSubmittedToState(
      LoginSubmitted event, LoginState state) async* {
    if (state.password.isNotEmpty && state.username.isNotEmpty) {
      yield state.copyWith(status: 'pending');
      try {
        // DUMMY API TO BE REPLACED BY REAL ONE IN _authRepo
        //Login API debounce // *#$@$#stream*
        _i++;
        if (_i > 5) startTimeout();
        if (_timer != null && _timer!.isActive == true) {
          yield state.copyWith(status: 'timeout');
        } else {
          await _authenticationRepository.logIn(
            username: state.username,
            password: state.password,
          );

          var statz = state.password.length > 5;

          yield state.copyWith(status: 'login_$statz');
        }
      } on Exception catch (_) {
        yield state.copyWith(status: 'false');
      }
    } else {
      yield state.copyWith(status: 'validation_error');
    }
  }
}
