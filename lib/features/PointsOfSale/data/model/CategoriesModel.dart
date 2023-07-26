class PointsOfSaleModel {
  dynamic  name ,image,phoneNumber,address;

  PointsOfSaleModel({required this.image,
    required this.name,
    required this.phoneNumber,
    required this.address
    });

  factory PointsOfSaleModel.fromJson(Map<String, dynamic> category) {
    return PointsOfSaleModel(image: category['image'],


      name: category['name'],
      address: category['address'],
      phoneNumber: category['phoneNumber'],


    );
  }

  PointsOfSaleModel fromJson(Map<String, dynamic> json) {
    return PointsOfSaleModel.fromJson(json);
  }

  factory PointsOfSaleModel.init() {
    return PointsOfSaleModel(
      image: '',
      name: '',
      phoneNumber: '',
      address: '',


    );
  }

  fromJsonList(List<dynamic> jsonList) {
    List<PointsOfSaleModel> data = [];
    jsonList.forEach((post) {
      data.add(PointsOfSaleModel.fromJson(post));
    });
    return data;
  }

  Map<String, dynamic> toJson() => {

    'image': image,
    'name': name,
    'address': address,
    'phoneNumber': phoneNumber,


  };
}
