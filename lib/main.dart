import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shehop_flowers/core/app_theme.dart';
import 'package:shehop_flowers/features/Categories/presintation/pages/Categories_Page.dart';
import 'package:shehop_flowers/features/Prodects/presintation/pages/ProdectPage.dart';

import 'features/Categories/Controller/CategoriesController.dart';

import 'features/Orders/Controller/OrderController.dart';
import 'features/ProdectDetails/Controller/ProdectDetailsController.dart';
import 'features/Prodects/Controller/ProdectController.dart';
import 'features/onboarding/introduction_screen.dart';
import 'firebase_options.dart';
bool show = true;
final loginController =     Get.put(ProdectDetailsController());
final orderController =     Get.put(OrderController());
final CategriesController = Get.put(CategoriesController());
final prodectController = Get.put(ProdectController());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ?? true ;
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
      home:  show
           ? IntroScreen()
           :  Categories_Page(),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  var  userref = FirebaseFirestore.instance
        .collection("NEWS")
        .orderBy("entery_date", descending: true);

  print("----------------------------------&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
  print(userref);
    print("----------------------------------&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");

  }
}

