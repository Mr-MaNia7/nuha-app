import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 6), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        Image.asset(
          'assets/splash.jpeg',
          height: 400,
          width: 400,
          fit: BoxFit.fitWidth,
        ),
        Text("Help on the road, just a call away!"),
      ],
    ))
        // Image.asset(
        //   'assets/splash.jpeg',
        //   height: 400,
        //   width: 400,
        //   fit: BoxFit.fitWidth,
        // ),
        );
  }
}
