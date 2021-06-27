import 'package:flutter/material.dart';
part 'widgets/register_buttons.dart';
part 'widgets/register_form_inputs.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    getInputs();
    double height(BuildContext context) => MediaQuery.of(context).size.height;
    double width(BuildContext context) => MediaQuery.of(context).size.width;
    return MaterialApp(
        title: 'Welcome to Flutter',
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
                    width: width(context),
                    height: height(context) / 10,
                    child: Padding(
                        padding: EdgeInsets.only(left: width(context) / 20),
                        child: const ListTile(
                          title: Text(
                            'Leading',
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            'Register Your Shop',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          trailing: IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                              )),
                        )),
                  )),
              Padding(
                  padding: const EdgeInsets.all(23),
                  child: Material(
                      borderRadius: BorderRadius.circular(10),
                      type: MaterialType.card,
                      shadowColor: Colors.grey,
                      elevation: 3,
                      child: Padding(
                          padding: const EdgeInsets.all(17),
                          child: Form(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: inputList + [regButton(context)]),
                          )))),
            ]),
          ),
        ));
  }
}
