class OrderMode {
  dynamic Date_Order, name ,OrderN ,Order_Status,imgurl,note,phoneNumber,token;

  OrderMode({required this.Date_Order,
    required this.name,required this.imgurl,required this.note,required this.Order_Status,required this.OrderN,required this.phoneNumber,required this.token,
  });

  factory OrderMode.fromJson(Map<String, dynamic> order) {
    return OrderMode(

      name: order['name'],
      Order_Status: order['Order_Status'],
      note: order['note'],
      imgurl: order['imgurl'],
      Date_Order: order['Date_Order'],
      token: order['token'],
      phoneNumber: order['phoneNumber'],
      OrderN: order['OrderN'],



    );
  }

  OrderMode fromJson(Map<String, dynamic> json) {
    return OrderMode.fromJson(json);
  }

  factory OrderMode.init() {
    return OrderMode(
      Date_Order: '',
      name: '',
      imgurl: '',
      note:'',
      Order_Status:'',
      OrderN:'',
      phoneNumber:'',
      token:'',


    );
  }

  fromJsonList(List<dynamic> jsonList) {
    List<OrderMode> data = [];
    jsonList.forEach((post) {
      data.add(OrderMode.fromJson(post));
    });
    return data;
  }

  Map<String, dynamic> toJson() => {

    'Date_Order': Date_Order,
    'name': name,
    'imgurl':imgurl,
    'note':note,
    'Order_Status':Order_Status,
    'OrderN':OrderN,
    'phoneNumber':phoneNumber,
    'token':token,
  };
}
