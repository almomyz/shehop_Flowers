import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../data/model/ProdectsMode.dart';

class ProdectController extends GetxController{
  List<ProdectsMode> prodectList=[];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getProdect();

  }
  getProdect()async{
    CollectionReference userref =
    FirebaseFirestore.instance.collection("NEWS");
    var reponsbody = await userref.get();
   reponsbody.docs.forEach((element) {
     prodectList.add(ProdectsMode(image: element["imgurl"], name: element["name"]));
   });
  }

}