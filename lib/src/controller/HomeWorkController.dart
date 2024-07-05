import 'package:get/get.dart';
class HomeWorkController extends GetxController {
  var count = 0;
  void setTab(int num) {
    count=num;
    update();
  }
}