import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shehop_flowers/core/app_theme.dart';

class DoneWidget extends StatefulWidget {
  const DoneWidget({Key? key}) : super(key: key);

  @override
  State<DoneWidget> createState() => _DoneWidgetState();
}

class _DoneWidgetState extends State<DoneWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset('assets/json/done.json'),
        Text('تم ارسال طلبك بنجاح',style: TextStyle(color: AppTheme.secondaryColor,fontWeight: FontWeight.bold),)
      ],
    );
  }
}
