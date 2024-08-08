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

class ScrachViewController extends GetxController {
  var count = 0;
  var isLoader=null;
  bool isLoading = true;
  bool skrach = false;
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

  void updateOpen(bool skrach)
  {
    this.skrach=skrach;
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

  getDashboard()
  {

    List<Banners> banner= [];
    var ban=Banners();
    ban.bannerId=1;
    ban.image="assets/image/banner1.png";
    banner.add(ban);

    List<Categories> category= [];
    var cat=Categories();
    cat.categoryId=1;
    cat.name="Level 1";
    cat.color1=const Color(0xFF1F1F1F);
    cat.color2=const Color(0xFF1F1F1F);
    cat.image="assets/icon/cat_fee_payment.svg";
    category.add(cat);

   /* var cat2=Categories();
    cat2.categoryId=2;
    cat2.name="Level 2";
    cat2.color1=const Color(0xFF94C2A9);
    cat2.color2=const Color(0xFF54B17F);
    cat2.image="assets/icon/cat_events.svg";
    category.add(cat2);

    var cat3=Categories();
    cat3.categoryId=3;
    cat3.name="Level 3";
    cat3.color1= Color(0xFF9030EB);
    cat3.color2= Color(0xFFB576F1);
    cat3.image="assets/icon/cat_leave.svg";
    category.add(cat3);

    var cat4=Categories();
    cat4.categoryId=3;
    cat4.name="Level 4";
    cat4.color1= Color(0xFFEC716E);
    cat4.color2= Color(0xFFDE908F);
    cat4.image="assets/icon/cat_complaint.svg";
    category.add(cat4);

    var cat5=Categories();
    cat5.categoryId=3;
    cat5.name="Level 5";
    cat5.color1= Color(0xFF629DF7);
    cat5.color2= Color(0xFF7C9AC9);
    cat5.image="assets/icon/complaint.svg";
    category.add(cat5);*/

    List<Features> features= [];
    var dr=Features();
    dr.id=1;
    dr.title="S*x Positions";
    dr.image="assets/icon/sex_poss.png";
    features.add(dr);

    var dr2=Features();
    dr2.id=2;
    dr2.title="Passionate Places";
    dr2.image="assets/icon/passion.png";
    features.add(dr2);

    var pro3=Features();
    pro3.id=3;
    pro3.title="Dirty Extras";
    pro3.image="assets/icon/no_eating.png";
    features.add(pro3);

    var pro4=Features();
    pro4.id=4;
    pro4.title="Love Lab";
    pro4.image="assets/icon/love.png";
    features.add(pro4);

    var pro5=Features();
    pro5.id=5;
    pro5.title="Erotic Sex Dice";
    pro5.image="assets/icon/erotic.png";
    features.add(pro5);

    var pro6=Features();
    pro6.id=6;
    pro6.title="Sensual Secrets";
    pro6.image="assets/icon/sensual.png";
    features.add(pro6);




    /*category.add(Categories(1,"Our Specialities","assets/image/banner1.png",product));
    category.add(Categories(2,"Top Doctors","assets/image/banner1.png",docter));*/

    var payload=Payload();
    payload.categories=category;
    payload.banners=banner;
    payload.features=features;
    modelDashboard.payload=payload;
    /*  var payload=Payload();
    modelDashboard=ModelDashBoard(payload,1);*/
    isLoading=false;
    print(modelDashboard);
    update();
  }

}