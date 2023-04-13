import 'package:flutter/material.dart';
import 'package:helloworld/widget/common_webview.dart';
import 'package:helloworld/widget/js_interface.dart';
import 'package:helloworld/widget/splash.dart';
import 'package:helloworld/widget/permission_handler.dart';

class NuhaMainApp extends StatelessWidget {
  const NuhaMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nuha App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/interface',
      routes: {
        '/splash': (context) => SplashPage(),
        '/permission': (context) => PermissionHandlerScreen(),
        '/home': (context) => const HomePage(title: 'Nuha Roadside Assistance'),
        '/interface': (context) => const JavascriptInterface(
            title: 'Native - JS Communication Bridge'),
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
      body: CommonWebView(url: "https://app.nuharoadsideassistance.com:8999/"),
    );
  }
}
