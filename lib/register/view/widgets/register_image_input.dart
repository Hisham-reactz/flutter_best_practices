part of '../register_view.dart';

Widget imageInput(BuildContext context) {
  return Container(
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.add_a_photo_outlined,
            size: 37,
          )),
      const VerticalDivider(),
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.add_a_photo_outlined,
            size: 37,
          )),
    ]),
    height: MediaQuery.of(context).size.height / 4,
    width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
      color: Color(0xFFEAEEF7),
    ),
  );
}
