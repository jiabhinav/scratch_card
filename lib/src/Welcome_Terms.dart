import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
import 'UpgradeMessage.dart';

class Welcome_Terms extends StatelessWidget {

  int selectedOption = 0;

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.topLeft,
                  child: Text(
                    'Welcome',
                    textAlign: TextAlign.left,style:
                  TextStyle(color: MyColor.black,fontSize:24,fontWeight: FontWeight.bold),
                  )),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: double.maxFinite,
                      padding: const EdgeInsets.only(left: 10,top: 0,right: 10,bottom: 2),
                      child:Text(
                        terms,
                        textAlign: TextAlign.left,style: TextStyle(color: MyColor.black,fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20,),
                    ListTile(
                      title: Text(
                        termsandcondtion,
                        textAlign: TextAlign.left,style: TextStyle(color: MyColor.black,fontSize: 14,fontWeight: FontWeight.bold),
                      ),
                      leading: Radio<int>(
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: 1,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          selectedOption = 2;
                          print("Button value: $value");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              width: double.maxFinite,
              height: 50,
              margin: const EdgeInsets.only(left: 20.0,top: 20,right: 20,bottom: 20),
              decoration: BoxDecoration(
                  color: MyColor.black, borderRadius: BorderRadius.circular(24)),
              child: TextButton(
                onPressed: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (_) => HomeMain()));
                  //Get.to(UpgradeMessage());
                  Navigator.push(context, MaterialPageRoute(builder: (_) => UpgradeMessage()));
                },
                child: Text(
                  'Let`s go',
                  style: TextStyle(color: MyColor.golden, fontSize: 14,letterSpacing: 1),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }





}

