import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shehop_flowers/core/app_theme.dart';

import '../../core/util/ScreenUtil.dart';
import '../../core/widgets/CustomPageRoute.dart';
import '../Categories/presintation/pages/Categories_Page.dart';


class IntroScreen extends StatelessWidget {
  IntroScreen({ Key? key}) : super(key: key);
  ScreenUtil screenUtil =ScreenUtil();
  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'مرحبا بك ',
      body: 'كل ماتحتاجه من هدايا موجود',
      image: Center(
        child: Lottie.asset("assets/json/Rose.json",width: 250,),
      ),
      decoration:  PageDecoration(
        bodyTextStyle: TextStyle(color: AppTheme.secondaryColor,fontFamily: AppTheme.fontFamily,fontSize: 15),
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          color: AppTheme.primaryColor,
          fontFamily: AppTheme.fontFamily,
          fontWeight: FontWeight.bold,
        )
      )
    ),
    PageViewModel(
        title: 'جميع انواع الهدايا ',
        body: '  هدايا زواج - هدايا العائله - هدايا اعياد الميلاد - وجميع انواع المناسبات  ',

        image: Center(
          child: Lottie.asset("assets/json/boxes.json",width: 250,),
        ),
        decoration:  PageDecoration(
            bodyTextStyle: TextStyle(color: AppTheme.secondaryColor,fontFamily: AppTheme.fontFamily,fontSize: 15),
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              color: AppTheme.primaryColor,
              fontFamily: AppTheme.fontFamily,
              fontWeight: FontWeight.bold,
            )
        )
    ),
    PageViewModel(
        title: 'انت عليك المناسبه',
        body: 'واحنا علينا الهدية',
        image: Center(
          child: Lottie.asset("assets/json/1.json",width: 250,),
        ),
        decoration:  PageDecoration(
            bodyTextStyle: TextStyle(color: AppTheme.secondaryColor,fontFamily: AppTheme.fontFamily,fontSize: 15),
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              color: AppTheme.primaryColor,
              fontFamily: AppTheme.fontFamily,
              fontWeight: FontWeight.bold,
            )
        )
    ),
  ];

  @override
  Widget build(BuildContext context) {
    screenUtil.init(context);
    return Scaffold(

      body: Center(
        child: Padding(
          padding:  EdgeInsets.only(top: screenUtil.screenHeight *.2),
          child: IntroductionScreen(
            pages: pages,
            dotsDecorator: const DotsDecorator(
              size: Size(10,10),
              color: Colors.black12,
              activeSize: Size.square(15),
              activeColor:AppTheme.primaryColor,
            ),
            showDoneButton: true,
            done:  Text('ابدأ', style: TextStyle(fontSize: 20,color: AppTheme.primaryColor,fontWeight: FontWeight.bold,fontFamily: AppTheme.fontFamily),),
            showSkipButton: true,
            skip:  Text('تخطي', style: TextStyle(fontSize: 20,color: AppTheme.primaryColor,fontWeight: FontWeight.bold,fontFamily: AppTheme.fontFamily),),
            showNextButton: true,
            next: const Icon(Icons.arrow_forward, size: 30,color: AppTheme.primaryColor),
            onDone: () => onDone(context),
            curve: Curves.bounceOut,
          ),
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
        context,
        CustomPageRoute(  child:  const Categories_Page()));
  }
}

