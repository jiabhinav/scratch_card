import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scrach_card/auth/Login.dart';
import 'package:scrach_card/model/ModelRegister.dart';
import 'package:scrach_card/model/ModelSucces.dart';
import '../../config/URLS.dart';
import '../../model/ModelLogin.dart';
import 'package:http/http.dart' as http;

import '../../utill/Utility.dart';

class LoginController extends GetxController {
  var count = 0;
  var modelRegsiter=ModelLogin().obs;
  var country="Select Country".obs;

  var isLoader=null;
  ModelLogin?modelLogin = null;
  ModelRegister?modelRegister = null;
  void setTab(int num) {
    count=num;
    update();
  }

  void loader(bool  isLoder)
  {
    isLoader=isLoder;
  }
  void setcountry(String count) => country.value = count;


  Future<ModelLogin> login(Object? params,BuildContext context) async {

    showLoader(context);
    final response = await http.post(
        Uri.parse(URLS.BASE_URL+'login-member-android'),
        body: params
    );

    debugPrint("responseis==>>>>" + jsonEncode(response.body));
    print(ModelLogin.fromJson(jsonDecode(response.body)));
    if (response.statusCode == 200) {
      Navigator.pop(context);
      final jsonResponse = json.decode(response.body);
      print(new ModelLogin.fromJson(jsonResponse));
      return new ModelLogin.fromJson(jsonResponse);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      Navigator.pop(context);
      throw Exception('Failed to create album.');
    }
  }

  Future<ModelRegister>register(BuildContext context,Object? params) async {

    showLoader(context);
    final response = await http.post(
        Uri.parse(URLS.BASE_URL+'register-member-android'),
        body: params
    );

    //debugPrint("responseis==>>>>" + jsonEncode(response.body));
    print(ModelRegister.fromJson(jsonDecode(response.body)));
    if (response.statusCode == 200) {
      Navigator.pop(context);
      final jsonResponse = json.decode(response.body);
      print(new ModelRegister.fromJson(jsonResponse));
      return new ModelRegister.fromJson(jsonResponse);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      Navigator.pop(context);
      throw Exception('Failed to create album.');
    }
  }
}