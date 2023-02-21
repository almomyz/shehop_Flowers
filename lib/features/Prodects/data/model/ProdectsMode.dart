class ProdectsMode {
  dynamic skills,id, name ,email,password,image,gender,number,city,location,price_from,price_to,section,level,subjects;

  ProdectsMode({required this.id,
    required this.name,required this.skills,required this.email,required this.password,this.image,this.city,this.gender,this.level,this.location,this.number,this.price_from,this.price_to,this.section,this.subjects});

  factory ProdectsMode.fromJson(Map<String, dynamic> category) {
    return ProdectsMode(id: category['id'],


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

  ProdectsMode fromJson(Map<String, dynamic> json) {
    return ProdectsMode.fromJson(json);
  }

  factory ProdectsMode.init() {
    return ProdectsMode(
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
    List<ProdectsMode> data = [];
    jsonList.forEach((post) {
      data.add(ProdectsMode.fromJson(post));
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
