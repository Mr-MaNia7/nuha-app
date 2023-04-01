import 'package:flutter/material.dart';
import 'package:helloworld/common_webview.dart';
import 'package:helloworld/pages/splash.dart';

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
      // home: MySplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(),
        '/home': (context) => const HomePage(title: 'Nuha Roadside Assistance'),
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
      body: CommonWebView(
          title: 'Flutter',
          url: "https://app.nuharoadsideassistance.com:8999/"),
    );
  }
}
