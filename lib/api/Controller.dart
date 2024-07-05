
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

    var cat2=Categories();
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
    category.add(cat5);

    List<Features> features= [];
    var dr=Features();
    dr.title="S*x Positions";
    dr.image="assets/icon/Homework.svg";
    features.add(dr);

    var dr2=Features();
    dr2.title="Location";
    dr2.image="assets/icon/timetable.svg";
    features.add(dr2);

    var pro3=Features();
    pro3.title="Dirty Extras";
    pro3.image="assets/icon/attendance.svg";
    features.add(pro3);

    var pro4=Features();
    pro4.title="Squeeze,Lick or Suck";
    pro4.image="assets/icon/teachers.svg";
    features.add(pro4);

    var pro5=Features();
    pro5.title="Erotic Sex Dice";
    pro5.image="assets/icon/notice_board.svg";
    features.add(pro5);

    var pro6=Features();
    pro6.title="Sensural Secrets";
    pro6.image="assets/icon/exams.svg";
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