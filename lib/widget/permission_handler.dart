import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerScreen extends StatefulWidget {
  @override
  _PermissionHandlerScreenState createState() =>
      _PermissionHandlerScreenState();
}

class _PermissionHandlerScreenState extends State<PermissionHandlerScreen> {
  @override
  void initState() {
    super.initState();
    permissionServiceCall();
  }

  permissionServiceCall() async {
    await permissionServices().then(
      (value) {
        if (value != null) {
          if (value[Permission.location]!.isGranted &&
              value[Permission.microphone]!.isGranted) {
            Navigator.pushReplacementNamed(context, '/home');
          }
        }
      },
    );
  }

  /*Permission services*/
  Future<Map<Permission, PermissionStatus>> permissionServices() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.microphone,
      // Permission.notification,
    ].request();

    if (statuses[Permission.location]!.isPermanentlyDenied) {
      await openAppSettings().then(
        (value) async {
          if (value) {
            if (await Permission.location.status.isPermanentlyDenied == true &&
                await Permission.location.status.isGranted == false) {
              openAppSettings();
            }
          }
        },
      );
    } else {
      if (statuses[Permission.location]!.isDenied) {
        permissionServiceCall();
      }
      // if (await Permission.locationWhenInUse.serviceStatus.isDisabled){

      // }
    }
    // if (statuses[Permission.notification]!.isPermanentlyDenied) {
    //   await openAppSettings().then(
    //     (value) async {
    //       if (value) {
    //         if (await Permission.notification.status.isPermanentlyDenied ==
    //                 true &&
    //             await Permission.notification.status.isGranted == false) {
    //           openAppSettings();
    //         }
    //       }
    //     },
    //   );
    // } else {
    //   if (statuses[Permission.notification]!.isDenied) {
    //     permissionServiceCall();
    //   }
    // }

    if (statuses[Permission.microphone]!.isPermanentlyDenied) {
      await openAppSettings().then(
        (value) async {
          if (value) {
            if (await Permission.microphone.status.isPermanentlyDenied ==
                    true &&
                await Permission.microphone.status.isGranted == false) {
              openAppSettings();
            }
          }
        },
      );
    } else {
      if (statuses[Permission.microphone]!.isDenied) {
        permissionServiceCall();
      }
    }
    return statuses;
  }

  @override
  Widget build(BuildContext context) {
    permissionServiceCall();
    return Scaffold(
      body: Container(
        child: Center(
          child: InkWell(
              onTap: () {
                permissionServiceCall();
              },
              child: const Text(
                "Click here to manually enable necessary permissions for the app to work",
                style: TextStyle(fontSize: 20, color: Colors.orange),
                textAlign: TextAlign.center,
              )),
        ),
      ),
    );
  }
}
