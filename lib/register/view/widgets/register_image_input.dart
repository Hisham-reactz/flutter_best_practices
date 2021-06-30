part of '../register_view.dart';

Widget imageInput(BuildContext context, RegisterState state) {
  final _picker = ImagePicker();

  return Container(
    child: Row(children: [
      state.image1.isEmpty
          ? Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: () async {
                    await _picker.getImage(source: ImageSource.gallery).then(
                        (value) =>
                            context.read<RegisterBloc>().add(ImageChanged(
                                  value!.path,
                                  state.image2.isNotEmpty ? state.image2 : '',
                                )));
                  },
                  icon: Icon(
                    Icons.add_a_photo_outlined,
                    size: context.diagonalPx / 25,
                  )))
          : Expanded(
              flex: 1,
              child: Stack(children: [
                Image.file(
                  File(state.image1),
                  fit: BoxFit.contain,
                ),
                IconButton(
                  onPressed: () {
                    context.read<RegisterBloc>().add(ImageChanged(
                        '', state.image2.isNotEmpty ? state.image2 : ''));
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.orangeAccent,
                  ),
                )
              ])),
      const VerticalDivider(),
      state.image2.isEmpty
          ? Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: () async {
                    await _picker.getImage(source: ImageSource.gallery).then(
                        (value) => context.read<RegisterBloc>().add(
                            ImageChanged(
                                state.image1.isNotEmpty ? state.image1 : '',
                                value!.path)));
                  },
                  icon: Icon(
                    Icons.add_a_photo_outlined,
                    size: context.diagonalPx / 25,
                  )))
          : Expanded(
              flex: 1,
              child: Stack(children: [
                Image.file(
                  File(state.image2),
                  fit: BoxFit.contain,
                ),
                IconButton(
                  onPressed: () {
                    context.read<RegisterBloc>().add(ImageChanged(
                        state.image1.isNotEmpty ? state.image1 : '', ''));
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.orangeAccent,
                  ),
                )
              ])),
    ]),
    height: context.heightPct(0.2),
    decoration: const BoxDecoration(
      color: Color(0xFFEAEEF7),
    ),
  );
}
