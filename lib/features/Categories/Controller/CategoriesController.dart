
 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shehop_flowers/features/Prodects/data/model/ProdectsModel.dart';

import '../data/model/CategoriesModel.dart';

class CategoriesController extends GetxController{
 List<ProdectsModel >categoriesList =[];
 List<ProdectsModel >newList =[];
 List<CategoriesModel >categories =[];

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
getdate(String collectionName)async{
   categoriesList.clear();
 print(collectionName);
 print('collectionName');
  var userref =
  FirebaseFirestore.instance.collection(collectionName).orderBy("entery_date", descending: true);
  var reponsbody = await userref.get();
  reponsbody.docs.forEach((element) {
    print(element["name"]);
    categoriesList.add(ProdectsModel(image: element["imgurl"], name: element["name"], nameCategory:element["nameCategory"] ,id: element["id"]));

  });
print(categoriesList.length);
  update();

}
getNew()async{
  var categories =
  FirebaseFirestore.instance.collection('الاقسام');
  var category = await categories.get();
  category.docs.forEach((element) async{
    var userref =
    FirebaseFirestore.instance.collection(element['name']).orderBy("id", descending: false);
    var reponsbody = await userref.get();
    reponsbody.docs.forEach((element) {
      newList.add(ProdectsModel(image: element["imgurl"], name: element["name"],nameCategory:element["nameCategory"] ,id: element["id"]));
    });
  });



  update();

}

getCategories()async{
  var userref =
  FirebaseFirestore.instance.collection('الاقسام');

  var reponsbody = await userref.get();
  reponsbody.docs.forEach((element) {
    categories.add(CategoriesModel(image: element['image'], name: element['name']));
  });


}


@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategories();
    getNew();
  }
}