part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class ImageChanged extends RegisterEvent {
  const ImageChanged(this.image1, this.image2);

  final String image1;
  final String image2;

  @override
  List<Object> get props => [image1, image2];
}

class RegisterShop extends RegisterEvent {
  const RegisterShop(this.formdata, this.status);

  final Object formdata;
  final String status;

  @override
  List<Object> get props => [formdata, status];
}
