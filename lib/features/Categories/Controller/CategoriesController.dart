
 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController{


  Future<List<String>> get() async {
    List<String> imageList = [];
    CollectionReference userref =
    FirebaseFirestore.instance.collection("العروض");

    var reponsbody = await userref.get();

    reponsbody.docs.forEach((element) {
      // print(element["imgurl"]);
      imageList.add(element["imgurl"]);
    });
    print("*************************************************");
    print(imageList);
    print("*************************************************");

 return imageList.toList();
  }
getdate(String collectionName){

  CollectionReference userref2 = FirebaseFirestore.instance.collection(collectionName);
print(userref2.snapshots());
print('userref2.snapshots()');
  return userref2.snapshots();

}

}