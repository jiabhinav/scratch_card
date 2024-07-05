import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrach_card/src/HomeMain.dart';

import '../color/MyColor.dart';
import '../model/model_login.dart';
import '../model/model_otp.dart';
import '../style/AppStyle.dart';
import '../utill/Utility.dart';
import 'Register.dart';

class Login extends StatefulWidget {
  @override
  _LoginLayoutState createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<Login> {
  late Future<ModelLogin> futureAlbum;
  ModelOtp?_mdelLogin=null;
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
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  style: addressTextStyle(),
                  decoration: registerInputDecoration("Enter mobile number"),

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
                 // controller: textController_1,
                  keyboardType: TextInputType.visiblePassword,
                  maxLength: 10,
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
                    Navigator.push(
                     context, MaterialPageRoute(builder: (_) => HomeMain()));
                  chechValiddation();
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

  void dialogBottomSheet(String? code) {

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        builder: (context) {

          return FractionallySizedBox(
            heightFactor: 0.9,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: double.maxFinite,
                    height: 50,
                    margin: EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child:IconButton(icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),

                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 2),
                    child:Text(
                      'Enter 4 Digit OTP number',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(left: 10,top: 0,right: 10,bottom: 5),
                    child:Text(
                      'Please enter the OTP code we have sent to phone number '+textController_1.text,
                      textAlign: TextAlign.left,style: TextStyle(color: Colors.grey),
                    ),

                  ),
                  IntrinsicWidth(child:  TextField(
                    controller: textotp,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    minLines: 1,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                      letterSpacing: 12.0,
                    ),
                    decoration: InputDecoration(
                      hintText: '0000',
                      hintStyle: TextStyle(
                        letterSpacing: 12.0,
                      ),),

                  ),),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Reset OTP ",),
                        Padding(
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text('00:00', style: TextStyle(fontSize: 20))),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 40,
                    margin: const EdgeInsets.only(left: 20.0,top: 50,right: 20),
                    decoration: BoxDecoration(
                        color: MyColor.appColor, borderRadius: BorderRadius.circular(6)),
                    child: TextButton(
                        onPressed: () {

                        },
                        child: new TextButton(onPressed: () {
                          checkOtpCalidation(code!);
                        },  child: Text(
                          'SUBMIT OTP',
                          style: TextStyle(color: Colors.white, fontSize: 14,letterSpacing: 1),
                        ),

                        )

                    ),
                  ),
                ],
              ),
            ),
          );

        });
  }


  chechValiddation(){
    String text1;
    text1 = textController_1.text;
    //  print("userdata123" + Session().read());
    if(text1 == ''||text1.length<10)
    {
      showToast('Mobile Number must be of 10 digit',2);
    }

  }

  checkOtpCalidation(String Otp){
    String text1;
    text1 = textController_1.text;
    String otptext = textotp.text;
    if(otptext != Otp)
    {
      showToast('Incorrect OTP!!',2);
    }
    else
    {

    }

  }

  loadSharedPrefs(ModelLogin modelLogin) {

    if(modelLogin!=null)
    {
      if(modelLogin.code==1)
      {

      //  sp.save(modelLogin);
       // print("userdata6666"+ json.encode(modelLogin));
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => HomeMain()), (e) => false);
        //Navigator.push(context, MaterialPageRoute(builder: (_) => HomeMain()));
      }

    }

  }

}

