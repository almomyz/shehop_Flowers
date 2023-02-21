import 'package:flutter/material.dart';

class AppTheme {


  ///colors
  static const Color primaryColor = Color(0xFFC74364);
  
  static MaterialColor primarySwatch = MaterialColor(Color(0xFFC74364).value, {
    50 : const Color(0xFFC74364).withOpacity(.05),
    100: const Color(0xFFC74364).withOpacity(.1),
    200: const Color(0xFFC74364).withOpacity(.2),
    300: const Color(0xFFC74364).withOpacity(.3),
    400: const Color(0xFFC74364).withOpacity(.4),
    500: const Color(0xFFC74364).withOpacity(.5),
    600: const Color(0xFFC74364).withOpacity(.6),
    700: const Color(0xFFC74364).withOpacity(.7),
    800: const Color(0xFFC74364).withOpacity(.8),
    900: const Color(0xFFC74364).withOpacity(.9)
  });

  static const Color secondaryColor = Color(0xFFD6822C);
  static MaterialColor secondarySwitch = MaterialColor(Color(0xFFD6822C).value, {
    50 : const Color(0xFFD6822C).withOpacity(.05),
    100: const Color(0xFFD6822C).withOpacity(.1),
    200: const Color(0xFFD6822C).withOpacity(.2),
    300: const Color(0xFFD6822C).withOpacity(.3),
    400: const Color(0xFFD6822C).withOpacity(.4),
    500: const Color(0xFFD6822C).withOpacity(.5),
    600: const Color(0xFFD6822C).withOpacity(.6),
    700: const Color(0xFFD6822C).withOpacity(.7),
    800: const Color(0xFFD6822C).withOpacity(.8)!,
    900: const Color(0xFFD6822C).withOpacity(.9)
  });


  static Color scaffoldBackgroundColor = Color(0xFFD6822C);
  static Color scaffoldBackgroundColor2 = Color(0xffF6F9FF);


  static String fontFamily = 'Expo_Arabic_Book.ttf';

  static TextTheme textTheme = TextTheme(
    headline1: TextStyle(fontSize: 32.0, fontFamily: fontFamily, color: secondaryColor,fontWeight: FontWeight.bold),
    headline2: TextStyle(fontSize: 30.0, fontFamily: fontFamily,color: Colors.white ),
    headline3: TextStyle(fontSize: 18.0, fontFamily: fontFamily,color: Colors.black ),
    headline4: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0, fontFamily: fontFamily, color: secondaryColor),
    headline5: TextStyle(fontSize: 15.0, fontFamily: fontFamily, color: Colors.black),
    headline6: TextStyle(fontSize: 24.0, fontFamily: fontFamily, color: secondaryColor),
    bodyText1: TextStyle(fontSize: 20.0, fontFamily: fontFamily, color: secondaryColor,fontWeight: FontWeight.bold),
    bodyText2: TextStyle(fontSize: 15.0, fontFamily: fontFamily, color:secondaryColor.withOpacity(.6)),  );
}
