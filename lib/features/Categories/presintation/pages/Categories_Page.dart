import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shehop_flowers/core/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shehop_flowers/core/widgets/myCustemAppber.dart';
import 'package:shehop_flowers/features/Drawer/presintation/Page/DrawerWidget.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/widgets/CustomPageRoute.dart';
import '../../../ProdectDetails/Pages/DetailsPage.dart';
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
  String nameofCategorie="تحف وهدايا واكسوارات";
 int itemisselected=0;
  String image = 'assets/images/meun2.svg';
  int crunt_index = 1;
  List date = [1, 2, 3, 4, 5];
  List<String> imageList = [
    "assets/images/wp3338438.jpg",
    "assets/images/wp3338438.jpg",
    "assets/images/wp3338438.jpg",
    "assets/images/wp3338438.jpg",
    "assets/images/wp3338438.jpg",
    "assets/images/wp3338438.jpg",
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  List imageListCategories = [

    "assets/images/wp3338438.jpg",
    "assets/images/wp3338438.jpg",
    "assets/images/wp3338438.jpg",
    "assets/images/wp3338438.jpg",
    "assets/images/wp3338438.jpg",
  ];
  CollectionReference userref2 = FirebaseFirestore.instance.collection("NEWS");
  List namesCategories = [
    "باقات ميك اب",
    "باقات ومسكات ورد",
    "بـاقات شوكلاته",
    "تحف وهدايا واكسوارات",
    "نحت وخط",
  ];
  GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: scaffolKey,
        drawer: DrawerWidget(scaffolKey: scaffolKey),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(children: [
                  myCustemAppber(name: "القائمه الرئسية",scaffolKey: scaffolKey),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.only(top: 70, left: 20, right: 30),
                      child: TextField(
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          suffixIcon: Icon(Icons.search_sharp,
                              size: 30, color: AppTheme.primaryColor),
                          focusedBorder: UnderlineInputBorder(

                            borderSide: BorderSide(color: Colors.transparent,width: 10),
                          ),
                        ),
                        cursorColor: AppTheme.primaryColor,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Column(children: [
                      Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              print(currentIndex);
                            },
                            child: Container(
                              height: 200,
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
                            padding: const EdgeInsets.only(top: 220.0),
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
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 280, bottom: 30),
                  child: Text(
                    "الاقسام",
                    style: AppTheme.textTheme.headline1,
                  ),
                ),
                // Container(
                //   height: 100,
                //   width: double.infinity,
                //   child: ListView.builder(
                //       shrinkWrap: true,
                //       scrollDirection: Axis.horizontal,
                //       itemCount: 5,
                //       itemBuilder: ((context, index) {
                //         return Padding(
                //           padding:  EdgeInsets.only(right: 20.0, left: 20.0),
                //           child: Column(
                //             children: [
                //               Container(
                //
                //                   width: 71,
                //                   height: 71,
                //                   child: ClipRRect(
                //                       borderRadius: BorderRadius.circular(12),
                //                       child: Image.asset(
                //                         "assets/images/wp3338438.jpg",
                //                         fit: BoxFit.cover,
                //                       ))),
                //               Text(
                //                 "هدايا اعراس",
                //                 style: AppTheme.textTheme.bodyText2,
                //               )
                //             ],
                //           ),
                //         );
                //       })),
                // ),

                Container(
                  height: 120,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageListCategories.length,
                    itemBuilder: (context, index) {
                      return HomeCategoriesWidget(
                        name: namesCategories[index],
                        image: imageListCategories[index],
                        onTap: () {
                     setState(() {

                       itemisselected = index;
                       nameofCategorie = namesCategories[index];
                       print(nameofCategorie);
                     });

                     },
                        isSelected:itemisselected==index? true:false,
                      );
                    },
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                ViewCategoriesWideget(nameCategories: nameofCategorie,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
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
                  height: 160,
                  width: double.infinity,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: userref2.snapshots(),
                      builder: (context, snapshot) {
                        return ListView.builder(
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
                                        DetailsPage(imagePath:  "${snapshot.data!.docs[index]["imgurl"]}", name:  "${snapshot.data!.docs[index]["name"]}",)));
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                          width: 159,
                                          height: 131,
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
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    get();
  }

  get() async {
    CollectionReference userref =
        FirebaseFirestore.instance.collection("العروض");

    var reponsbody = await userref.get();
    reponsbody.docs.forEach((element) {
      // print(element["imgurl"]);
      imageList.add(element["imgurl"]);
    });
    print("*************************************************");
    print(imageList);
    print("*************************************************");
  }
}
