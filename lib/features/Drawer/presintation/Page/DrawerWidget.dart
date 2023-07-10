import 'package:flutter/material.dart';
import 'package:shehop_flowers/features/Categories/presintation/pages/Categories_Page.dart';
import 'package:shehop_flowers/features/Favorite/presintation/pages/FavoritePage.dart';
import 'package:shehop_flowers/features/PointsOfSale/Pages/PointsOfSale.dart';

import '../../../../core/app_theme.dart';
import '../../../../core/util/ScreenUtil.dart';
import '../../../../core/widgets/CustomPageRoute.dart';
import '../../../Orders/presintation/Pages/OrdersPage.dart';
import '../../../Prodects/presintation/pages/ProdectPage.dart';
import '../../../SpacialRequest/presintation/Pages/SpacialRequestPage.dart';
import '../Widget/DrawerItem.dart';

class DrawerWidget extends StatelessWidget {
  var scaffolKey;
   DrawerWidget({Key? key,required this.scaffolKey}) : super(key: key);
  ScreenUtil screenUtil =ScreenUtil();

  @override
  Widget build(BuildContext context) {
    screenUtil.init(context);
    return  SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(


          height:double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(20) )),
          child: Drawer(
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
            ),
            child: Column(children: [
              Stack(
                children:[
                  Container(
                    height: screenUtil.screenHeight *.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppTheme.primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24))),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0,right: 20),
                        child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: AppTheme.primaryColor),
                            width: 100,
                            height: 100,
                            child: Card(
                              shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    "assets/images/wp3338438.jpg",
                                    fit: BoxFit.cover,
                                  )),
                            )),
                      ),
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 60,right: 130),
                    child: Text("شلهوب للتحف والهدايا",style: TextStyle(fontFamily: AppTheme.fontFamily,fontSize: 17,color: AppTheme.secondaryColor),),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 90,right: 125),
                    child: Text("Shalhop@gmail.com",style: TextStyle(color: AppTheme.secondaryColor,fontSize: 17,fontWeight: FontWeight.bold
                    )),
                  ),


                  Padding(
                    padding:  EdgeInsets.only(right: 300),
                    child: IconButton(onPressed: (){
                      scaffolKey.currentState!.closeDrawer();
                    }, icon: Icon(Icons.clear,color: Colors.white,)),
                  )
                ],
              ),
              SizedBox(height: 10,),
             Divider(color: AppTheme.primaryColor),
              DrawerItem(icon: Icon(Icons.home),text: "القائمه الرئسيه",ontap: (){
                Navigator.push(
                    context,
                    CustomPageRoute(
                        child: Categories_Page(

                        )));
              }),
              DrawerItem(icon: Icon(Icons.favorite),text: "المفضلة",ontap: (){
                Navigator.push(
                    context,
                    CustomPageRoute(
                        child: FavoritePage(
                        )));
              }),
              DrawerItem(icon: Icon(Icons.store_sharp),text: "نقاط البيع",ontap: (){
                Navigator.push(
                    context,
                    CustomPageRoute(
                        child: PointsOfSale(

                        )));
              }),
              DrawerItem(icon: Icon(Icons.request_page_outlined),text: "طلبات خاصة",ontap: (){
                Navigator.push(
                    context,
                    CustomPageRoute(
                        child: SpacialRequestPage(
                        )));
              }),
              DrawerItem(icon: Icon(Icons.checklist_outlined),text: "قائمة الطلبات",ontap: (){
                Navigator.push(
                    context,
                    CustomPageRoute(
                        child: OredrsPage()));
              }),
              DrawerItem(icon: Icon(Icons.info_outline_sharp),text: "من نحن ",ontap: (){

              }),
              DrawerItem(icon: Icon(Icons.share),text: "مشاركة التطبيق",ontap: (){

              }),
              Divider(color: AppTheme.primaryColor,),
                Center(child: Text('Developed by Almomyz ',style: TextStyle(fontFamily: AppTheme.fontFamily,color: Colors.black),))

            ]),
          ),
        ),
      ),
    );
  }
}
