import 'package:flutter/material.dart';
import 'package:helloworld/common_webview.dart';
import 'package:helloworld/pages/splash.dart';
import 'package:helloworld/permission/handle_permissions.dart';

void main() {
  runApp(const NuhaApp());
}

class NuhaApp extends StatelessWidget {
  const NuhaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/permission',
      routes: {
        '/splash': (context) => SplashPage(),
        '/home': (context) => const HomePage(title: 'Nuha Roadside Assistance'),
        '/permission': (context) => Permissions(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Image.asset(
          'assets/icon.png',
          fit: BoxFit.contain,
          height: 50,
        ),
      ),
      // body: CommonWebView(url: "https://app.nuharoadsideassistance.com:8999/"),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:location/location.dart';
// import 'package:helloworld/check_permission.dart';
// import 'package:helloworld/permission/handle_permissions.dart';
// import 'package:helloworld/pages/splash.dart';
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Location Permission',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       initialRoute: '/permission',
//       routes: {
//         '/': (context) => requestLocation(),
//         '/splash': (context) => SplashPage(),
//         '/permission': (context) => Permissions(),
//         '/check': (context) => PermissionViewer(),
//       },
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class requestLocation extends StatefulWidget {
//   @override
//   _MyLocationState createState() => _MyLocationState();
// }

// class _MyLocationState extends State<requestLocation> {
//   Location location = new Location();

//   @override
//   void initState() {
//     super.initState();
//     requestLocationPermission();
//   }

//   requestLocationPermission() async {
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;

//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         return;
//       }
//     }

//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Navigator.pushReplacementNamed(context, '/check');
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter Location Permission Demo"),
//       ),
//       body: Container(
//         child: SafeArea(
//           child: Column(
//             children: [
//               if (location.hasPermission() == PermissionStatus.granted)
//                 const Text(
//                   "Access granted",
//                   style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.green),
//                 ),
//               if (location.hasPermission() == PermissionStatus.denied)
//                 const Text(
//                   "Access Denied this time",
//                   style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.red),
//                 ),
//               if (location.hasPermission() == PermissionStatus.deniedForever)
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
