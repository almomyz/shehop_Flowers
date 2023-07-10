import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/app_theme.dart';
import '../../../../core/widgets/CustomPageRoute.dart';
import '../../../../core/widgets/myCustemAppber.dart';
import '../../../Drawer/presintation/Page/DrawerWidget.dart';
import '../../Controller/OrderController.dart';
import 'DetailsOrderPage.dart';



class OredrsPage extends StatefulWidget {
  const OredrsPage({Key? key}) : super(key: key);

  @override
  State<OredrsPage> createState() => _OredrsPageState();
}

class _OredrsPageState extends State<OredrsPage> {
  @override
  GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();
  final orderController =     Get.put(OrderController());
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          key: scaffolKey,
          drawer:DrawerWidget(scaffolKey: scaffolKey),
          body: GetBuilder<OrderController>(
            builder: (controller) {
              return Column(children: [
                Stack(
                  children: [
                    myCustemAppber(name: "قائمة الطلبات",scaffolKey: scaffolKey),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.only(top: 70, left: 20, right: 30),
                        child: TextField(
                          onChanged: (searchWord){
                            controller.onSearch(searchWord);
                          },
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
                    itemCount: controller.orderList.length,
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
                                    child: Image.network(
                                      controller.orderList[index].imgurl,
                                      fit: BoxFit.cover,
                                    ))),
                            Column(
                                children: [
                                  Text(controller.orderList[index].name,
                                      style: AppTheme.textTheme.headline4),
                                  Text(controller.orderList[index].OrderN.toString()),
                                  Text(controller.orderList[index].note),
                                ]),
                          ]),
                        ),
                      );
                    },
                  ),
                )
              ]);

            },
          ),
        ),
      ),
    );
  }
}
