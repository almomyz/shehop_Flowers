import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';


import '../../../../core/app_theme.dart';
import '../../../../core/util/ScreenUtil.dart';
import '../../../../core/util/common.dart';
import '../../../Categories/Controller/CategoriesController.dart';
import '../../Controller/ProdectDetailsController.dart';
import '../Widgets/OtpInpouts.dart';

class DetailsPage extends StatefulWidget {
  final name;
  final imagePath;
  final nameCategres;
  const DetailsPage({Key? key,required this.name, required this.imagePath,required this.nameCategres}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int NumOreder = 0;
  var Content;
  ScreenUtil screenUtil =ScreenUtil();
   String? imageUrl;
   String? name;
  Icon SuffixIcon = Icon(
    Icons.cancel,
    color: Colors.red,
    size: 32,
  );
   bool isloding=false;
  final _formKey = GlobalKey<FormState>();
  final prodectDetailsController =     Get.put(ProdectDetailsController());
  //final LoginController =     Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    screenUtil.init(context);
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
                      imageUrl ?? widget.imagePath,
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
            SizedBox(height: 10,),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${name ?? widget.name}",

                  style: AppTheme.textTheme.headline4,
                ),
                SizedBox(height: 020,),

              ],
            ),
            Divider(color: AppTheme.primaryColor,),
            Padding(
              padding:  EdgeInsets.only(left: screenUtil.screenWidth *.6),
              child: Text(
                "مشابه",
                style: AppTheme.textTheme.headline4,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: screenUtil.screenHeight *.12,
              width: double.infinity,
              child: GetBuilder<CategoriesController>(
                 builder: (controller) {
                   return StreamBuilder<QuerySnapshot>(
                       stream: controller.getdate(widget.nameCategres.toString()),
                       builder: (context, snapshot) {
                         return  ListView.builder(
                             shrinkWrap: true,
                             scrollDirection: Axis.horizontal,
                             itemCount: snapshot.data!.docs.length,
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
                                             child: InkWell(
                                               onTap: (){
                                                       setState(() {
                                                         name=snapshot.data!.docs[index]["name"];
                                                         imageUrl=snapshot.data!.docs[index]["imgurl"];
                                                       });
                                               },
                                               child: Image.network(
                                                 '${snapshot.data!.docs[index]["imgurl"]}',
                                                 fit: BoxFit.cover,
                                               ),
                                             ))),
                                   ],
                                 ),
                               );
                             }));
                       },
                   );
                 },
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
                height: screenUtil.screenHeight *.15,
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

                          showModalBottomSheet(
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30))),
                              barrierColor: AppTheme.primarySwatch.shade700,
                              context: context,

                              builder: (context) {
                                screenUtil.init(context);
                                return SingleChildScrollView(
                                  child: Padding(

                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context).viewInsets.bottom),
                                    child: Container(
                                      height: screenUtil.screenHeight *.4,
                                      width: double.infinity,
                                      child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            Text("ادخل رقم الهاتف",
                                                style: AppTheme.textTheme.bodyText1),
                                            Form(
                                              key: _formKey,

                                              child: TextFormField(

                                                onChanged: (value) {
                                                  if (value.length == 9) {
                                                    setState(() {
                                                      SuffixIcon = Icon(Icons.check_circle,
                                                          color: Colors.green, size: 32);
                                                    });
                                                  } else {
                                                    setState(() {
                                                      SuffixIcon = Icon(Icons.cancel,
                                                          color: Colors.red, size: 32);
                                                    });
                                                  }
                                                },
                                                validator: (value) {
                                                  if (value.toString().isEmpty ||
                                                      value.toString().length <= 8)
                                                    return "يرجئ التحقق من الرقم المدخل";
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  filled: true,
                                                    fillColor: Colors.grey.shade200,
                                                    hintText: "7********",
                                                    labelText: "رقم الهاتف",

                                                    enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.black12),
                                                        borderRadius:
                                                        BorderRadius.circular(10)),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.black12),
                                                        borderRadius:
                                                        BorderRadius.circular(10)),
                                                    prefix: Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: 8),
                                                      child: Text(
                                                        '(+967)',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    suffixIcon: SuffixIcon),
                                                maxLength: 9,
                                                controller: phone,
                                                keyboardType: TextInputType.phone,
                                                textDirection: TextDirection.ltr,

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
                                                        // setState(() => isLoding = true);
                                                        // controller.verifyPhone(
                                                        //     phone.text, context);
                                                        // await Future.delayed(
                                                        //     const Duration(seconds: 15));
                                                        //
                                                        // setState(() => isLoding = false);
                                                        // SharedPreferences share =
                                                        //     await SharedPreferences
                                                        //     .getInstance();
                                                        // share.setString("phone", phone.text);
                                                      },
                                                      child:isloding? Center(child: CircularProgressIndicator(color: Colors.white,strokeWidth: 5,)):Text("تاكيد"))),
                                            )
                                          ]),
                                    ),
                                  ),
                                );
                              });



                      },
                      child: Text("اطلب الان",
                          style: AppTheme.textTheme.bodyText2),
                    ),
                    GetBuilder<ProdectDetailsController>(
                   builder: (controller) {
                     return Container(
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
                                     controller.intcrment();
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
                               controller.counter <=9?'0${controller.counter}':

                              controller.counter.toString(),
                               style: TextStyle(fontSize: 20),
                             ),
                             SizedBox(
                               width: 5,
                             ),
                             CircleAvatar(
                                 backgroundColor: AppTheme.primaryColor,
                                 child: IconButton(
                                   onPressed: () {
                                     controller.decrment();
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
                     );
                   },
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


