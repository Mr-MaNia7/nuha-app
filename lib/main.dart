import 'package:flutter/material.dart';
import 'package:helloworld/nuha_main_app.dart';
import 'package:helloworld/widget/local_notice_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNoticeService().setup(); // asks notification permission for iOS
  runApp(const NuhaMainApp());
}
