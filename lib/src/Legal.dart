import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scrach_card/src/HomeMain.dart';
import 'package:scrach_card/src/LegalWebview.dart';

import '../color/MyColor.dart';
import '../model/ModelLogin.dart';
import '../model/model_otp.dart';
import '../session/Session.dart';
import '../src/controller/LoginController.dart';
import '../style/AppStyle.dart';
import '../utill/Constant.dart';
import '../utill/Utility.dart';
import 'controller/UpgradeController.dart';

class Legal extends StatelessWidget {

  int selectedOption = 0;

  bool isChecked = false;
  final controller = Get.put(UpgradeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Legal",style:
        TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back,color: Colors.black,), onPressed: () {
              Get.back();
          },
          ),),
        backgroundColor: Colors.white,
        body:  Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10,),
                  InkWell(onTap:() {
                    var arg= [
                      {"name": 'Legal Notice'},
                      {"url": 'https://softkwit.in/sex-positions/legal.html'}
                    ];
                    Get.to(LegalWebview(),arguments: arg);
                  },
                    child: Container(
                      width: double.maxFinite,
                      height: 40,
                      margin: EdgeInsets.only(left: 20,right: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: MyColor.gray2,width: 1),
                           // color: MyColor.golden
                        ),
                      child: Center(
                        child:   Text(
                          'Legal Notice',
                          style: TextStyle(color: MyColor.black,
                              fontSize: 16,letterSpacing: 1,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),
                  InkWell(onTap:() {
                    var arg= [
                      {"name": 'Privacy Policy'},
                      {"url": 'https://softkwit.in/sex-positions/privacy.html'}
                    ];
                    Get.to(LegalWebview(),arguments: arg);
                  },
                    child: Container(
                      width: double.maxFinite,
                      height: 40,
                      margin: EdgeInsets.only(left: 20,right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: MyColor.gray2,width: 1),
                        //color: Colors.black
                      ),
                      child: Center(
                        child:   Text(
                          'Privacy Policy',
                          style: TextStyle(color: MyColor.black,
                              fontSize: 16,letterSpacing: 1,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),
                  InkWell(onTap:() {
                    var arg= [
                      {"name": 'Term & Conditions'},
                      {"url": 'https://softkwit.in/sex-positions/term.html'}
                    ];
                    Get.to(LegalWebview(),arguments: arg);
                  },
                    child: Container(
                      width: double.maxFinite,
                      height: 40,
                      margin: EdgeInsets.only(left: 20,right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: MyColor.gray2,width: 1),
                        //color: Colors.black
                      ),
                      child: Center(
                        child:   Text(
                          'Term & Conditions',
                          style: TextStyle(color: MyColor.black,
                              fontSize: 16,letterSpacing: 1,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),
                  InkWell(onTap:() {
                    var arg= [
                      {"name": 'Disclaimer'},
                      {"url": 'https://softkwit.in/sex-positions/disclaimer.html'}
                    ];
                    Get.to(LegalWebview(),arguments: arg);
                  },
                    child: Container(
                      width: double.maxFinite,
                      height: 40,
                      margin: EdgeInsets.only(left: 20,right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: MyColor.gray2,width: 1),
                        //color: Colors.black
                      ),
                      child: Center(
                        child:   Text(
                          'Disclaimer',
                          style: TextStyle(color: MyColor.black,
                              fontSize: 16,letterSpacing: 1,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),


                  SizedBox(height: 20,),
                  InkWell(onTap:() {
                    var arg= [
                      {"name": 'Attribution'},
                      {"url": 'https://softkwit.in/sex-positions/attribution.html'}
                    ];
                    Get.to(LegalWebview(),arguments: arg);
                  },
                    child: Container(
                      width: double.maxFinite,
                      height: 40,
                      margin: EdgeInsets.only(left: 20,right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: MyColor.gray2,width: 1),
                        //color: Colors.black
                      ),
                      child: Center(
                        child:   Text(
                          'Attribution',
                          style: TextStyle(color: MyColor.black,
                              fontSize: 16,letterSpacing: 1,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),




                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void callAPI(BuildContext context) async
  {
    var param = {
      "username": sp.getEmail(),
    };
    //controller.login(param, context);
    final user = await controller.openLevel(param, context);
    if(user.status==1)
    {
      showToast(user.result!.status!,2);
      sp.setPaid(1);
      Get.to(HomeMain());
    }
    else
    {
      showToast(user.result!.status!,2);
    }
  }



}

