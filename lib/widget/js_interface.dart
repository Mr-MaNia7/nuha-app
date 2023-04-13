import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:helloworld/widget/local_notice_service.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

class JavascriptInterface extends StatefulWidget {
  const JavascriptInterface({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _JavascriptInterfaceState createState() => _JavascriptInterfaceState();
}

class _JavascriptInterfaceState extends State<JavascriptInterface> {
  final GlobalKey<ScaffoldState>? _scaffoldKey = GlobalKey<ScaffoldState>();
  WebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text('Webview')),
      body: WebView(
        initialUrl: 'about:blank',
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: Set.from([
          JavascriptChannel(
              name: 'messageHandler',
              onMessageReceived: (JavascriptMessage message) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(message.message),
                ));
              })
        ]),
        onWebViewCreated: (WebViewController webviewController) {
          _controller = webviewController;
          _loadHtmlFromAssets();
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_upward),
          onPressed: () {
            notifyUser('Notification Title', 'Notification Body',
                DateTime.now().millisecondsSinceEpoch + 1000);
            _controller
                ?.evaluateJavascript('fromFlutter("Message From Flutter")');
          }),
    );
  }

  _loadHtmlFromAssets() async {
    if (_controller != null) {
      String file = await rootBundle.loadString('assets/index.html');
      _controller?.loadUrl(Uri.dataFromString(file,
              mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
          .toString());
    }
  }

  void notifyUser(String title, String body, int endTime) {
    LocalNoticeService().addNotification(title, body, endTime);
  }
}
