import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shehop_flowers/features/Orders/Pages/DetailsOrderPage.dart';

import '../../../core/app_theme.dart';
import '../../../core/widgets/CustomPageRoute.dart';
import '../../../core/widgets/myCustemAppber.dart';
import '../../Drawer/presintation/Page/DrawerWidget.dart';

class OredrsPage extends StatefulWidget {
  const OredrsPage({Key? key}) : super(key: key);

  @override
  State<OredrsPage> createState() => _OredrsPageState();
}

class _OredrsPageState extends State<OredrsPage> {
  @override
  GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          key: scaffolKey,
          drawer:DrawerWidget(scaffolKey: scaffolKey),
          body: Column(children: [
            Stack(
              children: [
                myCustemAppber(name: "قائمة الطلبات",scaffolKey: scaffolKey),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.only(top: 70, left: 20, right: 30),
                    child: TextField(
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        suffixIcon: Icon(Icons.search_sharp,
                            size: 30, color: AppTheme.primaryColor),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      cursorColor: AppTheme.primaryColor,
                    ))
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){

                      Navigator.push(
                                  context,
                          CustomPageRoute(
                              child: DetailsOrderPage(name:"هدايا" ,
                                 imagePath: "assets/images/wp3338438.jpg",
                              )));
                    },
                    child: Card(
                      margin: EdgeInsets.all(5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(children: [
                        Container(
                            margin: EdgeInsets.all(10),
                            width: 150,
                            height: 150,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  "assets/images/wp3338438.jpg",
                                  fit: BoxFit.cover,
                                ))),
                        Column(
                        children: [
                          Text("هداياء خطوبة",
                              style: AppTheme.textTheme.headline4),
                          Text("رقم الطلب : 770213"),
                          Text("تاريخ الطلب : 16/1/2023"),
                        ]),
                      ]),
                    ),
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
