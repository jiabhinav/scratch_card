class ModelDirtExtras {
  int? status;
  Result? result;

  ModelDirtExtras({this.status, this.result});

  ModelDirtExtras.fromJson(Map<String, dynamic> json) {
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
  List<Dirtys>? dirtys;

  Result({this.dirtys});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['dirtys'] != null) {
      dirtys = <Dirtys>[];
      json['dirtys'].forEach((v) {
        dirtys!.add(new Dirtys.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dirtys != null) {
      data['dirtys'] = this.dirtys!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dirtys {
  int? dirty;
  String? mainTag;
  List<Data>? data;

  Dirtys({this.dirty, this.mainTag, this.data});

  Dirtys.fromJson(Map<String, dynamic> json) {
    dirty = json['dirty'];
    mainTag = json['main_tag'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dirty'] = this.dirty;
    data['main_tag'] = this.mainTag;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? open;
  String? tag;

  Data({this.open, this.tag});

  Data.fromJson(Map<String, dynamic> json) {
    open = json['open'];
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['open'] = this.open;
    data['tag'] = this.tag;
    return data;
  }
}