class CategoriesMode {
  dynamic skills,id, name ,email,password,image,gender,number,city,location,price_from,price_to,section,level,subjects;

  CategoriesMode({required this.id,
    required this.name,required this.skills,required this.email,required this.password,this.image,this.city,this.gender,this.level,this.location,this.number,this.price_from,this.price_to,this.section,this.subjects});

  factory CategoriesMode.fromJson(Map<String, dynamic> category) {
    return CategoriesMode(id: category['id'],


      name: category['name'],
      skills: category['skills'],
      email: category['email'],
      password: category['password'],
      image: category['image'],
      gender: category['gender'],
      number: category['number'],
      location: category['location'],
      price_from: category['price_from'],
      price_to: category['price_to'],
      section: category['section'],
      level: category['level'],
      subjects: category['subjects'],



    );
  }

  CategoriesMode fromJson(Map<String, dynamic> json) {
    return CategoriesMode.fromJson(json);
  }

  factory CategoriesMode.init() {
    return CategoriesMode(
      id: '',
      name: '',
      skills: '',
      email:'',
      password:'',
      image:'',
      gender:'',
      number:'',
      location:'',
      price_from:'',
      price_to:'',
      section:'',
      level:'',
      subjects:'',

    );
  }

  fromJsonList(List<dynamic> jsonList) {
    List<CategoriesMode> data = [];
    jsonList.forEach((post) {
      data.add(CategoriesMode.fromJson(post));
    });
    return data;
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name,


    'password':password,
    'image':image,
    'skills':skills,
    'gender':gender,
    'number':number,
    'location':location,
    'price_from':price_from,
    'price_to':price_to,
    'section':section,
    'level':level,
    'subjects':subjects,


  };
}
