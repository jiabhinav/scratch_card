import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scrach_card/src/HomeMain.dart';

import '../color/MyColor.dart';
import '../model/ModelLogin.dart';
import '../model/model_otp.dart';
import '../session/Session.dart';
import '../src/controller/LoginController.dart';
import '../style/AppStyle.dart';
import '../utill/Constant.dart';
import '../utill/Utility.dart';
import 'controller/UpgradeController.dart';

class UpgradeMessage extends StatelessWidget {

  int selectedOption = 0;

  bool isChecked = false;
  final controller = Get.put(UpgradeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Upgrade",style:
        TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back,color: Colors.black,), onPressed: () {
          },
          ),),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                  child: Image.asset("assets/image/sexx_icon.jpg", width: 150,)),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "New ideas\nbetter love life",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: MyColor.black,fontSize: 24,
                          fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "Get unlimited access to the hottest and most exciting game for couples.Unlock all game in 6 categories for maximum variety and fun",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: MyColor.black,fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20,),
                      Row(
                          children: <Widget>[
                            SvgPicture.asset("assets/icon/tick2.svg",
                                fit: BoxFit.scaleDown,width: 28,height: 28,),
                            SizedBox(width: 5,),
                            Text(
                              "Access to 1000+ Challenges",
                              textAlign: TextAlign.left,
                              style: TextStyle(color: MyColor.textcolor1,fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ]
                      ),
                      Row(
                          children: <Widget>[
                            SvgPicture.asset("assets/icon/tick2.svg",
                              fit: BoxFit.scaleDown,width: 28,height: 28,),
                            SizedBox(width: 5,),
                            Text(
                              "Regular update + new game",
                              textAlign: TextAlign.left,
                              style: TextStyle(color: MyColor.textcolor1,fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ]
                      ),
                      Row(
                          children: <Widget>[
                            SvgPicture.asset("assets/icon/tick2.svg",
                              fit: BoxFit.scaleDown,width: 28,height: 28,),
                            SizedBox(width: 5,),
                            Text(
                              "Gender-friendly",
                              textAlign: TextAlign.left,
                              style: TextStyle(color: MyColor.textcolor1,fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ]
                      ),
                      Row(
                          children: <Widget>[
                            SvgPicture.asset("assets/icon/tick2.svg",
                              fit: BoxFit.scaleDown,width: 28,height: 28,),
                            SizedBox(width: 5,),
                            Text(
                              "New sexual experiences",
                              textAlign: TextAlign.left,
                              style: TextStyle(color: MyColor.textcolor1,fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ]
                      ),
                      Row(
                          children: <Widget>[
                            SvgPicture.asset("assets/icon/tick2.svg",
                              fit: BoxFit.scaleDown,width: 28,height: 28,),
                            SizedBox(width: 5,),
                            Text(
                              "One-time purchase (No Subscription)",
                              textAlign: TextAlign.left,
                              style: TextStyle(color: MyColor.textcolor1,fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ]
                      ),
                      Row(
                          children: <Widget>[
                            SvgPicture.asset("assets/icon/tick2.svg",
                              fit: BoxFit.scaleDown,width: 28,height: 28,),
                            SizedBox(width: 5,),
                            Text(
                              "One-time purchase (No Subscription)",
                              textAlign: TextAlign.left,
                              style: TextStyle(color: MyColor.textcolor1,fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ]
                      )


                    ],
                  ),
                ),
              ),
            ),

            Container(
              width: double.maxFinite,
              height: 120,
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: MyColor.black,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),

              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text(
                    'LIMITED OFFER',
                    style: TextStyle(color: MyColor.white, fontSize: 16,letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  InkWell(onTap:() {
                    callAPI(context);
                  },
                    child: Container(
                      width: double.maxFinite,
                      height: 50,
                      margin: EdgeInsets.only(left: 20,right: 20),
                      decoration: BoxDecoration(
                          color: MyColor.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(padding:EdgeInsets.all(5),
                                child: SvgPicture.asset("assets/icon/lock.svg",width: 34,)),
                            Column(
                              children: [
                                Text(
                                  'Unlock All Game',
                                  style: TextStyle(color: MyColor.white, fontSize: 18,letterSpacing: 1,fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Click here to upgrade',
                                  style: TextStyle(color: MyColor.white, fontSize: 12),
                                )
                              ],
                            )
                          ],

                        ),
                      ),
                    ),
                  )

                ],
              ),
              /*child: Container(
                width: double.maxFinite,
                height: 30,
                margin: EdgeInsets.only(left: 20,right: 20),
                decoration: BoxDecoration(
                    color: MyColor.golden,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: TextButton(
                  onPressed: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (_) => HomeMain()));
                    //Get.to(HomeMain());
                  },
                  child: Text(
                    'Unlock All Game',
                    style: TextStyle(color: MyColor.golden, fontSize: 14,letterSpacing: 1),
                  ),
                ),
              ),*/
            ),

          ],
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

