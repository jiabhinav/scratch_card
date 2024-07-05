import 'dart:ui';

class ModelDashBoard {
  Payload? payload;
  int? type;
  ModelDashBoard( {
      this.payload,
      this.type,
      });
}

class Payload {
  List<Banners>? banners;
  List<Categories>? categories;
  List<Features>? features;

  Payload( {
      this.banners, 
      this.categories});
}

class Categories {
  int? categoryId;
  String? name;
  Color? color1;
  Color? color2;
  String? image;
  Categories( {
      this.categoryId, 
      this.name,
      this.color1,
      this.color2,
      this.image,
  });

}

class Features {
  int? id;
  String? title;
  String? image;

  Features( {
      this.id,
      this.title,
      this.image});
}

class Banners {
  int? bannerId;
  String? image;

  Banners( {
      this.bannerId, 
      this.image});

  Banners.fromJson(dynamic json) {
    bannerId = json['banner_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['banner_id'] = bannerId;
    map['image'] = image;
    return map;
  }

}