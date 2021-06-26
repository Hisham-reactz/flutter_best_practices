import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'register_state.dart';
part 'register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState());
  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {}
}
