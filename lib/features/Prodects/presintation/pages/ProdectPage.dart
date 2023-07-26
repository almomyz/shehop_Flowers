import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shehop_flowers/core/util/ScreenUtil.dart';
import 'package:shehop_flowers/features/Drawer/presintation/Page/DrawerWidget.dart';
import 'package:shehop_flowers/features/Prodects/Controller/ProdectController.dart';


import 'package:shimmer/shimmer.dart';

import '../../../../core/app_theme.dart';
import '../../../../core/widgets/CustomPageRoute.dart';
import '../../../../core/widgets/myCustemAppber.dart';
import '../../../Categories/Controller/CategoriesController.dart';
import '../../../ProdectDetails/presintation/Pages/DetailsPage.dart';

class ProdectPage extends StatefulWidget {
  String? nameCategories;


   ProdectPage({Key? key,required this.nameCategories,}) : super(key: key);

  @override
  State<ProdectPage> createState() => _ProdectPageState();
}

class _ProdectPageState extends State<ProdectPage> {
  String? nameCategories="";
  final prodectController = Get.put(ProdectController());
  final categoriesController = Get.put(CategoriesController());

  ScreenUtil screenUtil =ScreenUtil();

  GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    screenUtil.init(context);
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(

            drawer: DrawerWidget(scaffolKey: scaffolKey),
            body: SingleChildScrollView(child: Column(
                children: [
                  Stack(
                    children: [
                      myCustemAppber(name: widget.nameCategories.toString(),scaffolKey: scaffolKey),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.only(top: 70, left: 20, right: 30),
                          child: TextField(
                            onChanged: (searchWord){

                                     prodectController.onSearch(searchWord,widget.nameCategories.toString());


                            },
                            textDirection: TextDirection.rtl,
                              decoration: InputDecoration(
enabledBorder:  UnderlineInputBorder(
  borderSide: BorderSide(color: Colors.white),
),
                                suffixIcon: Icon(Icons.search_sharp, size: 30,color: AppTheme.primaryColor),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),

                          ),
                            cursorColor: AppTheme.primaryColor,

                          ))
                    ],
                  ),

                  SizedBox(height: 20,),
                  Container(
                    height:screenUtil.screenHeight *.8 ,
                    width: double.infinity,
                    child: GetBuilder<ProdectController>(
                      builder: (controller) {


                        return  Container(
                          padding: EdgeInsets.only(right: 15,left: 15),
                            child:  GridView.builder(
                              itemCount: widget.nameCategories.toString()=='جديدنا'? categoriesController.newList.length  :controller.prodectList.length ,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 30,
                                mainAxisSpacing: 30,

                              ), itemBuilder: (context, index) {
                              return   InkWell(
                                onTap: () {},
                                child:
                                InkWell(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        CustomPageRoute(  child:
                                        DetailsPage(id:widget.nameCategories.toString()=='جديدنا'? categoriesController.newList[index].id: controller.prodectList[index].id,imagePath:widget.nameCategories.toString()=='جديدنا'? categoriesController.newList[index].image  : "${controller.prodectList[index].image}", name: widget.nameCategories.toString()=='جديدنا'? categoriesController.newList[index].name: "${controller.prodectList[index].name}",nameCategres: widget.nameCategories,)));
                                  },
                                  child: Column(

                                    children: [

                                      Expanded(
                                        flex:7,
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                          child: AspectRatio(
                                            aspectRatio: 16 / 9,
                                            child:
                                            FadeInImage.assetNetwork(
                                              placeholder:
                                              'assets/images/loading.png',
                                              image:

                    widget.nameCategories.toString()=='جديدنا'? categoriesController.newList[index].image:
                                              "${controller.prodectList[index].image}",
                                              fit: BoxFit.cover,
                                              imageErrorBuilder:
                                                  (context, url, error) => Center(
                                                  child: Shimmer.fromColors(
                                                    highlightColor: Colors.white,
                                                    baseColor: Colors.grey[300]!,
                                                    child: Container(color: Colors.red),
                                                  )),
                                              fadeInCurve: Curves.bounceIn,
                                              height: 200,
                                              width: 180,

                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex:1,
                                        child: Text(
                                          widget.nameCategories.toString()=='جديدنا'? categoriesController.newList[index].name:
                                          "   ${controller.prodectList[index].name}",
                                          style: AppTheme.textTheme.bodyText2,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },)


                        );

                      },

                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }



@override
  void initState() {
    // TODO: implement initState
    super.initState();

    prodectController.getProdect(widget.nameCategories.toString());

}

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    prodectController.prodectList.clear();
  }
}
