import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/app_theme.dart';
import '../../../../core/widgets/CustomPageRoute.dart';
import '../../../ProdectDetails/Pages/DetailsPage.dart';
import '../../../Prodects/presintation/pages/ProdectPage.dart';

class ViewCategoriesWideget extends StatefulWidget {

  final nameCategories;

   ViewCategoriesWideget({Key? key,required this.nameCategories}) : super(key: key);

  @override
  State<ViewCategoriesWideget> createState() => _ViewCategoriesWidegetState();
}

class _ViewCategoriesWidegetState extends State<ViewCategoriesWideget> {
  @override

  late Query<Map<String, dynamic>> userref;
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      child: StreamBuilder<QuerySnapshot>(
          stream:userref.snapshots() ,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: ((context, index) {
                  if(index==5){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20,right: 20 ,left: 20),
                      child: Container(
                        height: 131,
                        child: InkWell(onTap: (){

                          Navigator.push(
                              context,
                              CustomPageRoute(
                                  child: ProdectPage(
                                    nameCategories: widget.nameCategories.toString(),
                                  )));
                        },child: Center(child: Text("عرض الكل ",style: AppTheme.textTheme.headline2))),
                        width: 159,
                        decoration: BoxDecoration(color: AppTheme.primarySwatch.shade700,borderRadius: BorderRadius.all(Radius.circular(12)),
                      )

                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                    child: InkWell(
                    onTap:  (){
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
                                  borderRadius: BorderRadius.circular(12),
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
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                prototypeItem: Text(""),
                itemBuilder: ((context, index) {

                  return Padding(
                    padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                    child: Column(
                      children: [
                        Container(
                            width: 159,
                            height: 131,
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12)),),
                            child:Shimmer.fromColors(
                                highlightColor: Colors.white,
                                baseColor: Colors.grey[300]!,
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  color: Colors.grey[300]!,
                                ))
                        ),

                      ],
                    ),
                  );
                }));;
          }
          
          return Text("data") ;
        }
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState

      userref = FirebaseFirestore.instance
          .collection("${widget.nameCategories}")
          .orderBy("entery_date", descending: true);

  }
}
