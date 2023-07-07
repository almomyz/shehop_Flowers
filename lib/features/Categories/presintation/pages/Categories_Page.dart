import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shehop_flowers/core/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shehop_flowers/core/util/ScreenUtil.dart';
import 'package:shehop_flowers/core/widgets/myCustemAppber.dart';
import 'package:shehop_flowers/features/Categories/Controller/CategoriesController.dart';
import 'package:shehop_flowers/features/Drawer/presintation/Page/DrawerWidget.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/widgets/CustomPageRoute.dart';
import '../../../../main.dart';
import '../../../ProdectDetails/presintation/Pages/DetailsPage.dart';
import '../../../Prodects/presintation/pages/ProdectPage.dart';
import '../widget/ViewCategoriesWideget.dart';
import '../widget/homeCategoriesWidget.dart';

class Categories_Page extends StatefulWidget {
  const Categories_Page({Key? key}) : super(key: key);

  @override
  State<Categories_Page> createState() => _Categories_PageState();
}

class _Categories_PageState extends State<Categories_Page> {
  @override
  int indexes = 0;
  String nameofCollection="تحف وهدايا واكسوارات";
 int itemisselected=0;
  String image = 'assets/images/meun2.svg';
  int crunt_index = 1;
  List date = [1, 2, 3, 4, 5];
  List<String> imageList = [

  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  List imageListCategories = [

    "assets/images/make-up.jpg",
    "assets/images/flower.jpg",
    "assets/images/package.png",
    "assets/images/antiques.jpg",
    "assets/images/font_gift.jpg",
  ];

  List namesCategories = [
    "باقات ميك اب",
    "باقات ومسكات ورد",
    "بـاقات شوكلاته",
    "تحف وهدايا واكسوارات",
    "نحت وخط",
  ];
  ScreenUtil screenUtil =ScreenUtil();
  GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    screenUtil.init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: scaffolKey,
        drawer: DrawerWidget(scaffolKey: scaffolKey),
        body: SafeArea(
          child: GetBuilder<CategoriesController>(
            builder:(controller) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(children: [
                      myCustemAppber(name: "القائمه الرئسية",scaffolKey: scaffolKey),

                      Padding(
                        padding:  EdgeInsets.only(top: screenUtil.screenHeightNoPadding *.2),
                        child: Column(children: [
                          Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  print(currentIndex);
                                },
                                child: Container(
                                  height: screenUtil.screenHeight *.25,
                                  width: double.infinity,
                                  child: CarouselSlider(
                                    items: imageList
                                        .map(
                                          (item) => Container(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: FadeInImage.assetNetwork(
                                            placeholder:
                                            'assets/images/loading.png',
                                            image: item,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            imageErrorBuilder:
                                                (context, url, error) => Center(
                                                child: Shimmer.fromColors(
                                                  highlightColor: Colors.white,
                                                  baseColor: Colors.grey[300]!,
                                                  child: Container(color: Colors.red),
                                                )),
                                            fadeInCurve: Curves.bounceIn,
                                          ),
                                        ),
                                      ),
                                    )
                                        .toList(),
                                    carouselController: carouselController,
                                    options: CarouselOptions(
                                      autoPlay: true,
                                      animateToClosest: true,
                                      enlargeCenterPage: true,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          currentIndex = index;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(top: screenUtil.screenHeight *.27),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: imageList.asMap().entries.map((entry) {
                                    return GestureDetector(
                                      onTap: () =>
                                          carouselController.animateToPage(entry.key),
                                      child: Container(
                                        width: currentIndex == entry.key ? 17 : 7,
                                        height: 7.0,
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 3.0,
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: currentIndex == entry.key
                                                ? AppTheme.primaryColor
                                                : Colors.grey),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ]),
                    SizedBox(height: 20,),
                    Align(

                      alignment: AlignmentDirectional.topStart,
                      child: Container(
                        padding: EdgeInsets.only(right: screenUtil.screenWidth *.05),
                        child: Text(
                          "الاقسام",
                          style: AppTheme.textTheme.headline1,

                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.only(right: screenUtil.screenWidth *.05),
                      height: screenUtil.screenHeight *.18,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imageListCategories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:  EdgeInsets.all(10.0),
                            child: HomeCategoriesWidget(
                              name: namesCategories[index],
                              image: imageListCategories[index],
                              onTap: () {
                                setState(() {

                                  itemisselected = index;
                                  nameofCollection=namesCategories[index];
                                  controller.getdate(namesCategories[index]);
                                });

                              },
                              isSelected:itemisselected==index? true:false,
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    ViewCategoriesWideget(userref: controller.getdate(namesCategories[itemisselected]),nameCategories: nameofCollection),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(right: screenUtil.screenWidth* .05),
                          child: Text(
                            "جديدنا",
                            style: AppTheme.textTheme.headline1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CustomPageRoute(
                                      child: ProdectPage(
                                        nameCategories: "NEWS",
                                      )));
                            },
                            child: Text(
                              "عرض الكل",
                              style: AppTheme.textTheme.bodyText2,
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: screenUtil.screenHeight *.25,
                      width: double.infinity,
                      child:   StreamBuilder<QuerySnapshot>(
                        stream: controller.getdate('NEWS'),
                        builder: (context, snapshot) {
                          // if(snapshot.connectionState ==ConnectionState.waiting){
                          //   return Container(
                          //     child: ListView.builder(
                          //       itemCount: 10,
                          //       itemBuilder: (context, index) {
                          //         return Padding(
                          //             padding: const EdgeInsets.only(
                          //                 right: 20.0, left: 20.0),
                          //           child: Shimmer.fromColors(
                          //               highlightColor: Colors.white,
                          //               baseColor: Colors.grey[300]!,
                          //               child: Container(
                          //                 height: 150,
                          //                 width: 150,
                          //                 color: Colors.grey[300]!,
                          //               )),
                          //         );
                          //       },
                          //     ),
                          //   );
                          // }
                          if(snapshot.hasData){
                            return
                              ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: ((context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20.0, left: 20.0),
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.push(
                                              context,
                                              CustomPageRoute(  child:
                                              DetailsPage(imagePath:  "${snapshot.data!.docs[index]["imgurl"]}", name:  "${snapshot.data!.docs[index]["name"]}",nameCategres: nameofCollection,)));
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                                width: screenUtil.screenWidth *.4,
                                                height: screenUtil.screenHeight *.17,
                                                child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(12),
                                                    child: Image.network(
                                                      "${snapshot.data!.docs[index]["imgurl"]}",
                                                      fit: BoxFit.cover,
                                                    ))),
                                            Text(
                                              "${snapshot.data!.docs[index]["name"]}",
                                              style: AppTheme.textTheme.bodyText2,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }));
                          }
                          return Container();
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
        getSpchial();
  }
  getSpchial()async{
  imageList=await   CategriesController.get();

  }

}
