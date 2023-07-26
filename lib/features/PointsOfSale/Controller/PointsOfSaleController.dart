import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../data/model/CategoriesModel.dart';

class PointsOfSaleController extends GetxController{
  GetStorage box=GetStorage();

  List<PointsOfSaleModel> PointsOfSaleList = [];
  Future<List<PointsOfSaleModel>> getPointsOfSales() async {
    var userref =
    FirebaseFirestore.instance.collection("المحلات");
    var reponsbody = await userref.get();
    reponsbody.docs.forEach((element) {
      // print(element["imgurl"]);
      PointsOfSaleList.add(PointsOfSaleModel(
         name:element["name"] ,
         image: element["image"],
         address: element["address"],
         phoneNumber: element["phoneNumber"],
      ));
    });
    print("*************************************************");
    print(PointsOfSaleList);
    print("*************************************************");
update();
 return PointsOfSaleList;
  }


  onSearch(String searchWord){
    PointsOfSaleList.clear();
    if(searchWord==null||searchWord ==''){
      getPointsOfSales();
      update();
    }
    PointsOfSaleList = PointsOfSaleList
        .where((element) =>
        element.name.toLowerCase().contains(searchWord.toLowerCase()))
        .toList();
    print(PointsOfSaleList.length);
    update();
  }



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPointsOfSales();
  }

}