import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebasenotification/message_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class NotificationServices {

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      //not show on the screen
      announcement: true,
      badge: true,
      criticalAlert: true,
      provisional: true,
      carPlay: true,
      sound: true,

    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('user granted permission');
    }
    else if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('user granted provissional permission');
    }
    else {
      print('user denied permission');
    }
  }

  void initLocalNotification(BuildContext  context,RemoteMessage message) async {
    var androidInitializationSettings = AndroidInitializationSettings(
        "@mipmap/ic_launcher");
    var initializationSetting = InitializationSettings(
      android: androidInitializationSettings,
    );
    await flutterLocalNotificationsPlugin.initialize(
initializationSetting,
      onDidReceiveNotificationResponse: (payload){
handleMessage(context,message);
      }
    );
  }

  void firebaseInit(BuildContext context){
    FirebaseMessaging.onMessage.listen((message){
      if (kDebugMode) {
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
        print(message.data['type']);
        print(message.data['id']);

      }
      if(Platform.isAndroid){
        initLocalNotification(context,message);
        showNotification(message);

      }
else{
        showNotification(message);

      }

    });
  }


  Future<void>showNotification(RemoteMessage message)async
  {
    AndroidNotificationChannel channel=AndroidNotificationChannel(
        Random.secure().nextInt(100000).toString(),
        'High Importance Notifications',
        importance: Importance.max,
    );
    AndroidNotificationDetails androidNotificationDetails=AndroidNotificationDetails(
        channel.id.toString(),
        channel.name.toString(),
      channelDescription: 'your channel description',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',

    );
    NotificationDetails notificationDetails=NotificationDetails(
      android: androidNotificationDetails,
    );
Future.delayed(Duration.zero,()
{
  flutterLocalNotificationsPlugin.show(
      0,
      message.notification!.title.toString(),
      message.notification!.body.toString(),
      notificationDetails
  );
});
  }


  Future<String> getDeviceToken()async
  {
   String? token= await  messaging.getToken();
    return token!;

  }

  void isTokenRefresh()
  {
    messaging.onTokenRefresh.listen((event){
      event.toString();
    });

  }

Future<void>setupInteractMessage(BuildContext context)async{

    ///when app is terminated
RemoteMessage? initialMesssage=await FirebaseMessaging.instance.getInitialMessage();
if(initialMesssage!=null){
  handleMessage(context, initialMesssage);
}

  ///when app is background
  FirebaseMessaging.onMessageOpenedApp.listen((event){
    handleMessage(context, event);
  });

}

  Future<void> handleMessage(BuildContext context, RemoteMessage message)async{
if(message.data['type']=='would you like to accept or reject'){
  Navigator.push(context, MaterialPageRoute(builder: (context)
  => MessageScreen(type: message.data['type'],),));
}
  }
}