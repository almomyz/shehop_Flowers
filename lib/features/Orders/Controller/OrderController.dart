
 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../data/model/OrderMode.dart';

class OrderController extends GetxController{

  List<OrderMode> orderList = [];
  Future<List<OrderMode>> getOrders() async {
    CollectionReference userref =
    FirebaseFirestore.instance.collection("قائمه الطلبات");

    var reponsbody = await userref.get();

    reponsbody.docs.forEach((element) {
      // print(element["imgurl"]);
      orderList.add(OrderMode(
          Date_Order: element['Date_Order'],
          token: element['token'],
          phoneNumber: element['phoneNumber'],
          OrderN: element['OrderN'],
          Order_Status: element['Order_Status'],
          note: element['note'],
          imgurl: element['imgurl'],
          name: element['name'],
      ));
    });
    print("*************************************************");
    print(orderList);
    print("*************************************************");
update();
 return orderList;
  }
  onSearch(String searchWord){
    if(searchWord==null||searchWord ==''){
      getOrders();
      update();
    }
    orderList = orderList
        .where((element) =>
        element.name.toLowerCase().contains(searchWord.toLowerCase()))
        .toList();
    print(orderList.length);
    update();
  }
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getOrders();
  }

}