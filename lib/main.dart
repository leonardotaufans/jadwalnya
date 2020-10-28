import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:jadwalnya/constants.dart';
import 'package:jadwalnya/screens/login_welcome.dart';
import 'package:jadwalnya/screens/sign_in.dart';
import 'package:jadwalnya/screens/sign_up.dart';
import 'dart:async';
import 'screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        SchedulerBinding.instance.window.platformBrightness == Brightness.dark;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: darkTheme,
      theme: isDarkMode ? darkTheme : lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/main': (context) => MainScreen(),
        '/welcome': (context) => LoginScreen(),
        '/welcome/login': (context) => Login(),
        '/welcome/signup': (context) => SignUp(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initiateSplash();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(Icons.image, size: 150,),
      ),
    );
  }

  initiateSplash() async {
    var login = false; //todo: Check if user is logged in or a first time user
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      if (login) {
        Navigator.pushReplacementNamed(context, '/main');
      } else {
        Navigator.pushReplacementNamed(context, '/welcome');
      }
    });
  }
}
