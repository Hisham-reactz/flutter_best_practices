import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../data/reg.dart';
part 'register_state.dart';
part 'register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState(image1: '', image2: ''));
  final _regModel = RegModel();
  Timer? _timer;
  final _timeout = const Duration(minutes: 1);
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
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is ImageChanged) {
      yield _mapImageChangedToState(event, state);
    } else if (event is RegisterShop) {
      yield* _mapRegisterShopToState(event, state);
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

  Stream<RegisterState> _mapRegisterShopToState(
    RegisterShop event,
    RegisterState state,
  ) async* {
    dynamic formdata = event.formdata;

    yield state.copyWith(status: 'pending');
    try {
      _i++;
      if (_i > 5) startTimeout();
      if (_timer != null && _timer!.isActive == true) {
        yield state.copyWith(status: 'timeout');
      } else {
        await _regModel.register(formdata: formdata as Object);
        dynamic _statr = await _regModel.status();
        yield state.copyWith(status: 'register_$_statr');
      }
    } on Exception catch (_) {
      yield state.copyWith(status: 'false');
    }
  }
}
