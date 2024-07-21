
import 'dart:developer';
import 'dart:ui';
import 'package:get/get.dart';
import '../model/model_dash_board.dart';

class Controller extends GetxController {
  var count = 0;
  var countdown="10";

  bool isLoading = true;
  String data = '';

   var modelDashboard=ModelDashBoard();
  void increment() {
    count++;
    update();
  }

  void countDown(String timer) {
    countdown=timer;
    update();
  }

  /*void getDashboard(ModelDashBoard model) {
    modelDashboard=model;
    update();
  }*/




  callAPI()
  {
   /* FutureBuilder(
      future: ApiCaller().fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text('FutureBuilder: ${snapshot.data}');
        } else {
          return CircularProgressIndicator();
        }
      },
    ),*/
  }




}