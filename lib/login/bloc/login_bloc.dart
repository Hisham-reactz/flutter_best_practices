import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../data/auth.dart';
part 'login_event.dart';
part 'login_state.dart';

dynamic timer = 'dead';
int i = 0;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthModel authModel,
  })  : _authenticationModel = authModel,
        super(const LoginState());

  final AuthModel _authenticationModel;

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
      status: 'false',
    );
  }

  LoginState _mapPasswordChangedToState(
    LoginPasswordChanged event,
    LoginState state,
  ) {
    final password = event.password;
    return state.copyWith(
      password: password,
      status: 'false',
    );
  }

  Stream<LoginState> _mapLoginSubmittedToState(
    LoginSubmitted event,
    LoginState state,
  ) async* {
    if (state.password.isNotEmpty && state.username.isNotEmpty) {
      yield state.copyWith(status: 'pending');
      try {
        // DUMMY API TO BE REPLACED BY REAL ONE IN _authenticationModel
        //Login API debounce
        if (timer == 'dead') {
          i++;
          timer = i > 5 ? Timer(const Duration(minutes: 1), () {}) : 'dead';
          await _authenticationModel.logIn(
            username: state.username,
            password: state.password,
          );
          dynamic statr = await AuthModel().status();
          yield state.copyWith(status: 'login_$statr');
        } else {
          if (timer.isActive == true) {
            yield state.copyWith(status: 'timeout');
          } else {
            timer.cancel();
            timer = 'dead';
            i = 0;
            yield state.copyWith(status: 'false');
          }
        }
      } on Exception catch (_) {
        yield state.copyWith(status: 'false');
      }
    } else {
      yield state.copyWith(status: 'validation_error');
    }
  }
}
