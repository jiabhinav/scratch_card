import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scrach_card/auth/Login.dart';
import '../../config/URLS.dart';
import '../../model/model_login.dart';
import 'package:http/http.dart' as http;

import '../../utill/Utility.dart';

class LoginController extends GetxController {
  var count = 0;
  var modelRegsiter=ModelLogin().obs;
  var isLoader=null;
  ModelLogin?modelRegister = null;
  void setTab(int num) {
    count=num;
    update();
  }

  void loader(bool  isLoder)
  {
    isLoader=isLoder;
  }



  void register(BuildContext context,Object? params) async {

    showLoader(context);
    final response = await http.post(
        Uri.parse(URLS.BASE_URL+'register-member-android'),
        body: params
    );

    debugPrint("responseis==>>>>" + jsonEncode(response.body));
    print(ModelLogin.fromJson(jsonDecode(response.body)));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print(new ModelLogin.fromJson(jsonResponse));

      modelRegister=new ModelLogin.fromJson(jsonResponse);

      if (response.statusCode == 200) {
        Get.to(() => Login());
        Get.snackbar("",modelRegister!.message!);
        Navigator.pop(context);
      } else {
        Navigator.pop(context);
        Get.snackbar("",modelRegister!.message!);
      }
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      Navigator.pop(context);
      throw Exception('Failed to create album.');
    }
  }
}