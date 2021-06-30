part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState(
      {this.status = '',
      this.image1 = '',
      this.image2 = '',
      this.formdata = ('')});

  final String status;
  final String image1;
  final String image2;
  final Object formdata;

  RegisterState copyWith(
      {String? status, String? image1, String? image2, Object? formdata}) {
    return RegisterState(
        status: status ?? this.status,
        formdata: formdata ?? this.formdata,
        image1: image1 ?? this.image1,
        image2: image2 ?? this.image2);
  }

  @override
  List<Object> get props => [status, image1, image2, formdata];
}
