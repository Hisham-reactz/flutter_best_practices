part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({this.name = '', this.image1 = '', this.image2 = ''});

  final String name;
  final String image1;
  final String image2;

  RegisterState copyWith({String? name, String? image1, String? image2}) {
    return RegisterState(
        name: name ?? this.name,
        image1: image1 ?? this.image1,
        image2: image2 ?? this.image2);
  }

  @override
  List<Object> get props => [name, image1, image2];
}
