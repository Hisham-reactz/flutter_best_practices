part of '../register_view.dart';

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
List<Widget> inputList = [
  textInput('Shop Name'),
  paddingz,
  textInput('Password'),
  paddingz,
  textInput('Password Confirmation'),
  paddingz,
  textInput('State'),
  paddingz,
  textInput('Pin Code'),
  paddingz,
  textInput('Email ID'),
  paddingz,
  textInput('District'),
  paddingz,
  textInput('Street'),
  paddingz,
  textInput('Phone Number'),
  paddingz,
  textInput('Country'),
  paddingz,
  textInput('City'),
  paddingz,
  textInput('About Shop'),
];
