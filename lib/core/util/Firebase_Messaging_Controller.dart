
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../features/Orders/presintation/Pages/OrdersPage.dart';
import '../widgets/CustomPageRoute.dart';

class Firebase_Messaging_Controller extends GetxController{
  final firebaseMessaging =FirebaseMessaging.instance;
Future<void> hendelBackgroundMessage(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');

}


  Future<String?> initNotifications() async {
    await firebaseMessaging.requestPermission();
     final token= await firebaseMessaging.getToken();
        print(token);
        FirebaseMessaging.onBackgroundMessage(hendelBackgroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage event) {
      Get.to(OredrsPage());
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      Get.to(OredrsPage());
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage event) {
      Get.to(OredrsPage());
    });
   return token;
  }

}