
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../auth/Login.dart';

class Splash extends StatefulWidget {
  @override
  _Splash createState() => _Splash();
}

class _Splash extends State<Splash> with SingleTickerProviderStateMixin  {

  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 2),
            () =>
            loadSharedPrefs());

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        // child: setCircleBackGround(120, 120.0,"assets/image/logo.png",MyColor.black)
          child: Image.asset("assets/image/logo.png", width: 150,))
    );
   // body: customContainer(Image.asset("assets/image/logo.png",height: 140.0, width: 140),context)
  }

  loadSharedPrefs() async {
   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => Login()), (e) => false);
    //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => IntroPage()), (e) => false);
  }



}