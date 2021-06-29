part of '../register_view.dart';

Widget imageInput(BuildContext context) {
  final _picker = ImagePicker();
  String? _pickedFile1 = '';
  String? _pickedFile2 = '';

  return Container(
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      _pickedFile1.isEmpty
          ? IconButton(
              onPressed: () async {
                await _picker
                    .getImage(source: ImageSource.gallery)
                    .then((value) => _pickedFile1 = value!.path);
              },
              icon: const Icon(
                Icons.add_a_photo_outlined,
                size: 37,
              ))
          : Expanded(
              flex: 1,
              child: Image.file(
                File(_pickedFile1),
                fit: BoxFit.contain,
              )),
      const VerticalDivider(),
      _pickedFile2.isEmpty
          ? IconButton(
              onPressed: () async {
                await _picker
                    .getImage(source: ImageSource.gallery)
                    .then((value) => _pickedFile2 = value!.path);
              },
              icon: const Icon(
                Icons.add_a_photo_outlined,
                size: 37,
              ))
          : Expanded(
              flex: 1,
              child: Image.file(
                File(_pickedFile2),
                fit: BoxFit.contain,
              ))
    ]),
    height: context.heightPct(0.2),
    decoration: const BoxDecoration(
      color: Color(0xFFEAEEF7),
    ),
  );
}
