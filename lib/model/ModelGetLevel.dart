class ModelGetLevel {
  int? status;
  Result? result;

  ModelGetLevel({this.status, this.result});

  ModelGetLevel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  List<Levels>? levels;

  Result({this.levels});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['levels'] != null) {
      levels = <Levels>[];
      json['levels'].forEach((v) {
        levels!.add(new Levels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.levels != null) {
      data['levels'] = this.levels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Levels {
  int? level;
  String? tag;
  List<Image>? image;

  Levels({this.level,this.tag, this.image});

  Levels.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    tag = json['tag'];
    if (json['image'] != null) {
      image = <Image>[];
      json['image'].forEach((v) {
        image!.add(new Image.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level'] = this.level;
    data['tag'] = this.tag;
    if (this.image != null) {
      data['image'] = this.image!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Image {
  String? image;
  int? open;
  String? title;
  String? descrition;

  Image({this.image, this.open,this.title,this.descrition});

  Image.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    open = json['open'];
    title = json['title'];
    descrition = json['descrition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['open'] = this.open;
    data['title'] = this.title;
    data['descrition'] = this.descrition;

    return data;
  }
}
