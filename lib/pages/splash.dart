import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:helloworld/main.dart';

class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: const HomePage(title: 'Nuha Roadside Assistance'),
      image: Image.asset(
        'assets/splash.jpeg',
        height: 400,
        width: 400,
        fit: BoxFit.fitWidth,
      ),
      loadingText: Text("Help on the road, just a call away!"),
      photoSize: 200.0,
    );
  }
}
