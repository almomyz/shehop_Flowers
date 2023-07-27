import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shehop_flowers/features/ProdectDetails/Controller/LoginController.dart';
import 'package:shimmer/shimmer.dart';


import '../../../../core/app_theme.dart';
import '../../../../core/util/ScreenUtil.dart';
import '../../../../core/util/common.dart';
import '../../../../core/widgets/CustomPageRoute.dart';
import '../../../Categories/Controller/CategoriesController.dart';
import '../../../Favorite/Controller/FavoriteController.dart';
import '../../../Orders/presintation/Pages/OrdersPage.dart';
import '../../../Prodects/data/model/ProdectsModel.dart';
import '../../Controller/ProdectDetailsController.dart';
import '../Widgets/DoneWidget.dart';
import '../Widgets/OtpInpouts.dart';
import '../Widgets/ZoomImage.dart';

class DetailsPage extends StatefulWidget {
  final name;
  final imagePath;
  final nameCategres;
  final id;
  const DetailsPage({Key? key,required this.name,required this.id, required this.imagePath,required this.nameCategres}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int NumOreder = 0;
  var Content;
  ScreenUtil screenUtil =ScreenUtil();
  final favoriteController = Get.put(FavoriteController());
   String? imageUrl;
   String? name;
  Icon SuffixIcon = Icon(
    Icons.cancel,
    color: Colors.red,
    size: 32,
  );
   bool isloding=false;
   bool isLoding=false;
  final _formKey = GlobalKey<FormState>();
  final prodectDetailsController =     Get.put(ProdectDetailsController());
  final loginController =     Get.put(LoginController());
  TextEditingController phone=TextEditingController();
  String? phoneNumber;
  GetStorage box=GetStorage();
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
                  height: screenUtil.screenHeight *.37,
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
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            CustomPageRoute(child:ZoomImage(pathImage: imageUrl ?? widget.imagePath,)
                            )

                        );
                      },
                      child: Hero(
                        tag: 'tag_1',
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

                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                          child:IconButton(icon: Icon(Icons.arrow_back_rounded,color: AppTheme.primaryColor),
                            onPressed: () {
                            Navigator.pop(context);
                            },),
                          backgroundColor: Colors.white),
                      CircleAvatar(
                          child: CircleAvatar(
                              child: FavoriteButton(
                             iconSize: 40,
                                    isFavorite:favoriteController.favoriteList
                                        .where((element) =>
                                        element.id.toString().toLowerCase().contains(widget.id.toString()))
                                        .toList().length!=0?true:false,
                                iconDisabledColor: Colors.grey,
                                valueChanged: (_isFavorite) {
                                  print('Is Favorite $_isFavorite)');
                                  favoriteController.addFavorite(ProdectsModel(nameCategory: widget.nameCategres,image: widget.imagePath,name: widget.name,id: widget.id));
                                },
                              ),
                              backgroundColor: Colors.white),
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
                   return ListView.builder(
                       shrinkWrap: true,
                       scrollDirection: Axis.horizontal,
                       itemCount: controller.categoriesList.length,
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
                                                   name=controller.categoriesList[index].name;
                                                   imageUrl=controller.categoriesList[index].image;
                                                 });
                                         },
                                         child: FadeInImage.assetNetwork(
                                           placeholder:
                                           'assets/images/loading.png',
                                           image: '${controller.categoriesList[index].image}',
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
                                         ),
                                       ))),
                             ],
                           ),
                         );
                       }));
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
                      onPressed: () async{

                          prodectDetailsController.phoneAuth(
                              box.read('phoneNumber'), context, _formKey,
                              phone);


                      },
                      child: Text("اطلب الان",
                          style: TextStyle(color: AppTheme.secondaryColor,fontFamily: AppTheme.fontFamily,fontWeight: FontWeight.bold)
                      ),
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


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetStorage box=GetStorage();

    phoneNumber=box.read('phoneNumber');
  }
  }


