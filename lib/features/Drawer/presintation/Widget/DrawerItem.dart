import 'package:flutter/material.dart';
import 'package:shehop_flowers/core/app_theme.dart';

class DrawerItem extends StatelessWidget {
  Icon icon;
  String text;
  Function ontap;
   DrawerItem({Key? key,required this.ontap,required this.icon,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        ontap();
      },
      child: Padding(
        padding:  EdgeInsets.only(top: 15.0,right: 30,bottom: 15,left: 15),
        child: Row(
         children: [
         Container(height: 50,width: 50,decoration:  BoxDecoration(
             color: AppTheme.primarySwatch.shade400,
                 borderRadius: BorderRadius.all(Radius.circular(10))
        ),child: Icon(icon.icon,color: Colors.white,),),
         Padding(
           padding: const EdgeInsets.only(right: 16,top: 12),
           child: Text("$text",style:AppTheme.textTheme.bodyText1,),
         ),

        ],),
      ),
    );
  }
}
