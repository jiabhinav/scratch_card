
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

import '../api/Controller.dart';
import '../color/MyColor.dart';

import '../model/model_dash_board.dart';
import '../utill/Utility.dart';


 class HomePage extends StatelessWidget {
  late Future<ModelDashBoard> futureAlbum;
  final controller = Get.put(Controller());
  final ModelDashBoard? _modelDashBoard=null;


  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 2),(){
      controller.getDashboard();
    });
        return SingleChildScrollView(
          child:GetBuilder<Controller>(
            builder: (_) => controller.isLoading? SizedBox(
              height: MediaQuery.of(context).size.height / 1.3,
              child: Center(child: CircularProgressIndicator(),),) :
                Padding(padding: EdgeInsets.all(10),
                child:Column(
               children:<Widget> [
                 SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        alignment: Alignment.center,
                        height: 25,
                        decoration: setBoxDecoration(MyColor.black,10.0),
                        child: Text('Daily Activity',
                          style: TextStyle(fontSize:10,color: MyColor.golden,letterSpacing: 3,
                            fontFamily:"Montserrat",fontWeight: FontWeight.w600),),

                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        alignment: Alignment.center,
                        height: 25,
                        decoration: setBoxDecoration(MyColor.white,10.0),
                        child: Text(
                          'Better Love life',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize:10,color: MyColor.black,letterSpacing: 3,
                              fontFamily:"Montserrat",fontWeight: FontWeight.w600),
                        ),

                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.15,
                    viewportFraction: .95,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      autoPlay: false,
                      scrollDirection: Axis.horizontal,

                  ),
                  items:  (controller.modelDashboard).payload!.banners!.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
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
                        );
                      },
                    );
                  }).toList()),
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
                              itemCount: (controller.modelDashboard).payload!.categories!.length,
                              itemBuilder: (context, index) {
                                var cat =  (controller.modelDashboard).payload!.categories![index];
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
                                    child:   Text(cat.name!,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: MyColor.golden,
                                            fontFamily:"Montserrat",fontWeight: FontWeight.w500)),
                                  ),
                                    onTap: () => {

                                    });
                              }),
                        ),

                      ],
                    ),
                  ),

                 SizedBox(height: 20,),
                 GridView.builder(
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
                 )

              ],

            ),),
    )


        );



  }

}