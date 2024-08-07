class ModelSansual {
  int? status;
  Result? result;

  ModelSansual({this.status, this.result});

  ModelSansual.fromJson(Map<String, dynamic> json) {
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
  String? tag;

  Result({this.tag});

  Result.fromJson(Map<String, dynamic> json) {
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tag'] = this.tag;
    return data;
  }
}