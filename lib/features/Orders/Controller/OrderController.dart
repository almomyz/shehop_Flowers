
 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/model/OrderMode.dart';



class OrderController extends GetxController{
  GetStorage box=GetStorage();

  List<OrderModel> orderList = [];
  Future<List<OrderModel>> getOrders() async {
    var userref =
    FirebaseFirestore.instance.collection("قائمه الطلبات").where('phoneNumber',isEqualTo: '776661971',);

    var reponsbody = await userref.get();

    reponsbody.docs.forEach((element) {
      // print(element["imgurl"]);
      orderList.add(OrderModel(
          count_order:3 ,
          id: 1,
          Date_Order: element['Date_Order'],
          token: element['token'],
          phoneNumber: element['phoneNumber'],
          OrderN: element['OrderN'],
          Order_Status: element['Order_Status'],
          note: element['note'],
          imgurl: element['imgurl'],
          name: element['name'],
          nameCategres:'' ,
          typeOrder: '' ,

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
  addOrder(OrderModel orderModel){
    var userref =
    FirebaseFirestore.instance.collection("قائمه الطلبات");
    userref.add(
      {
        'count_order':orderModel.count_order,
        'phoneNumber':orderModel.phoneNumber,
        'name':orderModel.name,
        'Date_Order':orderModel.Date_Order,
        'OrderN':orderModel.OrderN,
        'note':orderModel.note,
        'Order_Status':orderModel.Order_Status,
        'imgurl':orderModel.imgurl,
        'id':orderModel.id,
        'nameCategres':orderModel.nameCategres,
        'token':orderModel.token,
        'typeOrder':orderModel.typeOrder,

      }

    );
  }
  send_Order(OrderModel orderModel){
    var userref =
    FirebaseFirestore.instance.collection("قائمه الطلبات");
    userref.add(
      {
        'count_order':orderModel.count_order,
        'phoneNumber':orderModel.phoneNumber,
        'name':orderModel.name,
        'Date_Order':orderModel.Date_Order,
        'OrderN':orderModel.OrderN,
        'note':orderModel.note,
        'Order_Status':orderModel.Order_Status,
        'imgurl':orderModel.imgurl,
        'id':orderModel.id,
        'nameCategres':orderModel.nameCategres,
        'token':orderModel.token,
        'typeOrder':orderModel.typeOrder,

  }
    );
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getOrders();
  }

}