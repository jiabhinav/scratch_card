
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrach_card/color/MyColor.dart';

import '../model/ModelSucces.dart';
import '../style/AppStyle.dart';
import '../utill/Utility.dart';

class HelpSupport extends StatefulWidget{

  @override
  _HelpSupport createState()=> _HelpSupport();


   }

   class _HelpSupport extends State<HelpSupport>
   {

     final description = TextEditingController();
     final contact = TextEditingController();
     final email = TextEditingController();


     @override
     Widget build(BuildContext context) {
       // TODO: implement build
       return Scaffold(
         appBar: AppBar(title: Text("Help & Supports",style: TextStyle(color: Colors.black,fontSize: 18),),
             backgroundColor: Colors.white,
             elevation: 0,
             //brightness: Brightness.light,
             iconTheme: IconThemeData(color: Colors.black)),
         body: SingleChildScrollView(

           child:Container(
             margin: EdgeInsets.all(10),
             child: Column(
               children: <Widget>[


                 Container(
                   margin: const EdgeInsets.only(left: 2,top: 20),
                   width: double.maxFinite,
                   padding: const EdgeInsets.only(bottom: 2),
                   child:addressText("How can i help you explain here *"),
                 ),
                 Container(
                     width: double.maxFinite,
                     height: 100,
                     child: TextField(
                       controller: description,
                       minLines: 4,
                       maxLines: 5,
                       keyboardType: TextInputType.text,
                       style: TextStyle(
                           height: 1.3,
                           fontSize: 16.0,
                           color: Colors.black
                       ),
                       decoration: InputDecoration(
                         filled: true,
                         contentPadding: EdgeInsets.only(left: 10,top: 10),
                         fillColor: Colors.white,
                         counterText: "",
                         //focusedBorder: InputBorder.none,
                         disabledBorder: InputBorder.none,
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10.0),
                             borderSide: BorderSide(
                                 color: MyColor.textFeildBorder,
                                 width: 1
                             )
                         ),
                         enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10.0),
                           borderSide: BorderSide(
                             color: MyColor.textFeildBorder,
                             width: 1.0,
                           ),
                         ),
                         hintText: "Tell us about your query...",),

                     )
                 ),


                 Container(
                   margin: const EdgeInsets.only(left: 2,top: 20),
                   width: double.maxFinite,
                   padding: const EdgeInsets.only(bottom: 2),
                   child:addressText("Your Contact Details *"),
                 ),
                 Container(
                   margin: const EdgeInsets.only(top: 20),
                   width: double.maxFinite,
                   padding: const EdgeInsets.only(left: 5,bottom: 5),
                   child:addressText("Your contact details *"),
                 ),
                 Row(
                   children: [
                     Expanded(
                       flex: 1,
                       child:  Container(
                           width: double.maxFinite,
                           height: 50,
                           child: TextField(
                             controller: contact,
                             keyboardType: TextInputType.phone,
                             style: addressTextStyle(),
                             maxLength: 10,
                             decoration: addressInputDecoration("Your mobile number"),

                           )
                       ),
                     ),
                     SizedBox(width: 10.0),
                     Expanded(
                       flex: 1,
                       child:  Container(
                           width: double.maxFinite,
                           height: 50,
                           child: TextField(
                             controller: email,
                             keyboardType: TextInputType.emailAddress,
                             style: addressTextStyle(),
                             decoration: addressInputDecoration("Your email address"),

                           )
                       ),
                     )

                   ],
                 ),


                 Container(
                   width: double.maxFinite,
                   height: 40,
                   margin: const EdgeInsets.only(top: 30),
                   decoration: BoxDecoration(
                       color: MyColor.appColor, borderRadius: BorderRadius.circular(6)),
                   child: TextButton(
                     onPressed: () {
                       /*  Navigator.push(
                    //  context, MaterialPageRoute(builder: (_) => HomeMain()));
                      context, MaterialPageRoute(builder: (_) => ModalBottomSheetDemo()));*/
                       /*  dialogBottomSheet();*/
                       chechValiddation();
                     },
                     child: Text(
                       'Submit',
                       style: TextStyle(color: Colors.white, fontSize: 14,letterSpacing: 1),
                     ),
                   ),
                 ),

               ],
             ),
           ),

         ),
       );
     }


     chechValiddation(){

       if(description.text == '')
       {
         showToast('Enter comments',2);

       }

       else if(contact.text == ''||contact.text.length<10)
       {
         showToast('Enter valid  mobile number',2);
       }
       else if(email.text == ''|| checkEmail(email.text )==false)
       {
         showToast('Incorrect email format',2);
       }
       else
       {
         submitInquiries();
       }

     }

     void submitInquiries()
     {
       var params = {

         "mobile":contact.text,
         "email":email.text,
         "comment":description.text,

       };

       print("updatecartdata"+params.toString());
      // saveHelpSupport(context,params).then((value) => getSuccess(value));

     }
     void getSuccess(ModelSucces modelSucces)
     {
       if(modelSucces.status==1)
       {
         Navigator.of(context).pop("1");
         showToast(modelSucces.result!.status!, 2);
       }
       else
       {

         showToast(modelSucces.result!.status!, 2);
       }

     }

   }


