// import 'package:flutter/material.dart';
// import 'package:location/location.dart';

// class PermissionViewer extends StatefulWidget {
//   @override
//   _PermissionViewerState createState() => _PermissionViewerState();
// }

// class _PermissionViewerState extends State<PermissionViewer> {
//   // Location location = new Location();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Permission Viewer"),
//       ),
//       body: Container(
//         child: SafeArea(
//           child: Column(
//             children: [
//               if (Location().hasPermission() == PermissionStatus.granted)
//                 const Text(
//                   "Access granted",
//                   style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.green),
//                 ),
//               if (Location().hasPermission() == PermissionStatus.denied)
//                 const Text(
//                   "Access Denied this time",
//                   style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.red),
//                 ),
//               if (Location().hasPermission() == PermissionStatus.deniedForever)
//                 const Text(
//                   "Access Denied forever",
//                   style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.red),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
