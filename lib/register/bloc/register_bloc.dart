import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'register_state.dart';
part 'register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState());
  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is ImageChanged) {
      yield _mapImageChangedToState(event, state);
    }
  }

  RegisterState _mapImageChangedToState(
    ImageChanged event,
    RegisterState state,
  ) {
    final image1 = event.image1;
    final image2 = event.image2;
    return state.copyWith(
      image1: image1,
      image2: image2,
    );
  }
}
