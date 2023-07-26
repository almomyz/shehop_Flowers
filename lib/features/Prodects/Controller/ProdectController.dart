import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../data/model/ProdectsModel.dart';

class ProdectController extends GetxController{
  List<ProdectsModel> prodectList=[];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();



  }
  getProdect(String name)async{
   int id=1;
   print(name);
   print(' asdasdsdsadsadasdsa');
    var userref =
    FirebaseFirestore.instance.collection(name).orderBy("entery_date", descending: true);
    var reponsbody = await userref.get();
   reponsbody.docs.forEach((element) {
     prodectList.add(ProdectsModel(image: element["imgurl"], name: element["name"], nameCategory: '',id: id));
     id++;
   });
   update();
  }

  onSearch(String searchWord,String name){
    if(searchWord==null||searchWord ==''){
      getProdect(name);
      update();
    }
    prodectList = prodectList
        .where((element) =>
        element.name.toLowerCase().contains(searchWord.toLowerCase()))
        .toList();
       print(prodectList.length);
    update();
  }

}