import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_best_practices/register/bloc/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sized_context/sized_context.dart';
part 'widgets/register_buttons.dart';
part 'widgets/register_form_inputs.dart';
part 'widgets/register_image_input.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  GlobalKey<FormState>? formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
  }

  @override
  void didChangeDependencies() {
    getInputs(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    void _popz() {
      Navigator.pop(context, true); // dialog returns true
    }

    double height(BuildContext context, double height) =>
        context.heightPct(height);
    double width(BuildContext context, double width) => context.widthPct(width);
    return MaterialApp(
        title: 'Register your shop',
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: _popz,
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            backgroundColor: const Color(0xFF1A3B68),
            elevation: 0,
            title: const Text('Registration'),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios))
            ],
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: BlocBuilder<RegisterBloc, RegisterState>(
                buildWhen: (previous, current) =>
                    previous.image1 != current.image1 ||
                    previous.image2 != current.image2 ||
                    previous.status != current.status,
                builder: (context, state) {
                  if (state.status == 'register_true') {
                    Future.delayed(Duration.zero, _popz);
                  }
                  return Column(mainAxisSize: MainAxisSize.max, children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          color: const Color(0xFF1A3B68),
                          height: height(context, .13),
                          child: Padding(
                              padding:
                                  EdgeInsets.only(left: width(context, .01)),
                              child: ListTile(
                                title: const Text(
                                  'Leading',
                                  style: TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  'Register Your Shop',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: context.diagonalPx / 35),
                                ),
                                trailing: const IconButton(
                                    onPressed: null,
                                    icon: Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    )),
                              )),
                        )),
                    Padding(
                        padding: EdgeInsets.all(context.diagonalPx / 75),
                        child: Material(
                            borderRadius: BorderRadius.circular(10),
                            type: MaterialType.card,
                            shadowColor: Colors.grey,
                            elevation: 3,
                            child: Padding(
                                padding:
                                    EdgeInsets.all(context.diagonalPx / 37),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                          imageInput(context, state),
                                          SizedBox(
                                            height: context.heightPct(.03),
                                          )
                                        ] +
                                        inputList +
                                        [
                                          regButton(
                                              context,
                                              formKey as GlobalKey<FormState>,
                                              state)
                                        ] +
                                        statusMsg(state, context),
                                  ),
                                ))))
                  ]);
                }),
          ),
        ));
  }

  List<Widget> statusMsg(RegisterState state, BuildContext context) {
    if (['timeout', 'register_true', 'register_false'].contains(state.status)) {
      return [SizedBox(height: context.heightPct(.01)), Text(state.status)];
    }
    return [];
  }
}
