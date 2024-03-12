import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moneymanagerhive/screens/home/screen_home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
        Duration(seconds: 4),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => ScreenHome())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: SafeArea(
          child: Center(
        child: Text(
          'Money Manager Pro',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic),
        ),
      )),
    );
  }
}
