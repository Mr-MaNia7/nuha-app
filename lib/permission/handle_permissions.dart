import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Permissions extends StatefulWidget {
  @override
  _PermissionsState createState() => _PermissionsState();
}

class _PermissionsState extends State<Permissions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Request Permission"),
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: ElevatedButton(
                  child: Text("Request Single Permission"),
                  onPressed: () async {
                    print("Location Permission");
                    if (await Permission.location.request().isGranted) {
                      // Either the permission was already granted before or the user just granted it.
                      Navigator.pushReplacementNamed(context, '/splash');
                      print("Location Permission is granted");
                    } else {
                      print("Location Permission is denied.");
                      Navigator.pushReplacementNamed(context, '/home');
                    }
                  },
                ),
              ),
              // Container(
              //   child: ElevatedButton(
              //     child: Text("Request Multiple Permission"),
              //     onPressed: () async {
              //       // You can request multiple permissions at once.
              //       Map<Permission, PermissionStatus> statuses = await [
              //         Permission.location,
              //         Permission.storage,
              //       ].request();
              //       print(statuses[Permission.location]);
              //       print(statuses[Permission.storage]);

              //       // if (statuses[Permission.location]) {
              //       //   //check each permission status after.
              //       //   print("Location permission is denied.");
              //       // }

              //       // if (statuses[Permission.camera].isDenied) {
              //       //   //check each permission status after.
              //       //   print("Camera permission is denied.");
              //       // }
              //     },
              //   ),
              // ),
              // Container(
              //   child: ElevatedButton(
              //     child: Text("Check Camera Permission"),
              //     onPressed: () async {
              //       //check permission without request popup
              //       var status = await Permission.camera.status;
              //       if (status.isDenied) {
              //         // We didn't ask for permission yet or the permission has been denied before but not permanently.
              //         print("Permission is denined.");
              //       } else if (status.isGranted) {
              //         //permission is already granted.
              //         print("Permission is already granted.");
              //       } else if (status.isPermanentlyDenied) {
              //         //permission is permanently denied.
              //         print("Permission is permanently denied");
              //       } else if (status.isRestricted) {
              //         //permission is OS restricted.
              //         print("Permission is OS restricted.");
              //       }
              //     },
              //   ),
              // )
            ],
          ),
        ));
  }
}
