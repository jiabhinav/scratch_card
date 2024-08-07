import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scratcher/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../color/MyColor.dart';
import '../session/Session.dart';
import '../utill/Constant.dart';
import '../utill/Utility.dart';
import 'controller/SansualController.dart';
import 'controller/ScrachViewController.dart';

 class SansualSecretView extends  StatelessWidget {

          var data = Get.arguments;
          final controller = Get.put(SansualController());
        bool skrach = false;

          @override
          Widget build(BuildContext context) {
            callAPI(context);
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  elevation: 1,
                  centerTitle: false,
                  title:  Text("Sansual Secret",style: TextStyle(fontSize: 18),),
                ),
                body: GetBuilder<SansualController>(
                  builder: (_) => controller.isLoading? SizedBox(
                    height: MediaQuery.of(context).size.height / 1.3,
                    child: Center(child: CircularProgressIndicator(),),) :
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        Center(
                          child:Text(
                            'Scratch the question with your finger',
                            style: TextStyle(color: MyColor.black,
                                fontSize: 18,letterSpacing: 1,fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 30,),
                        ClipOval(
                        child: SizedBox.fromSize(
                        size: Size.fromRadius(MediaQuery.of(context).size.width*0.38),
                          child: Scratcher(
                            brushSize: 50,
                            threshold: 50,
                            color: Colors.red,
                            image: Image.asset(
                              "assets/image/scrach1.jpg",
                              fit: BoxFit.fill,
                            ),
                            onChange: (value) => print("Scratch progress: $value%"),
                            onThreshold: () => controller.setVisible(true),
                            child: Container(
                              height: 300,
                              width: 300,
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding:EdgeInsets.all(10),
                                        child: Text(
                                          controller.modelGetLevel!.result!.tag!,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                        SizedBox(height: 10,),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Visibility(
                              visible: controller.isVisible,
                              child: InkWell(
                                onTap: (){
                                  callAPI(context);
                                },
                                child: Container(
                                  width: double.maxFinite,
                                  height: 50,
                                  margin: EdgeInsets.only(left: 20,right: 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: MyColor.gray2,width: 1),
                                      color: MyColor.black
                                  ),
                                  child: Center(
                                    child:   Text(
                                      'Next',
                                      style: TextStyle(color: MyColor.golden,
                                          fontSize: 16,letterSpacing: 1,fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40,),
                      ],
                    ),
                  ),)


                ),
            );



          }

          void callAPI(BuildContext context)
          {
            Future.delayed(Duration(seconds: 2),(){
              var param = {"username": sp.getEmail(),};
              controller.getLevel(param, context);
            });
          }


     /*     void callAPI(BuildContext context,String level,String image) async
          {
            var param = {
              "username": sp.getEmail(),
              "level": level,
              "image": image,
            };
            //controller.login(param, context);
            final user = await controller.openLevel(param, context);
            if(user.status==1)
            {
              skrach=true;
              showToast(user.result!.status!,2);
              *//*var level=(controller.image);
              level!.image![controller.levelIndex].open=1;
              //level!.image![levelIndex].open=1;
              controller.setLevelImage(level);
              var model =  (controller.image)?.image![controller.levelIndex];
              print("openleveris=="+model!.open!.toString());*//*
             // Get.back();
            }
            else
            {
              showToast(user.result!.status!,2);
            }
          }*/




}