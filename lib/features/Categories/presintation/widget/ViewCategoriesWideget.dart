import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/app_theme.dart';
import '../../../../core/util/ScreenUtil.dart';
import '../../../../core/widgets/CustomPageRoute.dart';

import '../../../ProdectDetails/presintation/Pages/DetailsPage.dart';
import '../../../Prodects/presintation/pages/ProdectPage.dart';

class ViewCategoriesWideget extends StatefulWidget {

 final name;
 final image;
 final id;
final nameCategories;
   ViewCategoriesWideget({Key? key,required this.nameCategories,required this.name,required this.image,required this.id}) : super(key: key);

  @override
  State<ViewCategoriesWideget> createState() => _ViewCategoriesWidegetState();
}

class _ViewCategoriesWidegetState extends State<ViewCategoriesWideget> {
  @override
  ScreenUtil screenUtil = ScreenUtil();


  Widget build(BuildContext context) {
    screenUtil.init(context);
    return  Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20.0),
      child: InkWell(
        onTap:  (){
          Navigator.push(
              context,
              CustomPageRoute(  child:
              DetailsPage(id: widget.id.toString(),imagePath:  "${widget.image}", name:  "${widget.name}",nameCategres: widget.nameCategories,)));
        },
        child: Column(
          children: [
            Container(
                width: screenUtil.screenWidth *.4,
                height: screenUtil.screenHeight *.17,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FadeInImage.assetNetwork(
                      placeholder:
                      'assets/images/loading.png',
                      image: widget.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      imageErrorBuilder: (context,
                          url, error) =>
                          Center(
                              child:
                              Shimmer.fromColors(
                                highlightColor: Colors.white,
                                baseColor: Colors.grey[300]!,
                                child: Container(
                                    color: AppTheme.primaryColor),
                              )),
                      fadeInCurve: Curves.bounceIn,
                    )

                )),

            Text(
              "${widget.name}",
              style: AppTheme.textTheme.bodyText2,
            )
          ],
        ),
      ),
    );
  }

}
