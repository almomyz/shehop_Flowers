import 'package:flutter/material.dart';
import 'package:shehop_flowers/features/Categories/presintation/pages/Categories_Page.dart';
import 'package:shehop_flowers/features/Favorite/presintation/pages/FavoritePage.dart';
import 'package:shehop_flowers/features/PointsOfSale/Pages/PointsOfSale.dart';

import '../../../../core/app_theme.dart';
import '../../../../core/widgets/CustomPageRoute.dart';
import '../../../Orders/Pages/OrdersPage.dart';
import '../../../Prodects/presintation/pages/ProdectPage.dart';
import '../../../SpacialRequest/presintation/Pages/SpacialRequestPage.dart';
import '../Widget/DrawerItem.dart';

class DrawerWidget extends StatelessWidget {
  var scaffolKey;
   DrawerWidget({Key? key,required this.scaffolKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: EdgeInsets.only(right: 5,bottom: 20,),
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
                    height: 50,
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
                    child: Text("?????????? ?????????? ????????????????",style: AppTheme.textTheme.bodyText1,),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 90,right: 125),
                    child: Text("Shalhop@gmail.com",style: TextStyle(color: AppTheme.secondaryColor,fontSize: 18)),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: 300),
                    child: IconButton(onPressed: (){
                      print("ksamdma;lsmd;lasmdl;masl;md;lasml;dm;almd;lam;");
                      scaffolKey.currentState!.closeDrawer();
                    }, icon: Icon(Icons.clear,color: Colors.white,)),
                  )
                ],
              ),
              SizedBox(height: 10,),
             Divider(color: AppTheme.primaryColor),
              DrawerItem(icon: Icon(Icons.home),text: "?????????????? ??????????????",ontap: (){
                Navigator.push(
                    context,
                    CustomPageRoute(
                        child: Categories_Page(

                        )));
              }),
              DrawerItem(icon: Icon(Icons.favorite),text: "??????????????",ontap: (){
                Navigator.push(
                    context,
                    CustomPageRoute(
                        child: FavoritePage(
                        )));
              }),
              DrawerItem(icon: Icon(Icons.store_sharp),text: "???????? ??????????",ontap: (){
                Navigator.push(
                    context,
                    CustomPageRoute(
                        child: PointsOfSale(

                        )));
              }),
              DrawerItem(icon: Icon(Icons.request_page_outlined),text: "?????????? ????????",ontap: (){
                Navigator.push(
                    context,
                    CustomPageRoute(
                        child: SpacialRequestPage(
                        )));
              }),
              DrawerItem(icon: Icon(Icons.checklist_outlined),text: "?????????? ??????????????",ontap: (){
                Navigator.push(
                    context,
                    CustomPageRoute(
                        child: OredrsPage()));
              }),
              DrawerItem(icon: Icon(Icons.info_outline_sharp),text: "???? ?????? ",ontap: (){
                Navigator.push(
                    context,
                    CustomPageRoute(
                        child: ProdectPage(
                          nameCategories: "NEWS",
                        )));
              }),
              DrawerItem(icon: Icon(Icons.share),text: "???????????? ??????????????",ontap: (){
                Navigator.push(
                    context,
                    CustomPageRoute(
                        child: ProdectPage(
                          nameCategories: "NEWS",
                        )));
              }),
              Divider(color: AppTheme.primaryColor,)


            ]),
          ),
        ),
      ),
    );
  }
}
