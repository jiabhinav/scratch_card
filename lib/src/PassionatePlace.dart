
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:scrach_card/src/ScrachScreenView.dart';

import 'package:scratcher/widgets.dart';

import '../api/Controller.dart';
import '../color/MyColor.dart';

import '../model/model_dash_board.dart';
import '../session/Session.dart';
import '../utill/Constant.dart';
import '../utill/Utility.dart';
import 'alertdialog/ImageDilaogView.dart';
import 'controller/PassionateController.dart';
import 'controller/SexPossController.dart';

class PassionatePlace extends  StatelessWidget {
  late Future<ModelDashBoard> futureAlbum;
  final controller = Get.put(PassionateController());

  int levelIndex=-1;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),(){
      var param = {"username": sp.getEmail(),};
      controller.getLevel(param, context);
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.black3,
        appBar: AppBar(
          elevation: 1,
          centerTitle: false,
          title:  Text("Passionate Places",style: TextStyle(fontSize: 18),),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(passionat_title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: MyColor.white,
                      fontFamily:"Montserrat",fontWeight: FontWeight.w700)),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 20,right: 20),
                child: GetBuilder<PassionateController>(
                  builder: (_) => controller.isLoading? SizedBox(
                    height: MediaQuery.of(context).size.height / 1.3,
                    child: Center(child: CircularProgressIndicator(),),) :
                  ListView.builder(
                      primary: false,
                      scrollDirection: Axis.vertical,
                      itemCount: (controller.modelGetLevel)?.result!.places!.length,
                      itemBuilder: (context, index) {
                        var cat =  (controller.modelGetLevel)?.result!.places![index];
                        //  controller.image= cat;
                        return Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: setBoxDecoration(MyColor.red, 10),
                                  child: Text(cat!.mainTag.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: MyColor.golden,
                                          fontFamily:"Montserrat",fontWeight: FontWeight.w700)),
                                ),
                              ),
                              SizedBox(height: 10,),
                              GridView.builder(
                                shrinkWrap: true,
                                itemCount: cat.data!.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 2.5
                                ),
                                itemBuilder: (BuildContext context, int index2){
                                  var model =  (cat.data![index2]);
                                  return model.open==0?
                                  InkWell(
                                    onTap: () async {
                                      levelIndex=index;
                                      selectedIndex=index2;
                                      callAPI(context,cat.place.toString(),model.tag!);
                                    },
                                    child:FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: setBoxDecoration(Colors.black, 20),
                                        child: Text(model.tag.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: MyColor.golden,
                                                fontFamily:"Montserrat",fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                  ):InkWell(
                                    onTap: () {
                                      //ImageDialogView(context,imageURL+model.image!,"qedefefe2ffefff");
              
                                    },
                                    child:FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: setBoxDecoration(MyColor.complaint_suggestion, 20),
                                        child: Text(model.tag.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: MyColor.golden,
                                                fontFamily:"Montserrat",fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
       /* body: ListView.builder( // outer ListView
          itemCount: 4,
          itemBuilder: (_, index) {
            return Column(
              children: [
                Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text('Header $index'),
                ),
                ListView.builder( // inner ListView
                  shrinkWrap: true, // 1st add
                  physics: ClampingScrollPhysics(), // 2nd add
                  itemCount: 10,
                  itemBuilder: (_, index) => ListTile(title: Text('Item $index')),
                )
              ],
            );
          },
        ),*/
      ),
    );



  }

  void callAPI(BuildContext context,String place,String tag) async
  {
    var param = {
      "username": sp.getEmail(),
      "place": place,
      "tag": tag,
    };
    //controller.login(param, context);
    final user = await controller.openLevel(param, context);
    if(user.status==1)
    {
      var level=(controller.modelGetLevel);
      level?.result?.places![levelIndex].data![selectedIndex].open=1;
          //level!.image![levelIndex].open=1;
      controller.updateLevel(level);
      showToast(user.result!.status!, 2);
    }
    else
    {
      showToast(user.result!.status!,2);
    }
  }

  void refreshList()
  {
   /* var level=(controller.image);
    controller.setLevelImage(level);*/
  }



}