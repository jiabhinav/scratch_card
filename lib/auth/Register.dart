import 'dart:convert';
import 'dart:io';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrach_card/auth/Login.dart';
import 'package:scrach_card/color/MyColor.dart';
import 'package:scrach_card/src/controller/LoginController.dart';

import '../model/ModelLogin.dart';
import '../model/model_otp.dart';
import '../style/AppStyle.dart';
import '../utill/Utility.dart';


 class Register extends StatelessWidget {
   ModelOtp?_mdelLogin = null;
   ModelLogin?modelLogin = null;
   final controller = Get.put(LoginController());

   final textName = TextEditingController();
   final textEmail = TextEditingController();
   final textMobile = TextEditingController();
   final textPassword = TextEditingController();

   final textConfirm = TextEditingController();
   final textCountry = TextEditingController();
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
                     controller: textName,
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
                     controller: textEmail,
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
                     controller: textMobile,
                     keyboardType: TextInputType.number,
                     style: addressTextStyle(),
                     maxLength: 10,
                     buildCounter: null,
                     decoration: registerInputDecoration("Mobile number"),

                   )
               ),

               Container(
                 margin: const EdgeInsets.only(left: 2, top: 20),
                 width: double.maxFinite,
                 padding: const EdgeInsets.only(bottom: 2),
                 child: addressText("Password"),
               ),
               Container(
                   width: double.maxFinite,
                   height: 42,
                   child: TextField(
                     controller: textPassword,
                     style: addressTextStyle(),
                     maxLength: 10,
                     buildCounter: null,
                       obscureText: true,
                       enableSuggestions: false,
                       autocorrect: false,
                     decoration: registerInputDecoration("Enter Password"),

                   )
               ),


               Container(
                 margin: const EdgeInsets.only(left: 2, top: 20),
                 width: double.maxFinite,
                 padding: const EdgeInsets.only(bottom: 2),
                 child: addressText("Confirm Password"),
               ),
               Container(
                   width: double.maxFinite,
                   height: 42,
                   child: TextField(
                     controller: textConfirm,
                     style: addressTextStyle(),
                     maxLength: 10,
                     buildCounter: null,
                       obscureText: true,
                       enableSuggestions: false,
                       autocorrect: false,
                     decoration: registerInputDecoration(
                         "Enter Confirm Password"),

                   )
               ),

               Container(
                 margin: const EdgeInsets.only(left: 2, top: 20),
                 width: double.maxFinite,
                 padding: const EdgeInsets.only(bottom: 2),
                 child: addressText("Country"),
               ),
               InkWell(
                 onTap: (){
                   showCountryPicker(
                     context: context,
                     countryListTheme: CountryListThemeData(
                       flagSize: 25,
                       backgroundColor: Colors.white,
                       textStyle: TextStyle(fontSize: 18, color: Colors.blueGrey),
                       bottomSheetHeight: 500, // Optional. Country list modal height
                       //Optional. Sets the border radius for the bottomsheet.
                       borderRadius: BorderRadius.only(
                         topLeft: Radius.circular(20.0),
                         topRight: Radius.circular(20.0),
                       ),
                       //Optional. Styles the search field.
                       inputDecoration: InputDecoration(
                         labelText: 'Search',
                         hintText: 'Start typing to search',
                         prefixIcon: const Icon(Icons.search),
                         border: OutlineInputBorder(
                           borderSide: BorderSide(
                             color: const Color(0xFF8C98A8).withOpacity(0.2),
                           ),
                         ),
                       ),
                     ),
                     onSelect: (Country country) =>
                     /*print('Select country: ${country.displayName}'),*/
                       controller.setcountry(country.name)
                   );
                 },
                   child: Container(
                     padding: EdgeInsets.only(left: 10),
                       width: double.maxFinite,
                       height: 42,
                       decoration: setBoxAllOuterBorder(MyColor.textFeildBorder, 10),
                       child: Align(
                           alignment: Alignment.centerLeft,
                           child: Obx(() => Text('${controller.country.value}'))),
                   ),

               ),

               Container(
                 width: double.maxFinite,
                 height: 40,
                 margin: const EdgeInsets.only(top: 30),
                 decoration: BoxDecoration(
                     color: MyColor.black,
                     borderRadius: BorderRadius.circular(6)),
                 child: TextButton(
                   onPressed: () {
                     chechValiddation(context);
                   },
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
                   'If you have an account? Login here',
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


   chechValiddation(BuildContext context){

     if(textName.text.isEmpty)
     {
       showToast('Enter full name',2);
     }
     else if(textEmail.text.isEmpty)
     {
       showToast('Enter email',2);
     }

     else if(textMobile.text.isEmpty)
     {
       showToast('Enter 10 digit mobile number',2);
     }
     else if(textPassword.text.isEmpty)
     {
       showToast('Enter password',2);
     }
     else if(textConfirm.text.isEmpty)
     {
       showToast('Enter confirm-password',2);
     }
     else if(controller.country=="Select Country")
     {
       showToast('Select Country',2);
     }

     else
     {
       submit(context);
     }

   }


   submit(BuildContext context) async
   {
     var param = {
       "name": textName.text,
       "email": textEmail.text,
       "mobile": textMobile.text,
       "password": textPassword.text,
       "c_password": textConfirm.text,
       "country": controller.country.value,

     };
     final user = await controller.register(context, param);
     if (user.status == 1) {
       showToast(user.result!.status!, 2);
       Get.to(Login());
     }
     else {
       showToast(user.result!.status!, 2);
     }
   }


 }
