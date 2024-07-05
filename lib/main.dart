import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:scrach_card/src/splash.dart';

import 'color/MyColor.dart';

void main() {
  runApp(GetMaterialApp(
      title: 'Candle Trade',
      debugShowCheckedModeBanner: false,
      home: Splash(),
      routes: <String, WidgetBuilder>{
        // "/AddressList": (BuildContext context) => new AddressList(),
      }
  ));
}

