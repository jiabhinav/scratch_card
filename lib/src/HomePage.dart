
import 'dart:convert';
import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:scrach_card/src/controller/HomeController.dart';
import 'package:scratcher/widgets.dart';

import '../api/Controller.dart';
import '../color/MyColor.dart';

import '../model/model_dash_board.dart';
import '../session/Session.dart';
import '../utill/Constant.dart';
import '../utill/Utility.dart';


 class HomePage extends StatelessWidget {
  late Future<ModelDashBoard> futureAlbum;
  final controller = Get.put(HomeController());
  final ModelDashBoard? _modelDashBoard=null;


  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 2),(){
      var param = {"username": sp.getEmail(),};
      controller.getLevel(param, context);
    });
        return SingleChildScrollView(
          child:GetBuilder<HomeController>(
            builder: (_) => controller.isLoading? SizedBox(
              height: MediaQuery.of(context).size.height / 1.3,
              child: Center(child: CircularProgressIndicator(),),) :
                Padding(padding: EdgeInsets.all(10),
                child:Column(
               children:<Widget> [
                Container(
                padding: EdgeInsets.all(15),
                  decoration: setBoxDecoration(MyColor.black,10.0),
                  child: Column(
                    children: [
                      Text(
                        'Headline',
                        style: TextStyle(color: MyColor.golden, fontSize: 16,
                            fontFamily:"Montserrat",fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Lorem ipsum dolor sit amet, consetetur sadip scing elitr, sed diam nonumy eirmod tempor invi dunt ut labore et dolore magna aliquyam erat',
                        style: TextStyle(color: MyColor.golden, fontSize: 11,
                            fontFamily:"Montserrat",fontWeight: FontWeight.w400),
                      ),


                    ],
                  ),
                ),
                 SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Align(alignment: Alignment.topLeft,
                        child:  Text("Levels & Scratch",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily:"Montserrat",fontWeight: FontWeight.w600))),
                        //Horuizantal Scrolling
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.28,
                          child: ListView.builder(
                              padding: EdgeInsets.only(top: 5),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: (controller.modelGetLevel)?.result!.levels!.length,
                              itemBuilder: (context, index) {
                                var cat =  (controller.modelGetLevel)?.result!.levels![index];
                              //  controller.image= cat;
                                return InkWell(
                                  child:Container(
                                    margin: EdgeInsets.all(2),
                                    width: 100,
                                    height: 80,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.black
                                    ),
                                    child:   Text("Level "+cat!.level.toString(),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: MyColor.golden,
                                            fontFamily:"Montserrat",fontWeight: FontWeight.w500)),
                                  ),
                                    onTap: () => {
                                    controller.setLevelImage(cat)
                                    });
                              }),
                        ),

                      ],
                    ),
                  ),

                 SizedBox(height: 20,),
                 /*GridView.builder(
                   physics: NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount: (controller.modelDashboard).payload!.features!.length,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 2,
                       crossAxisSpacing: 4.0,
                       mainAxisSpacing: 4.0,
                       childAspectRatio: 2.5
                   ),
                   itemBuilder: (BuildContext context, int index){
                     var model =  (controller.modelDashboard).payload!.features![index];
                     return InkWell(child:Container(
                       alignment: Alignment.center,
                       decoration: setBoxDecoration(MyColor.bg2,20.0),
                       child: Row(
                         mainAxisSize: MainAxisSize.min,
                         children: [
                           SvgPicture.asset(model.image!,
                               fit: BoxFit.scaleDown),
                           SizedBox(width: 10,),
                           Text(model.title!,
                               textAlign: TextAlign.start,
                               style: TextStyle(
                                   fontSize: 14,
                                   color: MyColor.textcolor1,
                                   fontFamily:"Montserrat",fontWeight: FontWeight.w500)),
                         ],
                       ),
                     ),onTap: (){
                       if(index==0)
                       {
                         //Navigator.push(context, MaterialPageRoute(builder: (_) => HomeWork()));
                       }
                     },
                     );
                   },
                 ),*/

                 ListView.builder(
                     padding: EdgeInsets.only(top: 5),
                     primary: false,
                     shrinkWrap: true,
                     scrollDirection: Axis.vertical,
                     itemCount: (controller.image)?.image!.length,
                     itemBuilder: (context, index) {
                       var model =   (controller.image)?.image![index];
                       return model!.open==0?
                         InkWell(
                         child:Container(
                           decoration: setBoxDecoration(MyColor.black,20.0),
                           margin: EdgeInsets.all(5),
                           child: Scratcher(
                           brushSize: 30,
                           threshold: 55,
                           color: Colors.black,
                           onChange: (value) { print("Scratch progress: $value%");},
                           onThreshold: () {
                             callAPI(context,(controller.image)!.level.toString(),model.image!);
                             },
                           child: Image.network(imageURL+model.image!,width: 200,)
                           ),
                         ),
                       ):Container(
                         decoration: setBoxDecoration(MyColor.black,20.0),
                         margin: EdgeInsets.all(5),
                          child: Image.network(imageURL+model.image!,width: 200,)
                       );
                     })

              ],

            ),),
    )


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
      showToast(user.result!.status!,2);
      //loadSharedPrefs(user);
      Future.delayed(Duration(seconds: 1),(){
        var param = {"username": sp.getEmail(),};
        controller.getLevel(param, context);
      });
    }
    else
    {
      showToast(user.result!.status!,2);
    }
  }


}