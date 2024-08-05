
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
import 'controller/SexPossController.dart';

class SexPosition extends  StatelessWidget {
  late Future<ModelDashBoard> futureAlbum;
  final controller = Get.put(SexPossController());

  int levelIndex=-1;
  int selectedIndex = -1;
/*  const SexPosition({Key? key}) : super(key: key);
  @override
  State<SexPosition> createState() => _SexPosition();
}

 class _SexPosition extends State<SexPosition> {
   late Future<ModelDashBoard> futureAlbum;
   final controller = Get.put(SexPossController());

  int levelIndex=-1;
  int selectedIndex = -1;*/

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),(){
      var param = {"username": sp.getEmail(),};
      controller.getLevel(param, context);
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: false,
          title:  Text("Sex Position",style: TextStyle(fontSize: 18),),
        ),
        body: SingleChildScrollView(
            child:GetBuilder<SexPossController>(
              builder: (_) => controller.isLoading? SizedBox(
                height: MediaQuery.of(context).size.height / 1.3,
                child: Center(child: CircularProgressIndicator(),),) :
              Padding(padding: EdgeInsets.all(10),
                child:Column(
                  children:<Widget> [
                    SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Column(
                        children: <Widget>[
                          Align(alignment: Alignment.topLeft,
                              child:  Text("Category & Scratch",
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
                                            border: Border.all(color: selectedIndex==index?MyColor.golden:Colors.black,width: 2),
                                            color: Colors.black
                                        ),
                                        child:   Text(cat!.tag.toString(),
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: MyColor.golden,
                                                fontFamily:"Montserrat",fontWeight: FontWeight.w500)),
                                      ),
                                      onTap: () => {
                                        selectedIndex=index,
                                        controller.updateLevel((controller.modelGetLevel)),
                                        controller.setLevelImage(cat)
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
                      itemCount: (controller.image)?.image!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 6.0,
                        mainAxisSpacing: 4.0,
                        //childAspectRatio: 2.5
                      ),
                      itemBuilder: (BuildContext context, int index){
                        var model =  (controller.image)?.image![index];
                        return model!.open==0?
                        InkWell(
                          onTap: () async {
                            levelIndex=index;
                            var arg= [
                              {"name": model.title!},
                              {"desc": model.descrition!},
                              {"url": model.image!,},
                              {"level": (controller.image)!.tag.toString(),}
                            ];
                            var data=await Get.to(ScrachScreenView(),arguments: arg);
                            if(data==true)
                            {
                              refreshList();
                            }
                          },
                          child:Container(// Border width
                            decoration: BoxDecoration(color: MyColor.skrach_bg, shape: BoxShape.circle),
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(48), // Image radius
                              child:Stack(
                                children: [
                                  Center(
                                      child: ClipOval(
                                        child: SizedBox.fromSize(
                                          size: Size.fromRadius(48),
                                          child: Scratcher(
                                              brushSize: 30,
                                              threshold: 40,
                                              enabled: false,
                                              rebuildOnResize: true,
                                              color: MyColor.skrach_bg,
                                              onChange: (value) { print("Scratch progress: $value%");},
                                              onThreshold: () {
                                                levelIndex=index;
                                                print("callAPI==="+(controller.image)!.level.toString()+"=="+model.image!);
                                                callAPI(context,(controller.image)!.level.toString(),model.image!);
                                              },
                                              child: ClipOval(
                                                  child: SizedBox.fromSize(
                                                    size: Size.fromRadius(48), // Image radius
                                                    child:Image.network(imageURL+model.image!, fit: BoxFit.cover,width: 80,height: 80,
                                                    ),
                                                  )
                                                // child: Image.network(imageURL+model.image!, fit: BoxFit.fill,width: 80,height: 80,
                                              )
                                          ),
                                        ),
                                      )),
                                  Center(
                                    child: Text((index+1).toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: MyColor.white,
                                            fontFamily:"Montserrat",fontWeight: FontWeight.w500)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ):InkWell(
                          onTap: () {
                            //ImageDialogView(context,imageURL+model.image!,"qedefefe2ffefff");
                            ImageDialogView(context,imageURL+model.image!,model.title!,model.descrition!);
                          },
                          /*    onTap: () async {
                          await showDialog(
                          context: context,
                          builder: (_) => ImageDialogView((imageURL+model.image!),model.title!,model.descrition!));},
        */
                          child: Container(
                            decoration: BoxDecoration(color: MyColor.skrach_bg, shape: BoxShape.circle),
                            child: ClipOval(
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(48), // Image radius
                                child:Image.network(imageURL+model.image!, fit: BoxFit.cover,width: 80,height: 80,),
                              ),
                            ),
                          ),
                        );
                      },
                    ),

        
                  ],
        
                ),),
            )
        
        
        ),
      ),
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
      var level=(controller.image);
      level!.image![levelIndex].open=1;
          //level!.image![levelIndex].open=1;
      controller.setLevelImage(level);
      var model =  (controller.image)?.image![levelIndex];
      print("openleveris=="+model!.open!.toString());

      showToast(user.result!.status!, 2);
      //loadSharedPrefs(user);
      /*Future.delayed(Duration(seconds: 1),(){
        var param = {"username": sp.getEmail(),};
        controller.getLevel(param, context);
      });*/
    }
    else
    {
      showToast(user.result!.status!,2);
    }
  }

  void refreshList()
  {
    var level=(controller.image);
    level!.image![levelIndex].open=1;
    //level!.image![levelIndex].open=1;
    controller.setLevelImage(level);
  }



}