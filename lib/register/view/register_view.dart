import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_best_practices/register/bloc/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sized_context/sized_context.dart';
part 'widgets/register_buttons.dart';
part 'widgets/register_form_inputs.dart';
part 'widgets/register_image_input.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    getInputs(context);
    double height(BuildContext context, double height) =>
        context.heightPct(height);

    double width(BuildContext context, double width) => context.widthPct(width);
    return MaterialApp(
        title: 'Register your shop',
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
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
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    color: const Color(0xFF1A3B68),
                    height: height(context, .10),
                    child: Padding(
                        padding: EdgeInsets.only(left: width(context, .01)),
                        child: ListTile(
                          title: const Text(
                            'Leading',
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            'Register Your Shop',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: context.diagonalInches * 3),
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
                  padding: EdgeInsets.all(context.diagonalInches * 2),
                  child: Material(
                      borderRadius: BorderRadius.circular(10),
                      type: MaterialType.card,
                      shadowColor: Colors.grey,
                      elevation: 3,
                      child: Padding(
                          padding: EdgeInsets.all(context.diagonalInches * 4),
                          child: Form(
                            key: formKey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                      imageInput(context),
                                      SizedBox(
                                        height: context.heightPct(.03),
                                      )
                                    ] +
                                    inputList +
                                    [regButton(context, formKey)]),
                          )))),
            ]),
          ),
        ));
  }
}
