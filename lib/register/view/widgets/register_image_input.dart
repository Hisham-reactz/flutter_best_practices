part of '../register_view.dart';

Widget imageInput(BuildContext context) {
  final _picker = ImagePicker();
  return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => previous.image1 != current.image1,
      builder: (context, state) {
        return Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            state.image1 == null
                ? Expanded(
                    flex: 1,
                    child: IconButton(
                        onPressed: () async {
                          await _picker
                              .getImage(source: ImageSource.gallery)
                              .then((value) =>
                                  // value!.readAsBytes().then((value) => )

                                  context.read<RegisterBloc>().add(ImageChanged(
                                        File(value!.path),
                                        state.image2 == null
                                            ? File(value.path)
                                            : state.image2 as File,
                                      )));
                        },
                        icon: const Icon(
                          Icons.add_a_photo_outlined,
                          size: 37,
                        )))
                : Expanded(
                    flex: 1,
                    child: state.image1 == null
                        ? Container()
                        : Image.file(
                            state.image1 as File,
                            fit: BoxFit.contain,
                          )),
            const VerticalDivider(),
            state.image2 == null
                ? Expanded(
                    flex: 1,
                    child: IconButton(
                        onPressed: () async {
                          await _picker
                              .getImage(source: ImageSource.gallery)
                              .then((value) => context.read<RegisterBloc>().add(
                                  ImageChanged(
                                      state.image1 == null
                                          ? File(value!.path)
                                          : state.image1 as File,
                                      File(value!.path))));
                        },
                        icon: const Icon(
                          Icons.add_a_photo_outlined,
                          size: 37,
                        )))
                : state.image2 == null
                    ? Container()
                    : Image.file(
                        state.image2 as File,
                        fit: BoxFit.contain,
                      ),
          ]),
          height: context.heightPct(0.2),
          decoration: const BoxDecoration(
            color: Color(0xFFEAEEF7),
          ),
        );
      });
}
