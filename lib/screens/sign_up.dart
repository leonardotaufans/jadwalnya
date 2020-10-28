import 'package:flutter/material.dart';
import 'package:jadwalnya/components/auth_header.dart';
import 'package:jadwalnya/components/custom_button_fullsize.dart';
import 'package:jadwalnya/components/text_input_field.dart';
import 'package:jadwalnya/constants.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final nama = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    nama.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var _nama;
    var _email;
    var _pass;

    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              AuthHeader(
                size: size,
                theme: theme,
                title: 'Sign up',
                subtitle: 'Registrasi informasi kamu',
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: jDefaultPadding),
                alignment: Alignment.topLeft,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextInputField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Name can\'t be empty';
                            }
                          },
                          inputAction: TextInputAction.next,
                          isPassword: false,
                          theme: theme,
                          hintText: 'Nama Lengkap',
                          prefixIcon: Icon(Icons.person),
                          onChanged: (text) {
                            _nama = text;
                          },
                          controller: nama),
                      TextInputField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Email can\'t be empty';
                            } else if (!value.toString().contains("@")) {
                              return 'Email tidak valid';
                            }
                          },
                          inputAction: TextInputAction.next,
                          isPassword: false,
                          theme: theme,
                          onChanged: (text) {
                            _email = text;
                          },
                          hintText: 'Alamat Email',
                          prefixIcon: Icon(Icons.email),
                          controller: email),
                      TextInputField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Password can\'t be empty';
                            } else if (value.toString().length < 8) {
                              return 'Password too simple';
                            }
                            return null;
                          },
                          isPassword: true,
                          theme: theme,
                          hintText: 'Kata Sandi',
                          prefixIcon: Icon(Icons.lock),
                          controller: password),
                      Divider(
                        color: Colors.transparent,
                        height: jDefaultPadding,
                      ),
                      Text('By registering, you agreed with our'),
                      TextButton(
                        child: Text(
                          'Terms of Agreement',
                          style: TextStyle(color: theme.hintColor),
                        ),
                        onPressed: () {},
                      ),
                      FlexingButton(
                        icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                        child: Text('Sign Up', style: TextStyle(color: Colors.white),),
                        color: theme.primaryColor,
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            print(email.text);
                            //todo: Sign up
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text(
                                    'You are now signed up as ' + email.text)));
                          }
                          Navigator.popUntil(context, ModalRoute.withName('/'));
                          Navigator.pushNamed(context, '/main');
                        },
                      )
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.symmetric(
                    horizontal: jDefaultPadding, vertical: jDefaultPadding * 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Atau gunakan'),
                    Divider(color: Colors.transparent, height: jDefaultPadding,),
                    Row(
                      children: [
                        CircleButton(),
                      ]
                    )
                    //todo: Change with an actual image
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(36)),
      elevation: 5,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        hoverColor: Colors.transparent,
        splashColor: Colors.red,
        onTap: () {},
        child: Ink(
            child: Container(
              height: 70,
              width: 70,
              alignment: Alignment.center,
              child: Text(
                'G+',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            )),
      ),
    );
  }
}
