import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/app_theme.dart';
import '../../../Favorite/Controller/FavoriteController.dart';
import '../../../Prodects/data/model/ProdectsModel.dart';


class DetailsOrderPage extends StatefulWidget {
  final name;
  final imagePath;
  final Date_Order;
  final phoneNumber;
  final OrderN;
  final Order_Status;
  final note;
  final count_order;
  final nameCategres;
  final id;



  const DetailsOrderPage({Key? key,required this.id,required this.name, required this.imagePath,required this.Date_Order,required this.phoneNumber,required this.OrderN,required this.Order_Status,required this.note,required this.count_order,required this.nameCategres}) : super(key: key);

  @override
  State<DetailsOrderPage> createState() => _DetailsOrderPageState();
}

class _DetailsOrderPageState extends State<DetailsOrderPage> {
  int NumOreder = 0;
  var Content;
  TextEditingController note=TextEditingController();
  final favoriteController = Get.put(FavoriteController());
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
                          child: FavoriteButton(
                            iconSize: 40,
                            isFavorite:favoriteController.favoriteList
                                .where((element) =>
                                element.id.toString().toLowerCase().contains(widget.id))
                                .toList().length!=0?true:false,
                            iconDisabledColor: Colors.grey,
                            valueChanged: (_isFavorite) {
                              print('Is Favorite $_isFavorite)');
                              favoriteController.addFavorite(ProdectsModel(nameCategory: widget.nameCategres,image: widget.imagePath,name: widget.name,id: 1));
                            },
                          ),
                          backgroundColor: Colors.white),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${widget.name}",
                  style: AppTheme.textTheme.headline4,
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [

                  Text(
                    "${widget.OrderN}",
                    style: AppTheme.textTheme.bodyText1,
                  ),
                  Text(
                    " : رقم الطلب ",
                    style: AppTheme.textTheme.bodyText1,
                  ),
                ],),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                  Text(
                    "${widget.phoneNumber}",
                    style: AppTheme.textTheme.bodyText1,
                  ),
                  Text(
                    " : رقم الهاتف ",
                    style: AppTheme.textTheme.bodyText1,
                  ),
                ],),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                  Text(
                    "${widget.Date_Order}",
                    style: AppTheme.textTheme.bodyText1,
                  ),
                  Text(
                    " : تاريخ الطلب  ",
                    style: AppTheme.textTheme.bodyText1,
                  ),
                ],),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                  Text(
                    widget.count_order ==1?'تم ارسال الطلب' :widget.count_order==2?'......جاري العمل على الطلب':'تم اكمال الطلب',
                    style: AppTheme.textTheme.bodyText1,
                  ),
                  Text(
                    " : حاله الطلب   ",
                    style: AppTheme.textTheme.bodyText1,
                  ),
                ],),

              ],
            ),
            SizedBox(height: 20,),

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
                controller: note,
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
                      child: Text("اعـاده الـطلب",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: AppTheme.fontFamily),))),
            )



          ],
        ),
      ),
    );
  }
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    note.text=widget.note;
  }
}


