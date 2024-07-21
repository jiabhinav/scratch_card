
class ModelLogin {
  int? status;
  Result? result;

  ModelLogin({this.status, this.result});

  ModelLogin.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result'] != null ? Result?.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['result'] = result!.toJson();
    return data;
  }
}

class Result {
  String? status;
  String? name;
  String? username;
  String? email;
  String? phone;
  int? paid;
  int? points;

  Result({this.status, this.name, this.username, this.email, this.phone, this.paid, this.points});

  Result.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    paid = json['paid'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    data['paid'] = paid;
    data['points'] = points;
    return data;
  }
}

