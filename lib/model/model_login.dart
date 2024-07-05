class ModelLogin {
  Payload? payload;
  String? message;
  String? errormessage;
  String? type;
  int? code;

  ModelLogin({
      this.payload, 
      this.message, 
      this.errormessage, 
      this.type, 
      this.code});

  ModelLogin.fromJson(dynamic json) {
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
  int? userId;
  String? email;
  int? phone;
  int? alternatePhone;
  String? businessName;
  String? businessOnwer;
  String? businessAddress;
  int? zipcode;
  String? gstNumber;
  String? panNumber;
  String? profileImage;
  String? token;

  Payload({
      this.userId, 
      this.email, 
      this.phone, 
      this.alternatePhone, 
      this.businessName, 
      this.businessOnwer, 
      this.businessAddress, 
      this.zipcode, 
      this.gstNumber, 
      this.panNumber, 
      this.profileImage, 
      this.token});

  Payload.fromJson(dynamic json) {
    userId = json['user_id'];
    email = json['email'];
    phone = json['phone'];
    alternatePhone = json['alternate_phone'];
    businessName = json['business_name'];
    businessOnwer = json['business_onwer'];
    businessAddress = json['business_address'];
    zipcode = json['zipcode'];
    gstNumber = json['gst_number'];
    panNumber = json['pan_number'];
    profileImage = json['profile_image'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['user_id'] = userId;
    map['email'] = email;
    map['phone'] = phone;
    map['alternate_phone'] = alternatePhone;
    map['business_name'] = businessName;
    map['business_onwer'] = businessOnwer;
    map['business_address'] = businessAddress;
    map['zipcode'] = zipcode;
    map['gst_number'] = gstNumber;
    map['pan_number'] = panNumber;
    map['profile_image'] = profileImage;
    map['token'] = token;
    return map;
  }

}