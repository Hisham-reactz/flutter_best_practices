part of '../register_view.dart';

Widget imageInput(BuildContext context) {
  final _picker = ImagePicker();
  Uint8List? _pickedFile1;
  Uint8List? _pickedFile2;

  return Container(
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      _pickedFile1 == null
          ? Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: () async {
                    await _picker.getImage(source: ImageSource.gallery).then(
                        (value) => value!
                            .readAsBytes()
                            .then((value) => _pickedFile1 = value));
                  },
                  icon: const Icon(
                    Icons.add_a_photo_outlined,
                    size: 37,
                  )))
          : Expanded(
              flex: 1,
              child: Image.memory(
                _pickedFile1,
                fit: BoxFit.contain,
              )),
      const VerticalDivider(),
      _pickedFile2 == null
          ? Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: () async {
                    await _picker.getImage(source: ImageSource.gallery).then(
                        (value) => value!
                            .readAsBytes()
                            .then((value) => _pickedFile2 = value));
                  },
                  icon: const Icon(
                    Icons.add_a_photo_outlined,
                    size: 37,
                  )))
          : Expanded(
              flex: 1,
              child: Image.memory(
                _pickedFile2,
                fit: BoxFit.contain,
              ))
    ]),
    height: context.heightPct(0.2),
    decoration: const BoxDecoration(
      color: Color(0xFFEAEEF7),
    ),
  );
}
