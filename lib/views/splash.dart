import 'package:c4c/views/home.dart';
import 'package:c4c/views/login.dart';
import 'package:c4c/views/map.page.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplash extends StatefulWidget {
  @override
  _MySplash createState() => _MySplash();
}

class _MySplash extends State<MySplash> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(
        seconds: 2,
        navigateAfterSeconds: MyLoginPage(),
        imageBackground: AssetImage('images/splash.png'),
      ),
    );
  }
}
