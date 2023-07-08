class ProdectsMode {
  dynamic image, name ;

  ProdectsMode({required this.name,required this.image,});

  factory ProdectsMode.fromJson(Map<String, dynamic> category) {
    return ProdectsMode(
      name: category['name'],
      image: category['image'],
    );
  }

  ProdectsMode fromJson(Map<String, dynamic> json) {
    return ProdectsMode.fromJson(json);
  }

  factory ProdectsMode.init() {
    return ProdectsMode(

      name: '',
      image:'',

    );
  }

  fromJsonList(List<dynamic> jsonList) {
    List<ProdectsMode> data = [];
    jsonList.forEach((post) {
      data.add(ProdectsMode.fromJson(post));
    });
    return data;
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'image':image,


  };
}
