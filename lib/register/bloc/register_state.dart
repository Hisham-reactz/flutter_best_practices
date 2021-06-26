part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({this.name = ''});

  final String name;

  RegisterState copyWith({String? name}) {
    return RegisterState(name: name ?? this.name);
  }

  @override
  List<Object> get props => [name];
}
