import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scrach_card/auth/Login.dart';
import 'package:scrach_card/model/ModelGetLevel.dart';
import 'package:scrach_card/model/ModelRegister.dart';
import '../../config/URLS.dart';
import '../../model/ModelLogin.dart';
import 'package:http/http.dart' as http;

import '../../model/ModelSansual.dart';
import '../../model/ModelSucces.dart';
import '../../model/model_dash_board.dart';
import '../../utill/Utility.dart';

class SansualController extends GetxController {
  var count = 0;
  var isLoader=null;
  bool isLoading = true;
  bool isVisible=true;

  int levelIndex=-1;
  int selectedIndex = -1;
  ModelSansual ?modelGetLevel = null;
  Levels? image=null;
  void setTab(int num) {
    count=num;
    update();
  }
  void setLevelImage(Levels? img) async {
    image=img;
    update();

  }

  void setVisible(bool visible)
  {
    isVisible=visible;
    update();
  }

  void setLoader(bool isLoader)
  {
    isLoading=isLoader;
    update();
  }



  void updateLevel(ModelSansual ?modelGetLevel)
  {
    this.modelGetLevel=modelGetLevel;
    update();
  }


  void getLevel(Object? params,BuildContext context) async {
    setLoader(true);
    //setVisible(false);
    final response = await http.post(
        Uri.parse(URLS.BASE_URL+'sensual'),
        body: params
    );
    debugPrint("responseis==>>>>" + jsonEncode(response.body));
    print(ModelSansual.fromJson(jsonDecode(response.body)));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print(new ModelSansual.fromJson(jsonResponse));
      modelGetLevel= ModelSansual.fromJson(jsonResponse);
      isLoading=false;
      update();
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }



}