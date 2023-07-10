import 'package:flutter/material.dart';
import 'package:shehop_flowers/core/util/ScreenUtil.dart';

import '../../features/ProdectDetails/presintation/Widgets/OtpInpouts.dart';
import '../app_theme.dart';
ScreenUtil screenUtil=ScreenUtil();


// OtpAuth(context){
//                         showModalBottomSheet(context: context, builder: (context) {
//                           return
//                             Container(
//                               height: 800,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                 Text("ادخل رمز التحقق", style: AppTheme.textTheme.bodyText1),
//                                 Text("...قم بإدخال الرمز المكون من ستة ارقام هنا ", style: AppTheme.textTheme.headline5),
//
//                                   Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly
//                                   ,children: [
//
//                                       otpInpouts(context),
//                                       otpInpouts(context),
//                                       otpInpouts(context),
//                                       otpInpouts(context),
//                                       otpInpouts(context),
//                                       otpInpouts(context),
//
//                                   ],),
//                                   Container(
//                                     padding: EdgeInsets.all(20),
//                                     child: SizedBox(
//                                         width: double.infinity,
//                                         child: ElevatedButton(
//                                             style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(AppTheme.primaryColor),padding:MaterialStateProperty.all(EdgeInsets.all(10)) ,shape: MaterialStateProperty.all<
//                                                 RoundedRectangleBorder>(
//                                               RoundedRectangleBorder(
//                                                 borderRadius:
//                                                 BorderRadius.all(Radius.circular(7)),
//                                               ),
//                                             ),),
//                                             onPressed: () {
//
//                                             },
//                                             child: Text("تحقق"))),
//                                   )
//                                 ],
//                               ),
//                             );
//
//
//
//
//
//                         },);
//
// }
