class ModelOtp {
  Payload? payload;
  String? message;
  String? errormessage;
  String? type;
  int? code;

  ModelOtp({
      this.payload, 
      this.message, 
      this.errormessage, 
      this.type, 
      this.code});

  ModelOtp.fromJson(dynamic json) {
    payload = json['payload'] != null ? Payload.fromJson(json['payload']) : null;
    message = json['message'];
    errormessage = json['errormessage'];
    type = json['type'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (payload != null) {
      map['payload'] = payload?.toJson();
    }
    map['message'] = message;
    map['errormessage'] = errormessage;
    map['type'] = type;
    map['code'] = code;
    return map;
  }

}

class Payload {
  int? phone;
  int? otp;

  Payload({
      this.phone, 
      this.otp});

  Payload.fromJson(dynamic json) {
    phone = json['phone'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['phone'] = phone;
    map['otp'] = otp;
    return map;
  }

}