import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/app_theme.dart';
import '../../../core/util/common.dart';
import '../Widgets/OtpInpouts.dart';

class DetailsPage extends StatefulWidget {
  final name;
  final imagePath;

  const DetailsPage({Key? key,required this.name, required this.imagePath}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
                ],
              ),
            ),
            Container(
              height: 100,
              width: double.infinity,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Column(
                        children: [
                          Container(
                              width: 80,
                              height: 80,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    "assets/images/wp3338438.jpg",
                                    fit: BoxFit.cover,
                                  ))),
                        ],
                      ),
                    );
                  })),
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
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              // Change your radius here
                              borderRadius: BorderRadius.circular(15),
                            ),
                          )),
                      onPressed: () {
                        phoneAuth(context,true);
                      },
                      child: Text("اطلب الان",
                          style: AppTheme.textTheme.bodyText2),
                    ),
                    Container(
                      child: Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                backgroundColor:
                                    AppTheme.primarySwatch.shade500,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      NumOreder++;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    size: 20,
                                    color: AppTheme.primaryColor,
                                  ),
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${NumOreder}",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                                backgroundColor: AppTheme.primaryColor,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      NumOreder--;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                )),



          ],
        ),
      ),
    );
  }
  otp(context){
    showModalBottomSheet(context: context, builder: (context) {
      return otpInpouts(context);







    },);


  }
}


