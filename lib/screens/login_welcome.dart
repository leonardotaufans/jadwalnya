import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jadwalnya/components/auth_header.dart';
import 'package:jadwalnya/components/custom_button_fullsize.dart';
import 'package:jadwalnya/components/text_input_field.dart';
import 'package:jadwalnya/constants.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: jDefaultPadding),
        height: size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(

                  padding: EdgeInsets.only(bottom: size.height * 0.2),
                  child: Text(
                    'Jadwalnya',
                    style: theme.textTheme.headline3
                        .copyWith(color: theme.accentColor),
                  )),
              FlexingButton(
                  icon: Icon(Icons.login, color: Colors.white),
                  splashColor: Colors.white,
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: theme.primaryColor,
                  onTap: () {
                    Navigator.pushNamed(context, '/welcome/login');
                  }),
              Divider(
                color: Colors.transparent,
                height: jDefaultPadding,
              ),
              FlexingButton(
                icon: Icon(Icons.add),
                child: Text('Sign up'),
                splashColor: theme.primaryColor,
                color: theme.cardColor,
                onTap: () {
                  Navigator.pushNamed(context, '/welcome/signup');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

