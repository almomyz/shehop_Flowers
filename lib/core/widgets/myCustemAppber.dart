import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shehop_flowers/features/Drawer/presintation/Page/DrawerWidget.dart';

import '../app_theme.dart';
import '../util/ScreenUtil.dart';
import '../util/common.dart';

class myCustemAppber extends StatefulWidget {
  String name;
  final scaffolKey;
   myCustemAppber({Key? key,required this.name,required this.scaffolKey}) : super(key: key);

  @override
  State<myCustemAppber> createState() => _myCustemAppberState();
}

class _myCustemAppberState extends State<myCustemAppber> {
  ScreenUtil screenUtil =ScreenUtil();

  @override
  Widget build(BuildContext context) {
    screenUtil.init(context);
    return   Stack(children: [
        Container(
          height: screenUtil.screenHeight *.12,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24))),
        ),

        Padding(
          padding:  EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  print("mdaklnffffffffffffffffffffffff");
                  widget.scaffolKey.currentState?.openDrawer();


                },
                child: SvgPicture.asset("assets/images/menu.svg",
                    color: Colors.white,
                    semanticsLabel: "almomyz",
                    width: 30.53,
                    height: 30.85),
              ),
              Text(
                "${widget.name}",
                style: AppTheme.textTheme.headline2,
              ), //assets/images/meun2.svg
              SvgPicture.asset("assets/images/notification.svg",
                  color: Colors.white,
                  semanticsLabel: "almomyz",
                  width: 30.53,
                  height: 30.85),
            ],
          ),
        ),

      ]);
  }
}
