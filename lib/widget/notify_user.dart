import 'package:flutter/material.dart';
import 'package:helloworld/widget/local_notice_service.dart';

class NotifyUser extends StatelessWidget {
  const NotifyUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              LocalNoticeService().addNotification(
                'Notification Title',
                'Notification Body',
                DateTime.now().millisecondsSinceEpoch + 1000,
                channel: 'testing',
              );
            },
            child: const Text('Click here to test notification'),
          ),
        ],
      ),
    );
  }
}
