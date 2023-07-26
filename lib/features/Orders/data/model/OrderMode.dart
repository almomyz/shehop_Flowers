class OrderModel {
  dynamic Date_Order, name ,OrderN ,Order_Status,imgurl,note,phoneNumber,token,nameCategres,typeOrder,id,count_order;

  OrderModel({
    required this.Date_Order,
    required this.nameCategres,
    required this.typeOrder,
    required this.count_order,
    required this.id,

    required this.name,required this.imgurl,required this.note,required this.Order_Status,required this.OrderN,required this.phoneNumber,required this.token,
  });

  factory OrderModel.fromJson(Map<String, dynamic> order) {
    return OrderModel(

      name: order['name'],
      typeOrder: order['typeOrder'],
      id: order['id'],
      count_order: order['count_order'],
      Order_Status: order['Order_Status'],
      note: order['note'],
      imgurl: order['imgurl'],
      Date_Order: order['Date_Order'],
      token: order['token'],
      phoneNumber: order['phoneNumber'],
      nameCategres: order['nameCategres'],
      OrderN: order['OrderN'],



    );
  }

  OrderModel fromJson(Map<String, dynamic> json) {
    return OrderModel.fromJson(json);
  }

  factory OrderModel.init() {
    return OrderModel(
      Date_Order: '',
      count_order: '',
      name: '',
      typeOrder: '',
      imgurl: '',
      note:'',
      Order_Status:'',
      OrderN:'',
      phoneNumber:'',
      token:'',
      id:'',
      nameCategres:'',


    );
  }

  fromJsonList(List<dynamic> jsonList) {
    List<OrderModel> data = [];
    jsonList.forEach((post) {
      data.add(OrderModel.fromJson(post));
    });
    return data;
  }

  Map<String, dynamic> toJson() => {

    'Date_Order': Date_Order,
    'name': name,
    'imgurl':imgurl,
    'note':note,
    'typeOrder':typeOrder,
    'count_order':count_order,
    'Order_Status':Order_Status,
    'OrderN':OrderN,
    'phoneNumber':phoneNumber,
    'token':token,
    'nameCategres':nameCategres,
    'id':id,
  };
}
