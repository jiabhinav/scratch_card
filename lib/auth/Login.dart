import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrach_card/src/HomeMain.dart';

import '../color/MyColor.dart';
import '../model/model_login.dart';
import '../utill/Utility.dart';

class Login extends StatefulWidget {
  @override
  _LoginLayoutState createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<Login> {
  var count = 0.obs;
  late Future<ModelLogin> futureAlbum;
  // ModelOtp?_mdelLogin=null;
  ModelLogin?modelLogin=null;
  final textController_1 = TextEditingController();
  late  final textotp = TextEditingController();
  String otp="";
  @override

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: Colors.white,
        body:Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40.0,left: 10),
                  child: Container(
                      width: 150,
                      height: 150,
                      margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height*5/100),
                      /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                      child: Image.asset('assets/image/logo.png')),
                ),

                Container(
                  margin: const EdgeInsets.only(right: 12,top: 80),
                  width: double.maxFinite,
                  height: 80,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      prefixIcon: Icon(Icons.phone),
                      labelText: 'Phone Number',
                    ),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(right: 12,top: 20),
                  width: double.maxFinite,
                  height: 80,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                    ),
                  ),

                ),
                InkWell(
                  onTap:  () {
                   // Navigator.push(context, MaterialPageRoute(builder: (_) => ForgotPassword()));
                  },
                  child:  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.red, fontSize: 14,letterSpacing: 1),
                    ),
                  ),

                ),


                Container(
                  width: double.maxFinite,
                  height: 50,
                  margin: const EdgeInsets.only(left: 0.0,top: 60,right: 0),
                  decoration: BoxDecoration(
                      color: MyColor.appColor, borderRadius: BorderRadius.circular(6)),
                  child: TextButton(
                    onPressed: () {
                      count ++;

                      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeMain()));
                      /*  dialogBottomSheet();*/
                      //chechValiddation();
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 14,letterSpacing: 1),
                    ),
                  ),
                ),

              ],
            )
        )

    );
  }






}

