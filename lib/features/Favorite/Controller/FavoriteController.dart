
 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shehop_flowers/features/Orders/data/model/OrderMode.dart';
import 'package:shehop_flowers/features/Prodects/data/model/ProdectsModel.dart';

class FavoriteController extends GetxController{
  List<ProdectsModel> favoriteList = [];
  GetStorage box=GetStorage();

 getFavorite() async {

List<dynamic?> list=box.read('Favorite');
if( list?.isNotEmpty??true){
list?.forEach((element) {
   print(element);
   favoriteList.add(ProdectsModel(image: element['image'], name: element['name'],nameCategory: element['nameCategory'],id:element['id'] ));
 });
}
else{
  print('list is empty');
}
 update();

  }
 removeFavorite(int index) {
   favoriteList.removeAt(index);
   print(favoriteList.length);
   var dd=  box.write('Favorite', favoriteList);
   print(dd);
   update();
 }
 onSearch(String searchWord){
    if(searchWord ==''){
      getFavorite();
      update();
    }
    favoriteList = favoriteList
        .where((element) =>
        element.name.toLowerCase().contains(searchWord.toLowerCase()))
        .toList();
    print(favoriteList.length);
    update();
  }
 addFavorite(ProdectsModel?  prodectsModel){
   List<dynamic?> list=box.read('Favorite');
   if(list?.isNotEmpty ?? true&&list?.length !=null ){
     favoriteList.clear();
          print(list);
      list.forEach((element) {
        favoriteList.add(ProdectsModel(id:element['id'],image: element['image'], name: element['name'],nameCategory: element['nameCategory']));

      });

   }
   else{
     print('list is empty');
   }
   favoriteList.add(prodectsModel!);
   box.write('Favorite',favoriteList);
   update();

 }

foundFavorite(String id){


}
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFavorite();
  }
}