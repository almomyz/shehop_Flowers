class ProdectsModel {
  dynamic image, name,nameCategory,id ;

  ProdectsModel({required this.name,

    required this.image,
    required this.nameCategory,
    required this.id,

     });

  factory ProdectsModel.fromJson(Map<String, dynamic> category) {
    return ProdectsModel(
      name: category['name'],
id: category['id'],
      image: category['image'],
      nameCategory: category['nameCategory'],
    );
  }

  ProdectsModel fromJson(Map<String, dynamic> json) {
    return ProdectsModel.fromJson(json);
  }

  factory ProdectsModel.init() {
    return ProdectsModel(

      name: '',
      image:'',
id:'',
      nameCategory:'',

    );
  }

  fromJsonList(List<dynamic> jsonList) {
    List<ProdectsModel> data = [];
    jsonList.forEach((post) {
      data.add(ProdectsModel.fromJson(post));
    });
    return data;
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'image':image,
    'nameCategory':nameCategory,
    'id':id,


  };
}
