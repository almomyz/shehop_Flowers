class CategoriesModel {
  dynamic  name ,image;

  CategoriesModel({required this.image,required this.name
    });

  factory CategoriesModel.fromJson(Map<String, dynamic> category) {
    return CategoriesModel(image: category['image'],


      name: category['name'],


    );
  }

  CategoriesModel fromJson(Map<String, dynamic> json) {
    return CategoriesModel.fromJson(json);
  }

  factory CategoriesModel.init() {
    return CategoriesModel(
      image: '',
      name: '',
     

    );
  }

  fromJsonList(List<dynamic> jsonList) {
    List<CategoriesModel> data = [];
    jsonList.forEach((post) {
      data.add(CategoriesModel.fromJson(post));
    });
    return data;
  }

  Map<String, dynamic> toJson() => {'image': image, 'name': name,


  };
}
