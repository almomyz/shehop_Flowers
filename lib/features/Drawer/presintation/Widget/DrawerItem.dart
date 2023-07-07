import 'package:flutter/material.dart';
import 'package:shehop_flowers/core/app_theme.dart';

import '../../../../core/util/ScreenUtil.dart';

class DrawerItem extends StatelessWidget {
  Icon icon;
  String text;
  Function ontap;
   DrawerItem({Key? key,required this.ontap,required this.icon,required this.text}) : super(key: key);
  ScreenUtil screenUtil =ScreenUtil();

  @override
  Widget build(BuildContext context) {
    screenUtil.init(context);
    return  InkWell(
      onTap: (){
        ontap();
      },
      child: Padding(
        padding:  EdgeInsets.only(top: 15.0,right: 30,bottom: 15,left: 15),
        child: Row(
         children: [
         Container(height: screenUtil.screenHeight *.06,width: screenUtil.screenWidth *.13,decoration:  BoxDecoration(
             color: AppTheme.primarySwatch.shade400,
                 borderRadius: BorderRadius.all(Radius.circular(10))
        ),child: Icon(icon.icon,color: Colors.white,),),
         SizedBox(width: 20,),
         Text("$text",style:AppTheme.textTheme.bodyText1,),

        ],),
      ),
    );
  }
}
