import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
class MessagingWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}
class StateMessagingWidget extends State<MessagingWidget>{
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  @override
  void initState() {
      _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async{
          print("onMessage: $message");
          final notification = message['notification'];
          setState(() {

          });
        },
        onLaunch: (Map<String, dynamic> message) async{

        },
        onResume: (Map<String, dynamic> message) async{

        },
      );
      _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true,badge: true,alert: true)
      );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}