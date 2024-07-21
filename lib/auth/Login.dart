import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrach_card/src/HomeMain.dart';
import 'package:scrach_card/src/Welcome_Terms.dart';

import '../color/MyColor.dart';
import '../model/ModelLogin.dart';
import '../model/model_otp.dart';
import '../session/Session.dart';
import '../src/controller/LoginController.dart';
import '../style/AppStyle.dart';
import '../utill/Utility.dart';
import 'Register.dart';

class Login extends StatelessWidget {
  late Future<ModelLogin> futureAlbum;
  ModelOtp?_mdelLogin=null;
  ModelLogin?modelLogin=null;
  final textController_1 = TextEditingController();
  late  final textPassword = TextEditingController();
  final controller = Get.put(LoginController());
  String otp="";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login",style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back,color: Colors.black,), onPressed: () {
        },
        ),),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                child: Container(
                    width: 120,
                    height: 120,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/image/logo.png')),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 10),
              width: double.maxFinite,
              padding: const EdgeInsets.only(left: 10,top: 0,right: 10,bottom: 2),
              child:Text(
                'Enter mobile number',
                textAlign: TextAlign.left,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 12,right: 12),
                width: double.maxFinite,
                height: 80,
                child: TextField(
                  controller: textController_1,
                  maxLength: 50,
                  style: addressTextStyle(),
                  decoration: registerInputDecoration("Enter registered email"),

                )
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              width: double.maxFinite,
              padding: const EdgeInsets.only(left: 10,top: 0,right: 10,bottom: 2),
              child:Text('Password',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            ),
            Container(
                margin: const EdgeInsets.only(left: 12,right: 12),
                width: double.maxFinite,
                height: 80,
                child: TextField(
                  controller: textPassword,
                  keyboardType: TextInputType.visiblePassword,
                  maxLength: 20,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  style: addressTextStyle(),
                  decoration: registerInputDecoration("Enter password"),

                )
            ),

            Container(
              width: double.maxFinite,
              height: 50,
              margin: const EdgeInsets.only(left: 20.0,top: 30,right: 20),
              decoration: BoxDecoration(
                  color: MyColor.black, borderRadius: BorderRadius.circular(6)),
              child: TextButton(
                onPressed: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (_) => HomeMain()));
                  chechValiddation(context);
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: MyColor.golden, fontSize: 14,letterSpacing: 1),
                ),
              ),
            ),InkWell(
              child:  Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(left: 20,top: 10,right: 10,bottom: 5),
                child:Text(
                  'New User? Create Account',
                  textAlign: TextAlign.left,style: TextStyle(color: Colors.black),
                ),
              ),
              onTap: ()=>{
                Navigator.push(context, MaterialPageRoute(builder: (_) => Register()))
              },
            )

          ],
        ),
      ),
    );
  }


  chechValiddation(BuildContext context){
    String text1 = textController_1.text;
    String otptext = textPassword.text;
    if(text1.isEmpty)
    {
      showToast('Enter 10 Digit mobile number',2);
    }
    else if(otptext.isEmpty)
    {
      showToast('Enter Password',2);
    }
    else
    {
      login(context);
    }

  }


  void login(BuildContext context) async
  {
    var param = {
      "username": textController_1.text,
      "password": textPassword.text,
    };
    //controller.login(param, context);
    final user = await controller.login(param, context);
    if(user.status==1)
      {
        showToast(user.result!.status!,2);
        sp.save(user);
        //Get.to(HomeMain());
        if(user.result!.paid==0)
        Get.to(Welcome_Terms());
        else
          Get.to(HomeMain());
        //loadSharedPrefs(user);
      }
    else
      {
        showToast(user.result!.status!,2);
      }
  }



}

