class ModelLogin {
  ModelLogin({
      num? status, 
      Result? result,}){
    _status = status;
    _result = result;
}

  ModelLogin.fromJson(dynamic json) {
    _status = json['status'];
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
  num? _status;
  Result? _result;
ModelLogin copyWith({  num? status,
  Result? result,
}) => ModelLogin(  status: status ?? _status,
  result: result ?? _result,
);
  num? get status => _status;
  Result? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    return map;
  }

}

class Result {
  Result({
      String? status,}){
    _status = status;
}

  Result.fromJson(dynamic json) {
    _status = json['status'];
  }
  String? _status;
Result copyWith({  String? status,
}) => Result(  status: status ?? _status,
);
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    return map;
  }

}