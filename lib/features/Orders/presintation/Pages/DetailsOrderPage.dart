import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/app_theme.dart';


class DetailsOrderPage extends StatefulWidget {
  final name;
  final imagePath;

  const DetailsOrderPage({Key? key,required this.name, required this.imagePath}) : super(key: key);

  @override
  State<DetailsOrderPage> createState() => _DetailsOrderPageState();
}

class _DetailsOrderPageState extends State<DetailsOrderPage> {
  int NumOreder = 0;
  var Content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24)),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/loading.png',
                      image:
                         widget.imagePath,
                      fit: BoxFit.cover,
                      imageErrorBuilder: (context, url, error) => Center(
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
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                          child: IconButton(
                              icon: Icon(Icons.arrow_back,
                                  size: 25, color: AppTheme.primaryColor),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          backgroundColor: Colors.white),
                      CircleAvatar(
                          child: IconButton(
                              icon: Icon(Icons.favorite),
                              onPressed: () {},
                              color: Colors.red),
                          backgroundColor: Colors.white),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 200, top: 15, bottom: 30),
              child: Column(
                children: [
                  Text(
                    "${widget.name}",
                    style: AppTheme.textTheme.headline4,
                  ),
                  Text(
                    "${widget.name}",
                    style: AppTheme.textTheme.headline4,
                  ),
                  Text(
                    "${widget.name}",
                    style: AppTheme.textTheme.headline4,
                  ),
                  Text(
                    "${widget.name}",
                    style: AppTheme.textTheme.headline4,
                  ),
                ],
              ),
            ),

            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 30),
              child: Text(
                "اترك ملاحظاتك عن طلبك ",
                style: AppTheme.textTheme.headline5,
                textDirection: TextDirection.rtl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 50),
              child: TextFormField(
                maxLines: 4,
                style: TextStyle(color: AppTheme.primaryColor),
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  hintText: 'اكتب ملاحظاتك هنا ......',
                  hintTextDirection: TextDirection.rtl,
                  icon: Icon(
                    Icons.edit_note,
                    color: AppTheme.primaryColor,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.primaryColor),
                  ),
                ),
                cursorColor: AppTheme.primaryColor,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(AppTheme.primaryColor),padding:MaterialStateProperty.all(EdgeInsets.all(10)) ,shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(7)),
                        ),
                      ),),
                      onPressed: () {

                      },
                      child: Text("اعـاده الـطلب",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),))),
            )



          ],
        ),
      ),
    );
  }
 
}


