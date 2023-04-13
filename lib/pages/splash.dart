import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:location_permissions/location_permissions.dart';
// import 'package:permission_handler/permission_handler.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/home');
      // Future<bool> check = checkPermissions();
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
        const Text("Help on the road, just a call away!"),
      ],
    )));
  }
}

// Future<bool> checkPermissions() async {
//   var status = await Permission.location.status;
//   if (status.isDenied || status.isRestricted) {
//     var requestStatus = await Permission.location.request();
//     if (await Permission.location.request().isGranted) {
//       return true;
//     } else {
//       return false;
//     }
//   } else {
//     return true;
//   }
//   if (await Permission.location.isPermanentlyDenied) {
//     openAppSettings();
//   }
// }
