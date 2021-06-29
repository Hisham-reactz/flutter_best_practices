part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class ImageChanged extends RegisterEvent {
  const ImageChanged(this.image1, this.image2);

  final File image1;
  final File image2;

  @override
  List<Object> get props => [image1, image2];
}
