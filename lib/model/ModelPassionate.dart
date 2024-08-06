class ModelPassionate {
  int? _status;
  Result? _result;

  ModelPassionate({int? status, Result? result}) {
    if (status != null) {
      this._status = status;
    }
    if (result != null) {
      this._result = result;
    }
  }

  int? get status => _status;
  set status(int? status) => _status = status;
  Result? get result => _result;
  set result(Result? result) => _result = result;

  ModelPassionate.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    if (this._result != null) {
      data['result'] = this._result!.toJson();
    }
    return data;
  }
}

class Result {
  List<Places>? _places;

  Result({List<Places>? places}) {
    if (places != null) {
      this._places = places;
    }
  }

  List<Places>? get places => _places;
  set places(List<Places>? places) => _places = places;

  Result.fromJson(Map<String, dynamic> json) {
    if (json['places'] != null) {
      _places = <Places>[];
      json['places'].forEach((v) {
        _places!.add(new Places.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._places != null) {
      data['places'] = this._places!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Places {
  int? _place;
  String? _mainTag;
  List<Data>? _data;

  Places({int? place, String? mainTag, List<Data>? data}) {
    if (place != null) {
      this._place = place;
    }
    if (mainTag != null) {
      this._mainTag = mainTag;
    }
    if (data != null) {
      this._data = data;
    }
  }

  int? get place => _place;
  set place(int? place) => _place = place;
  String? get mainTag => _mainTag;
  set mainTag(String? mainTag) => _mainTag = mainTag;
  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;

  Places.fromJson(Map<String, dynamic> json) {
    _place = json['place'];
    _mainTag = json['main_tag'];
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['place'] = this._place;
    data['main_tag'] = this._mainTag;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? _open;
  String? _tag;

  Data({int? open, String? tag}) {
    if (open != null) {
      this._open = open;
    }
    if (tag != null) {
      this._tag = tag;
    }
  }

  int? get open => _open;
  set open(int? open) => _open = open;
  String? get tag => _tag;
  set tag(String? tag) => _tag = tag;

  Data.fromJson(Map<String, dynamic> json) {
    _open = json['open'];
    _tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['open'] = this._open;
    data['tag'] = this._tag;
    return data;
  }
}