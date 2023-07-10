
import 'package:flutter/material.dart';

import '../../../../core/app_theme.dart';
import '../../../../core/util/ScreenUtil.dart';

class HomeCategoriesWidget extends StatelessWidget {
  String name, image;
  Function onTap;
  bool isSelected;

  HomeCategoriesWidget({
    required this.name,
    required this.image,
    required this.onTap,
    required this.isSelected,
  });
  ScreenUtil screenUtil =ScreenUtil();

  @override
  Widget build(BuildContext context) {
    screenUtil.init(context);
    return isSelected
        ? GestureDetector(
      onTap: (){
        onTap();
      },
          child:  Column(
            children: [
              Container(

                decoration: BoxDecoration(color: AppTheme.primaryColor,borderRadius: BorderRadius.circular(15),),
                child: Card(
                  shape:  BeveledRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                      width: screenUtil.screenWidth * .18,
                      height: screenUtil.screenHeight *.09,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            image,
                            fit: BoxFit.cover,
                          ))),
                ),
              ),
              Text(
                name,
                style: AppTheme.textTheme.bodyText1,


              )
            ],
          ),
        )



        : GestureDetector(
      onTap: (){
        onTap();
      },
          child: Column(
            children: [
              Container(

                  width: screenUtil.screenWidth *.2,
                  height: screenUtil.screenHeight *.1,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ))),
              Text(
                name,
                style: AppTheme.textTheme.headline5,
              )
            ],
          ),
        );
  }
}
