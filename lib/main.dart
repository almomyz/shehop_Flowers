import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shehop_flowers/core/app_theme.dart';
import 'package:shehop_flowers/features/Categories/presintation/pages/Categories_Page.dart';
import 'package:shehop_flowers/features/Prodects/presintation/pages/ProdectPage.dart';

import 'features/ProdectDetails/Pages/DetailsPage.dart';
import 'features/ProdectDetails/Widgets/LoginController.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
  final loginController = Get.put(LoginController());

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
      home: Categories_Page()
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

