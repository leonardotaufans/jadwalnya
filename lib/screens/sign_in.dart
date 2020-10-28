import 'package:flutter/material.dart';
import 'package:jadwalnya/components/auth_header.dart';
import 'package:jadwalnya/components/custom_button_fullsize.dart';
import 'package:jadwalnya/components/text_input_field.dart';

import '../constants.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          AuthHeader(size: size, theme: theme, title: 'Login', subtitle: 'Masukkan Email dan password',),
          Container(
              padding: EdgeInsets.symmetric(horizontal: jDefaultPadding),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextInputField(
                      inputAction: TextInputAction.next,
                      controller: email,
                      isPassword: false,
                      theme: theme,
                      hintText: 'Email Address',
                      prefixIcon: Icon(Icons.email,)),
                  Divider(
                    color: Colors.transparent,
                    height: jDefaultPadding,
                  ),
                  TextInputField(
                    inputAction: TextInputAction.done,
                    controller: pass,
                    isPassword: true,
                    theme: theme,
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    onChanged: (text) {
                      print(text);
                    },
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: jDefaultPadding,
                  ),
                  FlexingButton(
                    icon: Icon(Icons.login, color: Colors.white),
                    child: Text('Login', style: TextStyle(color: Colors.white),),
                    onTap: () {
                      //todo: Process the login stuff
                      Navigator.pushReplacementNamed(context, '/main');
                    },
                    color: theme.primaryColor,
                  )
                ],
              ))
        ]),
      ),
    );
  }

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    super.dispose();
  }
}
