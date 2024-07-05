import 'package:get/get.dart';
class FeePaymentController extends GetxController {
  var count = 0;
  void setTab(int num) {
    count=num;
    update();
  }
}