import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shehop_flowers/features/Orders/Pages/DetailsOrderPage.dart';

import '../../../core/app_theme.dart';
import '../../../core/widgets/CustomPageRoute.dart';
import '../../../core/widgets/myCustemAppber.dart';
import '../../Drawer/presintation/Page/DrawerWidget.dart';

class PointsOfSale extends StatefulWidget {
  const PointsOfSale({Key? key}) : super(key: key);

  @override
  State<PointsOfSale> createState() => _PointsOfSaleState();
}

class _PointsOfSaleState extends State<PointsOfSale> {
  @override
  GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          key: scaffolKey,
          drawer: DrawerWidget(scaffolKey: scaffolKey),
          body: Column(children: [
            Stack(
              children: [
                myCustemAppber(name: "نقاط البيع",scaffolKey: scaffolKey),
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
                itemBuilder: (contxt, index) {
                  return Card(
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
                        Text("محلات الشلهوب",
                            style: AppTheme.textTheme.headline4),
                        Text("السنينه- جوار حلويات ابو خالد"),
                        Text("+967776661971"),
                      ]),
                    ]),
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
