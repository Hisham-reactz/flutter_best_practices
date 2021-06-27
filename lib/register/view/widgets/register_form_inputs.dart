part of '../register_view.dart';

List<String> inputs = [
  'Shop Name',
  'Password',
  'Password Confirmation',
  'State',
  'Pin Code',
  'Email ID',
  'District',
  'Street',
  'Phone Number',
  'Country',
  'City',
  'About Shop',
];
List<Widget> inputList = [];

Widget textInput(dynamic data) => TextFormField(
      key: Key(data.toString()),
      textInputAction:
          data != 'About Shop' ? TextInputAction.next : TextInputAction.done,
      maxLines: data != 'About Shop' ? 1 : 3,
      keyboardType: ['Pin Code'].contains(data)
          ? TextInputType.number
          : ['Phone Number'].contains(data)
              ? TextInputType.phone
              : ['Email ID'].contains(data)
                  ? TextInputType.emailAddress
                  : ['About Shop'].contains(data)
                      ? TextInputType.multiline
                      : TextInputType.name,
      keyboardAppearance: Brightness.dark,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $data';
        }
        return null;
      },
      obscureText: data == 'Password' || data == 'Password Confirmation',
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEAEEF7)),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        fillColor: const Color(0xFFEAEEF7),
        border: const OutlineInputBorder(),
        filled: true,
        hintText: data.toString(),
        hintMaxLines: data != 'About Shop' ? 1 : 3,
      ),
    );
Widget paddingz = const SizedBox(
  height: 12,
);

void getInputs() {
  inputList.clear();
  inputs
      .map<dynamic>((e) => inputList.addAll([textInput(e), paddingz]))
      .toList();
}
