import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shehop_flowers/core/app_theme.dart';
import 'package:shehop_flowers/features/Categories/presintation/pages/Categories_Page.dart';
import 'package:shehop_flowers/features/Prodects/presintation/pages/ProdectPage.dart';

import 'core/util/Firebase_Messaging_Controller.dart';
import 'features/Categories/Controller/CategoriesController.dart';

import 'features/Onboarding/Splach_screen.dart';
import 'features/Orders/Controller/OrderController.dart';
import 'features/Orders/data/model/OrderMode.dart';
import 'features/ProdectDetails/Controller/ProdectDetailsController.dart';
import 'features/Prodects/Controller/ProdectController.dart';
import 'features/onboarding/introduction_screen.dart';
import 'firebase_options.dart';
bool show = true;
final loginController =     Get.put(ProdectDetailsController());
final orderController =     Get.put(OrderController());
final CategriesController = Get.put(CategoriesController());
final prodectController = Get.put(ProdectController());
final firebase_Messaging_Controller = Get.put(Firebase_Messaging_Controller());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ?? true ;
  await GetStorage.init();
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: AppTheme.primarySwatch,
      ),
        home:  Splach_screen(),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  // var  userref = FirebaseFirestore.instance
  //       .collection("NEWS")
  //       .orderBy("entery_date", descending: true);
  //
  // print("----------------------------------&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
  // print(userref);
  //   print("----------------------------------&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
   // masingController.initNotifications();

    //send();
  }

  send()async{
    String? dd= await firebase_Messaging_Controller.initNotifications();
    orderController.send_Order(OrderModel(Date_Order: DateTime.now(), nameCategres: 'nameCategres', typeOrder: '1', count_order: '3', id: '25', name: 'adddd', imgurl: 'dasdasdas', note: 'dsadasdas', Order_Status: 'dsankdnksa', OrderN: '23232323', phoneNumber: '776661971', token: dd));

  }
}

