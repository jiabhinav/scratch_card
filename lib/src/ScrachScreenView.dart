import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scratcher/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../color/MyColor.dart';
import '../session/Session.dart';
import '../utill/Constant.dart';
import '../utill/Utility.dart';
import 'controller/ScrachViewController.dart';

 class ScrachScreenView extends  StatefulWidget {
        const ScrachScreenView({Key? key}) : super(key: key);
        @override
        State<ScrachScreenView> createState() => _WebViewScreenState();
        }
        class _WebViewScreenState extends State<ScrachScreenView> {
          var data = Get.arguments;
          final controller = Get.put(ScrachViewController());
        bool skrach = false;
        @override
        void initState() {
        super.initState();
        }
        @override
        Widget build(BuildContext context)
        {//Get.back(result: skrach);
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) async {
            if (didPop) {
              return;
            }
            //final navigator = Navigator.of(context);
            Get.back(result: skrach);
          },
          child: Scaffold(
          appBar: AppBar(
          centerTitle: false,
          title:  Text(data[0]['name']),
          ),
          body: GetBuilder<ScrachViewController>(
            builder: (_)=> Column(
           children: [
          SizedBox(height: 10,),
            Center(
              child: Container(// Border width
                decoration: BoxDecoration(color: MyColor.skrach_bg, shape: BoxShape.circle),
                child: SizedBox.fromSize(
                  size: Size.fromRadius(MediaQuery.of(context).size.width*0.4), // Image radius
                  child:Center(
                      child:ClipOval(
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(MediaQuery.of(context).size.width*0.4),
                          child: controller.skrach==false?Scratcher(
                              brushSize: 30,
                              threshold: 40,
                              rebuildOnResize: true,
                              color: MyColor.skrach_bg,
                              onChange: (value) { print("Scratch progress: $value%");},
                              onThreshold: () {
                                print("callAPI==="+data[3]['level']+"=="+data[2]['url']);
                                callAPI(context,data[3]['level'],data[2]['url']);
                              },
                              child: ClipOval(
                                  child: SizedBox.fromSize(
                                    size: Size.fromRadius(200), // Image radius
                                    child:Image.network(imageURL+data[2]['url'], fit: BoxFit.fill,
                                    ),
                                  )
                                // child: Image.network(imageURL+model.image!, fit: BoxFit.fill,width: 80,height: 80,
                              )
                          ):ClipOval(
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(200), // Image radius
                                child:Image.network(imageURL+data[2]['url'], fit: BoxFit.fill,
                                ),
                              )
                            // child: Image.network(imageURL+model.image!, fit: BoxFit.fill,width: 80,height: 80,
                          ),
                        ),
                      )),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: Row(
                children: [
                  Expanded(child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: setBoxDecoration(MyColor.black,10.0),
                    child: Column(
                      children: [
                        Text(
                          data[0]['name'],
                          style: TextStyle(color: MyColor.golden, fontSize: 16,
                              fontFamily:"Montserrat",fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 10),
                        Text(
                          data[1]['desc'],
                          style: TextStyle(color: MyColor.golden, fontSize: 11,
                              fontFamily:"Montserrat",fontWeight: FontWeight.w400),
                        ),

                      ],
                    ),
                  ),),
                  SizedBox(width: 10,),
                  Expanded(child: Container(
                    margin: EdgeInsets.all(2),
                    width: 100,
                    height: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black,width: 2),
                        color: Colors.black
                    ),
                    child:   Text(data[3]['level'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            color: MyColor.golden,
                            fontFamily:"Montserrat",fontWeight: FontWeight.w500)),
                  ),)

                ],
              ),
            ),
            SizedBox(height: 40,),
            InkWell(onTap:() {
              Get.back(result: skrach);
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
                    'Back',
                    style: TextStyle(color: MyColor.golden,
                        fontSize: 16,letterSpacing: 1,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
            ],
          ),
          ),),
        );
        }


          void callAPI(BuildContext context,String level,String image) async
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
              controller.updateOpen(true);
              showToast(user.result!.status!,2);
              /*var level=(controller.image);
              level!.image![controller.levelIndex].open=1;
              //level!.image![levelIndex].open=1;
              controller.setLevelImage(level);
              var model =  (controller.image)?.image![controller.levelIndex];
              print("openleveris=="+model!.open!.toString());*/
             // Get.back();
            }
            else
            {
              showToast(user.result!.status!,2);
            }
          }


}