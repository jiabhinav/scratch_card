
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
import 'package:scrach_card/src/ScrachScreenView.dart';
import 'package:scrach_card/src/SexPosition.dart';
import 'package:scrach_card/src/controller/HomeController.dart';
import 'package:scratcher/widgets.dart';

import '../api/Controller.dart';
import '../color/MyColor.dart';

import '../model/model_dash_board.dart';
import '../session/Session.dart';
import '../utill/Constant.dart';
import '../utill/Utility.dart';
import 'alertdialog/ImageDilaogView.dart';


 class HomePage extends StatelessWidget {
  late Future<ModelDashBoard> futureAlbum;
  final controller = Get.put(HomeController());

  int levelIndex=-1;
  int selectedIndex = -1;


  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),(){
      //var param = {"username": sp.getEmail(),};
      controller.getDashboard();
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

                 ListView.builder(
                     padding: EdgeInsets.only(top: 5),
                     primary: false,
                     shrinkWrap: true,
                     scrollDirection: Axis.vertical,
                     itemCount: (controller.modelDashboard).payload!.features!.length,
                     itemBuilder: (context, index) {
                       var model =  (controller.modelDashboard).payload!.features![index];
                       return InkWell(child:Container(
                         padding: EdgeInsets.only(top: 20,bottom: 20,left: 10,right: 10),
                         margin: EdgeInsets.all(10),
                         alignment: Alignment.centerLeft,
                         decoration: setBoxDecoration(MyColor.black,10.0),
                         child: Row(
                           mainAxisSize: MainAxisSize.min,
                           children: [
                             Image.asset(model.image!, fit: BoxFit.scaleDown,width: 32,),
                             SizedBox(width: 10,),
                             Text(model.title!,
                                 textAlign: TextAlign.start,
                                 style: TextStyle(
                                     fontSize: 16,
                                     color: MyColor.golden,
                                     fontFamily:"Montserrat",fontWeight: FontWeight.w500)),
                           ],
                         ),
                       ),onTap: (){
                         if(index==0)
                         {
                           Get.to(SexPosition());
                           //Navigator.push(context, MaterialPageRoute(builder: (_) => SexPosition()));
                         }
                       },
                       );
                     }),

              ],

            ),),
    )


        );



  }

/*  void callAPI(BuildContext context,String level,String image) async
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
      var level=(controller.image);
      level!.image![levelIndex].open=1;
          //level!.image![levelIndex].open=1;
      controller.setLevelImage(level);
      var model =  (controller.image)?.image![levelIndex];
      print("openleveris=="+model!.open!.toString());

      showToast(user.result!.status!, 2);
      //loadSharedPrefs(user);
      *//*Future.delayed(Duration(seconds: 1),(){
        var param = {"username": sp.getEmail(),};
        controller.getLevel(param, context);
      });*//*
    }
    else
    {
      showToast(user.result!.status!,2);
    }
  }*/

/*  void refreshList()
  {
    var level=(controller.image);
    level!.image![levelIndex].open=1;
    //level!.image![levelIndex].open=1;
    controller.setLevelImage(level);
  }*/



}