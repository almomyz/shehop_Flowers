import 'package:flutter/material.dart';
import 'package:shehop_flowers/features/Categories/presintation/pages/Categories_Page.dart';
import 'package:shehop_flowers/features/Favorite/presintation/pages/FavoritePage.dart';
import '../../../../core/app_theme.dart';
import '../../../../core/util/ScreenUtil.dart';
import '../../../../core/util/common.dart';
import '../../../../core/widgets/CustomPageRoute.dart';
import '../../../Orders/presintation/Pages/OrdersPage.dart';
import '../../../PointsOfSale/presintation/Pages/PointsOfSale.dart';
import '../../../Prodects/presintation/pages/ProdectPage.dart';
import '../../../SpacialRequest/presintation/Pages/SpacialRequestPage.dart';
import '../Widget/DrawerItem.dart';

class DrawerWidget extends StatefulWidget {
   final scaffolKey;
   DrawerWidget({Key? key,required this.scaffolKey}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  ScreenUtil screenUtil =ScreenUtil();

  @override
  Widget build(BuildContext context) {
    screenUtil.init(context);
    return  SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          width: screenUtil.screenWidth *.76,
          height:double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(20) )),
          child: Drawer(
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
            ),
            child: SingleChildScrollView(
              child: Column(children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children:[
                    Padding(
                      padding:  EdgeInsets.only(bottom: screenUtil.screenHeight *.08),
                      child: Container(
                        height: screenUtil.screenHeight *.06,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppTheme.primaryColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(24))),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: screenUtil.screenWidth *.4),
                      child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: AppTheme.primaryColor),
                          width: 100,
                          height: 100,
                          child: Card(
                            shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  "assets/images/logo.jpg",

                                  fit: BoxFit.cover,
                                )),
                          )),
                    ),
                   Padding(
                     padding:  EdgeInsets.only(right: screenUtil.screenWidth *.3,top: screenUtil.screenHeight* .06),
                     child: Column(children: [
                       Text("شلهوب للتحف والهدايا",style: TextStyle(fontFamily: AppTheme.fontFamily,fontSize: 17,color: AppTheme.secondaryColor),),
                       Text("Shalhop@gmail.com",style: TextStyle(color: AppTheme.secondaryColor,fontSize: 17,fontWeight: FontWeight.bold)),

                     ],),
                   ),

                    Padding(
                      padding:  EdgeInsets.only(right: screenUtil.screenWidth*.6,bottom: screenUtil.screenHeight*.08),
                      child: IconButton(onPressed: (){
                        setState(() {

                            print('scaffolKey');
                            widget.scaffolKey.currentState?.closeDrawer();

                        });
                      }, icon: Icon(Icons.clear,color: Colors.white,size: 25,)),
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
              child: SpacialRequestPage()));

                }


                ),
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

                  Center(child:
                   RichText(

                     text: TextSpan(children: [
                     TextSpan(text: 'Developed By  ',style: TextStyle(fontFamily: AppTheme.fontFamily,color: Colors.black)),
                     TextSpan(text: 'BitLite ',style: TextStyle(fontFamily: AppTheme.fontFamily,color: AppTheme.primaryColor)),
                     TextSpan(text: 'Company ',style: TextStyle(fontFamily: AppTheme.fontFamily,color: Colors.black)),

                   ]),),

                  )]),
            )),
          ),
        ),
      );
  }
}
