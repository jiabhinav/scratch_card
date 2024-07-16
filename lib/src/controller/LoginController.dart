import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../config/URLS.dart';
import '../../model/model_login.dart';
import '../../utill/Utility.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  var count = 0;
  void setTab(int num) {
    count=num;
    update();
  }


  Future<ModelLogin> login(BuildContext context,Object? params) async {

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
      Navigator.pop(context);
      return new ModelLogin.fromJson(jsonResponse);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      Navigator.pop(context);
      throw Exception('Failed to create album.');
    }
  }
}