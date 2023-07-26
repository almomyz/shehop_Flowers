import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shehop_flowers/core/util/ScreenUtil.dart';
import 'package:shehop_flowers/features/Orders/presintation/Pages/DetailsOrderPage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/app_theme.dart';
import '../../../../core/widgets/myCustemAppber.dart';
import '../../../Drawer/presintation/Page/DrawerWidget.dart';
import '../../Controller/PointsOfSaleController.dart';

class PointsOfSale extends StatefulWidget {
  const PointsOfSale({Key? key}) : super(key: key);

  @override
  State<PointsOfSale> createState() => _PointsOfSaleState();
}

class _PointsOfSaleState extends State<PointsOfSale> {
  @override
  GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();
  final pointsOfSaleController = Get.put(PointsOfSaleController());
  ScreenUtil screenUtil =ScreenUtil();
  Widget build(BuildContext context) {
    screenUtil.init(context);
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          key: scaffolKey,
          drawer: DrawerWidget(scaffolKey: scaffolKey),
          body: Column(children: [
            Stack(
              children: [
                myCustemAppber(name: "نقاط البيع",scaffolKey: scaffolKey),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.only(top: screenUtil.screenHeight *.08, left: screenUtil.screenWidth *.1, right: screenUtil.screenWidth *.08),
                    child: TextField(
                      onChanged: (searchWord){
                        pointsOfSaleController.onSearch(searchWord);
                      },
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        suffixIcon: Icon(Icons.search_sharp,
                            size: 30, color: AppTheme.primaryColor),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      cursorColor: AppTheme.primaryColor,
                    ))
              ],
            ),
            SizedBox(height: 20,),
            Expanded(
              child: GetBuilder<PointsOfSaleController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.PointsOfSaleList.length,
                    itemBuilder: (contxt, index) {
                      return Card(
                        margin: EdgeInsets.all(5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(children: [
                          Container(
                              margin: EdgeInsets.all(10),
                              width: screenUtil.screenWidth *.4,
                              height: screenUtil.screenHeight *.2,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    controller.PointsOfSaleList[index].image,
                                    fit: BoxFit.cover,
                                  ))),
                          Column(
                              children: [
                                Text(controller.PointsOfSaleList[index].name,
                                    style: AppTheme.textTheme.headline4),
                                SizedBox(height: 10,),
                                Text(controller.PointsOfSaleList[index].address,style: TextStyle(fontFamily: AppTheme.fontFamily,color: AppTheme.primaryColor,fontWeight: FontWeight.bold)),
                                SizedBox(height: 10,),

                                Text(controller.PointsOfSaleList[index].phoneNumber,textDirection: TextDirection.ltr,style: TextStyle(fontFamily: AppTheme.fontFamily,color: AppTheme.primaryColor,fontWeight: FontWeight.bold)),
                                SizedBox(height: 10,),

                                Center(child: CircleAvatar(child: IconButton(icon: Icon(Icons.call),onPressed: (){
                                  launch("tel:${controller.PointsOfSaleList[index].phoneNumber}");

                                })),)
                              ]),
                        ]),
                      );
                    },
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
