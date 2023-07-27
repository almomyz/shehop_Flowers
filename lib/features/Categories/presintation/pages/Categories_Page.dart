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
import '../../../../core/util/common.dart';
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
  String nameofCollection = "تحف وهدايا واكسوارات";
  int itemisselected = 0;
  String image = 'assets/images/meun2.svg';
  int crunt_index = 1;
  List date = [1, 2, 3, 4, 5];
  List<String> imageList = [];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  ScreenUtil screenUtil = ScreenUtil();

  final categoriesController = Get.put(CategoriesController());
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
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(children: [
                      myCustemAppber(
                          name: "القائمه الرئسية", scaffolKey: scaffolKey),
                      Padding(
                        padding: EdgeInsets.only(
                            top: screenUtil.screenHeightNoPadding * .2),
                        child: Column(children: [
                          Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  print(currentIndex);
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      height: screenUtil.screenHeight * .25,
                                      width: double.infinity,
                                      child: CarouselSlider(
                                        items: imageList
                                            .map(
                                              (item) => Container(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child:
                                                      FadeInImage.assetNetwork(
                                                    placeholder:
                                                        'assets/images/loading.png',
                                                    image: item,
                                                    fit: BoxFit.cover,
                                                    width: double.infinity,
                                                    imageErrorBuilder:
                                                        (context, url, error) =>
                                                            Center(
                                                                child: Shimmer
                                                                    .fromColors(
                                                      highlightColor:
                                                          Colors.white,
                                                      baseColor:
                                                          Colors.grey[300]!,
                                                      child: Container(
                                                          color: AppTheme
                                                              .primaryColor),
                                                    )),
                                                    fadeInCurve:
                                                        Curves.bounceIn,
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
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: screenUtil.screenWidth * .75,
                                          top: screenUtil.screenHeight * .17),
                                      child: Row(children: [
                                        CircleAvatar(
                                            radius: 25,
                                            backgroundColor: Colors.white,
                                            child: Image.asset(
                                              'assets/images/Special-offer.png',
                                              height: 50,
                                              width: 50,
                                            )),
                                      ]),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: screenUtil.screenHeight * .27),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:
                                      imageList.asMap().entries.map((entry) {
                                    return GestureDetector(
                                      onTap: () => carouselController
                                          .animateToPage(entry.key),
                                      child: Container(
                                        width:
                                            currentIndex == entry.key ? 17 : 7,
                                        height: 7.0,
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 3.0,
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Container(
                        padding: EdgeInsets.only(
                            right: screenUtil.screenWidth * .05),
                        child: Text(
                          "الاقسام",
                          style: AppTheme.textTheme.headline1,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(right: screenUtil.screenWidth * .05),
                      height: screenUtil.screenHeight * .18,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.categories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(10.0),
                            child: HomeCategoriesWidget(
                              name: controller.categories[index].name,
                              image: controller.categories[index].image,
                              onTap: () {
                                setState(() {
                                  print('kkkkk');
                                  itemisselected = index;
                                  nameofCollection =
                                      controller.categories[index].name;
                                  controller.getdate(
                                      controller.categories[index].name);
                                });
                              },
                              isSelected:
                                  itemisselected == index ? true : false,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    controller.categoriesList.length == 0
                        ? Container(
                            height: screenUtil.screenHeight * .20,
                            width: double.infinity,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  width: screenUtil.screenWidth * .45,
                                  height: screenUtil.screenHeight * .08,
                                  padding: EdgeInsets.all(10),
                                  child: Shimmer.fromColors(
                                    highlightColor: Colors.transparent,
                                    baseColor: Colors.grey[300]!,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      width: screenUtil.screenWidth * .4,
                                      height: screenUtil.screenHeight * .15,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Container(
                            height: screenUtil.screenHeight * .2,
                            width: double.infinity,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 6,
                                itemBuilder: ((context, index) {
                                  if (index == 5) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 20, right: 20, left: 20),
                                      child: Container(
                                          height: screenUtil.screenHeight * .2,
                                          child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    CustomPageRoute(
                                                        child: ProdectPage(
                                                      nameCategories:
                                                          nameofCollection,
                                                    )));
                                              },
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text("عرض الكل ",
                                                      style: TextStyle(
                                                          fontFamily: AppTheme
                                                              .fontFamily,
                                                          color: Colors.white,
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Icon(
                                                    Icons
                                                        .arrow_back_ios_new_rounded,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              )),
                                          width: 159,
                                          decoration: BoxDecoration(
                                            color:
                                                AppTheme.primarySwatch.shade700,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                          )),
                                    );
                                  }
                                  return ViewCategoriesWideget(
                                      id: controller.categoriesList[index].id,
                                      image: controller
                                          .categoriesList[index].image,
                                      name:
                                          controller.categoriesList[index].name,
                                      nameCategories: nameofCollection);
                                })),
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: screenUtil.screenWidth * .05),
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
                                    nameCategories: "جديدنا",
                                  )));
                            },
                            child: Text(
                              "عرض الكل",
                              style: TextStyle(
                                  color: AppTheme.secondaryColor,
                                  fontSize: 15,
                                  fontFamily: AppTheme.fontFamily,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        height: screenUtil.screenHeight * .20,
                        width: double.infinity,
                        child: GetBuilder<CategoriesController>(
                          builder: (controller) {
                            return controller.newList.length == 0
                                ? Container(
                                    height: screenUtil.screenHeight * .25,
                                    width: double.infinity,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          width: screenUtil.screenWidth * .45,
                                          height: screenUtil.screenHeight * .08,
                                          padding: EdgeInsets.all(10),
                                          child: Shimmer.fromColors(
                                            highlightColor: Colors.transparent,
                                            baseColor: Colors.grey[300]!,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: AppTheme.primaryColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              width:
                                                  screenUtil.screenWidth * .4,
                                              height:
                                                  screenUtil.screenHeight * .15,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            right: 20.0, left: 20.0),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                CustomPageRoute(
                                                    child: DetailsPage(
                                                  id: controller
                                                      .newList[index].id
                                                      .toString(),
                                                  imagePath: controller
                                                      .newList[index].image,
                                                  name: controller
                                                      .newList[index].name,
                                                  nameCategres: controller
                                                      .newList[index]
                                                      .nameCategory,
                                                )));
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                  width:
                                                      screenUtil.screenWidth *
                                                          .4,
                                                  height:
                                                      screenUtil.screenHeight *
                                                          .17,
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      child: FadeInImage
                                                          .assetNetwork(
                                                        placeholder:
                                                            'assets/images/loading.png',
                                                        image: controller
                                                            .newList[index]
                                                            .image,
                                                        fit: BoxFit.cover,
                                                        width: double.infinity,
                                                        imageErrorBuilder: (context,
                                                                url, error) =>
                                                            Center(
                                                                child: Shimmer
                                                                    .fromColors(
                                                          highlightColor:
                                                              Colors.white,
                                                          baseColor:
                                                              Colors.grey[300]!,
                                                          child: Container(
                                                              color: AppTheme
                                                                  .primaryColor),
                                                        )),
                                                        fadeInCurve:
                                                            Curves.bounceIn,
                                                      ))),
                                              Text(
                                                "${controller.newList[index].name}",
                                                style: AppTheme
                                                    .textTheme.bodyText2,
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }));
                          },
                        )),
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
    categoriesController.getdate('باقات ميك اب');

    getSpchial();
  }

  getSpchial() async {
    imageList = await CategriesController.get();
  }
}
