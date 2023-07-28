import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shehop_flowers/core/app_theme.dart';


import '../../../../main.dart';
import '../../core/util/ScreenUtil.dart';
import '../Categories/presintation/pages/Categories_Page.dart';
import 'introduction_screen.dart';

  class Splach_screen extends StatefulWidget {
  @override
  _Splach_screenState createState() => _Splach_screenState();
}

class _Splach_screenState extends State<Splach_screen>
    with TickerProviderStateMixin {
  double _fontSize = 2;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;
  ScreenUtil screenUtil = ScreenUtil();

  AnimationController? _controller;
  Animation<double>? animation1;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10));

    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller!, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller!.forward();

    Timer(Duration(seconds: 2), () {
      setState(() {
        _fontSize = 1.4;
      });
    });

    Timer(Duration(seconds: 2), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(Duration(seconds: 4), () {
      setState(() {
        Navigator.pushReplacement(
            context,
            PageTransition(show
                ? IntroScreen()
                :  Categories_Page(),

            ));
      });
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenUtil.init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 3000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: screenUtil.screenHeight *.8 / _fontSize,
                ),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 3000),
                  opacity: _textOpacity,
                  child: Text(
                    '  شلهوب فلاورد',
                    style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontFamily: AppTheme.fontFamily,
                      fontSize: animation1!.value,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 3000),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _containerOpacity,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.fastLinearToSlowEaseIn,
                height: screenUtil.screenHeight*.6,
                width: screenUtil.screenWidth *.6,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.white),
                  color: Colors.white.withOpacity(.7),
                  borderRadius: BorderRadius.circular(100),
                ),
                // child: Image.asset('assets/images/file_name.png')
                child: CircleAvatar(
                    radius: 50, child: Image.asset('assets/images/logo.jpg')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: Duration(milliseconds: 3000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: animation,
                child: page,
                axisAlignment: 0,
              ),
            );
          },
        );
}
