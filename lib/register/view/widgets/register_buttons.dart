part of '../register_view.dart';

ButtonStyle raisedButtonStyle(BuildContext context) {
  return ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: const Color(0xFF5567B3),
    minimumSize: Size(MediaQuery.of(context).size.width / 1.2, 50),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );
}

Widget regButton(BuildContext context) {
  return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        key: const Key('register_raisedButton_done'),
        style: raisedButtonStyle(context),
        child: const Text('Sign Up'),
        onPressed: () {},
      ));
}
