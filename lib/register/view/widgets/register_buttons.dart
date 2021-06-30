part of '../register_view.dart';

ButtonStyle raisedButtonStyle(BuildContext context) {
  return ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: const Color(0xFF5567B3),
    minimumSize: Size(context.widthPct(0.8), context.widthPct(0.13)),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );
}

Widget regButton(
    BuildContext context, GlobalKey<FormState> key, RegisterState state) {
  return state.status == 'pending'
      ? const CircularProgressIndicator()
      : ElevatedButton(
          key: const Key('register_raisedButton_done'),
          style: raisedButtonStyle(context),
          child: const Text('Sign Up'),
          onPressed: () {
            var validated = key.currentState!.validate();
            if (validated) {
              key.currentState!.save();
              context
                  .read<RegisterBloc>()
                  .add(RegisterShop((inputValues), 'pending'));
            }
          },
        );
}
