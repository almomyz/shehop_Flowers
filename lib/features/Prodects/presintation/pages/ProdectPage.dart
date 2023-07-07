import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shehop_flowers/features/Drawer/presintation/Page/DrawerWidget.dart';


import 'package:shimmer/shimmer.dart';

import '../../../../core/app_theme.dart';
import '../../../../core/widgets/CustomPageRoute.dart';
import '../../../../core/widgets/myCustemAppber.dart';
import '../../../ProdectDetails/presintation/Pages/DetailsPage.dart';

class ProdectPage extends StatefulWidget {
  String? nameCategories;


   ProdectPage({Key? key,required this.nameCategories,}) : super(key: key);

  @override
  State<ProdectPage> createState() => _ProdectPageState();
}

class _ProdectPageState extends State<ProdectPage> {
  String? nameCategories="";
  late Query<Map<String, dynamic>> userref ;
  GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            key: scaffolKey,
            drawer: DrawerWidget(scaffolKey: scaffolKey),
            body: Column(
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
                Expanded(
                  child: Container(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: userref.snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            child: GridView.builder(
                                padding: EdgeInsets.all(20),
                                itemCount: snapshot.data!.docs.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 30,
                                  mainAxisSpacing: 30,
                                ),
                                itemBuilder: (context, i) {
                                  return InkWell(
                                    onTap: () {},
                                    child:
                                    InkWell(
                                     onTap: (){
                                       Navigator.push(
                                           context,
                                           CustomPageRoute(  child:
                                           DetailsPage(imagePath:  "${snapshot.data!.docs[i]["imgurl"]}", name:  "${snapshot.data!.docs[i]["name"]}",nameCategres: widget.nameCategories,)));
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
                                                          "${snapshot.data!.docs[i]["imgurl"]}",
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
                                              "${snapshot.data!.docs[i]["name"]}",
                                              style: AppTheme.textTheme.bodyText2,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          );
                        }

                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Expanded(
                            child: Container(
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Shimmer.fromColors(
                                      highlightColor: Colors.white,
                                      baseColor: Colors.grey[300]!,
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        color: Colors.grey[300]!,
                                      ));
                                },
                              ),
                            ),
                          );
                        }

                        if (snapshot.hasError) {
                          {}
                        }
                        return Text("ok");
                      },
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }



@override
  void initState() {
    // TODO: implement initState
    super.initState();
    userref = FirebaseFirestore.instance
        .collection("${widget.nameCategories}")
        .orderBy("entery_date", descending: true);
  }


}
