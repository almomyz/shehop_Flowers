
import 'package:flutter/material.dart';

import '../../../../core/app_theme.dart';

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

  @override
  Widget build(BuildContext context) {
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
                      width: 80,
                      height: 80,
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
                style: AppTheme.textTheme.bodyText2,

              )
            ],
          ),
        )



        : GestureDetector(
      onTap: (){
        onTap();
      },
          child: Padding(
            padding:  EdgeInsets.only(right: 20.0, left: 20.0),
            child: Column(
              children: [
                Container(

                    width: 71,
                    height: 71,
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
          ),
        );
  }
}
