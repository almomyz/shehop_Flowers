import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/app_theme.dart';
import '../../../../core/util/common.dart';
import '../../../../core/widgets/CustomPageRoute.dart';
import '../../../../core/widgets/myCustemAppber.dart';
import '../../../Drawer/presintation/Page/DrawerWidget.dart';
import '../../../ProdectDetails/presintation/Pages/DetailsPage.dart';
import '../../Controller/FavoriteController.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  final favoriteController = Get.put(FavoriteController());
  GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            key: scaffolKey,
            drawer: DrawerWidget(scaffolKey: scaffolKey),
            body: GetBuilder<FavoriteController>(
              builder: (controller) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        myCustemAppber(name: "المفضله",scaffolKey: scaffolKey, ),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.only(
                                top: 70, left: 20, right: 30),
                            child: TextField(
                              onChanged: (searchWord){
                                controller.onSearch(searchWord);
                              },
                              textDirection: TextDirection.rtl,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                suffixIcon: Icon(Icons.search_sharp, size: 30,
                                    color: AppTheme.primaryColor),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),

                              ),
                              cursorColor: AppTheme.primaryColor,

                            ))
                      ],
                    ),
                    Expanded(
                      child: Container(
                        child:  Container(
                          child:
                          controller.favoriteList.length==0? Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('لا يوجد اي مفضله حاليا',style: AppTheme.textTheme.bodyText1,),

                                ]),
                          ):

                          GridView.builder(
                              padding: EdgeInsets.all(20),
                              itemCount: controller.favoriteList.length,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 30,
                                mainAxisSpacing: 30,
                              ),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {},
                                  child:
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          CustomPageRoute(child:
                                          DetailsPage(
                                            id: '${controller.favoriteList[index].id}',
                                            imagePath: "${controller.favoriteList[index].image}",
                                            name: "${controller.favoriteList[index].name}",
                                            nameCategres: 'NEWS',)));
                                    },
                                    child: Stack(
                                      children: [
                                        Column(

                                          children: [

                                            Expanded(
                                              flex: 7,
                                              child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(10)),
                                                child: AspectRatio(
                                                  aspectRatio: 16 / 9,
                                                  child:
                                                  FadeInImage
                                                      .assetNetwork(
                                                    placeholder:
                                                    'assets/images/loading.png',
                                                    image:
                                                    "${controller.favoriteList[index].image}}",
                                                    fit: BoxFit.cover,
                                                    imageErrorBuilder:
                                                        (context, url,
                                                        error) =>
                                                        Center(
                                                            child: Shimmer
                                                                .fromColors(
                                                              highlightColor: Colors
                                                                  .white,
                                                              baseColor: Colors
                                                                  .grey[300]!,
                                                              child: Container(
                                                                  color: Colors
                                                                      .red),
                                                            )),
                                                    fadeInCurve: Curves
                                                        .bounceIn,
                                                    height: 200,
                                                    width: 180,

                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                "${controller.favoriteList[index].name}",
                                                style: AppTheme.textTheme
                                                    .bodyText2,
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: CircleAvatar(

                                              child: IconButton(
                                                  icon: Icon(
                                                      Icons.favorite),
                                                  onPressed: () {
                                                    print('ffffff');
                                                    setState(() {
                                                      controller.removeFavorite(index);

                                                    });

                                                  },
                                                  color: Colors.red),
                                              backgroundColor: Colors
                                                  .white),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    )
                  ],
                );
              },
            )),
      ),
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //   userref = FirebaseFirestore.instance
    //       .collection("${nameCategories}")
    //       .orderBy("entery_date", descending: true);
    // }

  }
}