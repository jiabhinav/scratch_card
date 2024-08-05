import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scrach_card/auth/Login.dart';
import 'package:scrach_card/model/ModelGetLevel.dart';
import 'package:scrach_card/model/ModelRegister.dart';
import '../../config/URLS.dart';
import '../../model/ModelLogin.dart';
import 'package:http/http.dart' as http;

import '../../model/ModelSucces.dart';
import '../../model/model_dash_board.dart';
import '../../utill/Utility.dart';

class SexPossController extends GetxController {
  var count = 0;
  var isLoader=null;
  bool isLoading = true;

  int levelIndex=-1;
  int selectedIndex = -1;
  var modelDashboard=ModelDashBoard();
  ModelGetLevel?modelGetLevel = null;
  Levels? image=null;
  void setTab(int num) {
    count=num;
    update();
  }
  void setLevelImage(Levels? img) async {
    image=img;
    update();

  }

  void updateLevel(ModelGetLevel?modelGetLevel)
  {
    this.modelGetLevel=modelGetLevel;
    update();
  }


  void getLevel(Object? params,BuildContext context) async {

    final response = await http.post(
        Uri.parse(URLS.BASE_URL+'levels'),
        body: params
    );
    debugPrint("responseis==>>>>" + jsonEncode(response.body));
    print(ModelGetLevel.fromJson(jsonDecode(response.body)));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print(new ModelGetLevel.fromJson(jsonResponse));
      modelGetLevel= ModelGetLevel.fromJson(jsonResponse);
      image=modelGetLevel!.result!.levels![0];
      isLoading=false;
      update();
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  Future<ModelSucces> openLevel(Object? params,BuildContext context) async {

    showLoader(context);
    final response = await http.post(
        Uri.parse(URLS.BASE_URL+'open-level'),
        body: params
    );

    debugPrint("responseis==>>>>" + jsonEncode(response.body));
    print(ModelSucces.fromJson(jsonDecode(response.body)));
    if (response.statusCode == 200) {
      Navigator.pop(context);
      final jsonResponse = json.decode(response.body);
      //print(new ModelSucces.fromJson(jsonResponse));
      return new ModelSucces.fromJson(jsonResponse);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      Navigator.pop(context);
      throw Exception('Failed to create album.');
    }
  }



}