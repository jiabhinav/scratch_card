import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrach_card/color/MyColor.dart';

import '../model/model_login.dart';
import '../model/model_otp.dart';
import '../style/AppStyle.dart';
import '../utill/Utility.dart';

class Register extends StatefulWidget
{

  @override
  _Register createState()=>_Register();

}


 class _Register extends State<Register> {
   ModelOtp?_mdelLogin = null;
   ModelLogin?modelLogin = null;

   final businessname = TextEditingController();
   final businessaddress = TextEditingController();
   final businessemail = TextEditingController();
   final businessnumber = TextEditingController();

   final businessgst = TextEditingController();
   final businespincode = TextEditingController();


   late final textotp = TextEditingController();
   var otp = "";
   var typedoce = 1;

   File? _image = null;
   File?img_aadhar = null;
   var gsttext = "XXXXXXXXXX1212";
   var aadhartext = "XXXXXXX1234";


   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Register", style: TextStyle(color: Colors.black),),
         backgroundColor: Colors.white,
         elevation: 0,
         leading: new IconButton(
           icon: new Icon(Icons.arrow_back, color: Colors.black,),
           onPressed: () {},
         ),),
       backgroundColor: Colors.white,
       body: SingleChildScrollView(

         child: Container(
           margin: EdgeInsets.all(10),
           child: Column(
             children: <Widget>[


               Container(
                 margin: const EdgeInsets.only(top: 10),
                 width: double.maxFinite,
                 padding: const EdgeInsets.only(),
                 child: Text("Enter Your Details", style: TextStyle(
                     fontSize: 18, fontWeight: FontWeight.bold),),
               ),


               Container(
                 margin: const EdgeInsets.only(left: 2, top: 20),
                 width: double.maxFinite,
                 padding: const EdgeInsets.only(bottom: 2),
                 child: addressText("Full name"),
               ),
               Container(
                   width: double.maxFinite,
                   height: 42,
                   child: TextField(
                     keyboardType: TextInputType.text,
                     style: addressTextStyle(),
                     decoration: registerInputDecoration("Enter full name"),

                   )
               ),


               Container(
                 margin: const EdgeInsets.only(left: 2, top: 20),
                 width: double.maxFinite,
                 padding: const EdgeInsets.only(bottom: 2),
                 child: addressText("Email"),
               ),
               Container(
                   width: double.maxFinite,
                   height: 42,
                   child: TextField(
                     keyboardType: TextInputType.emailAddress,
                     style: addressTextStyle(),
                     decoration: registerInputDecoration("Enter email address"),

                   )
               ),


               Container(
                 margin: const EdgeInsets.only(left: 2, top: 20),
                 width: double.maxFinite,
                 padding: const EdgeInsets.only(bottom: 2),
                 child: addressText("Mobile number"),
               ),
               Container(
                   width: double.maxFinite,
                   height: 42,
                   child: TextField(

                     keyboardType: TextInputType.number,
                     style: addressTextStyle(),
                     maxLength: 10,
                     buildCounter: null,
                     decoration: registerInputDecoration("Mobile number"),

                   )
               ),




               Container(
                 width: double.maxFinite,
                 height: 40,
                 margin: const EdgeInsets.only(top: 30),
                 decoration: BoxDecoration(
                     color: MyColor.black,
                     borderRadius: BorderRadius.circular(6)),
                 child: TextButton(
                   onPressed: () {},
                   child: Text(
                     'Submit',
                     style: TextStyle(
                         color: MyColor.golden, fontSize: 14, letterSpacing: 1),
                   ),
                 ),
               ),
               Container(
                 width: double.maxFinite,
                 padding: const EdgeInsets.only(
                     left: 20, top: 10, right: 10, bottom: 5),
                 child: Text(
                   'If you have an account?Login here',
                   textAlign: TextAlign.left,
                   style: TextStyle(
                       color: Colors.black, fontWeight: FontWeight.w500),
                 ),
               ),
             ],
           ),
         ),

       ),
     );
   }


   loadSharedPrefs(ModelLogin modelLogin) {
     if (modelLogin != null) {
       if (modelLogin.code == 1) {
         print("userdata6666" + json.encode(modelLogin));
         // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => HomeMain()), (e) => false);
         //Navigator.push(context, MaterialPageRoute(builder: (_) => HomeMain()));
       }
       else {
         showToast(modelLogin.message!, 2);
       }
     }
   }
 }

   
 

