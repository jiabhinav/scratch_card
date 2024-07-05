import 'dart:ffi';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vibration/vibration.dart';
import '../session/Session.dart';
import '../color/MyColor.dart';

late AlertDialog alert;

showLoader(BuildContext context) {
  var _isLoading = true;
  new Future.delayed(Duration.zero, () {
    /*  alert=AlertDialog(
        backgroundColor: Colors.transparent,
       content: new Row(
          children: [
            CircularProgressIndicator(),
            Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
          ],),

      );*/

    showDialog(
        barrierDismissible: false,
        context: context,
        /*  builder:(BuildContext context){
          return alert;
        },*/
        builder: (_) => Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20),
              child: Container(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    color: MyColor.appColor,
                    // strokeWidth: 2,
                  )),
            ));
  });
}

dialogLogoutBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return FractionallySizedBox(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          width: 32,
                          height: 32,
                          decoration: new BoxDecoration(
                            color: MyColor.lightgray,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: new Icon(Icons.circle_notifications,
                              size: 20.0, color: Colors.black)),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            Text(
                              "Logout",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 0.4,
                  color: MyColor.lightgray,
                ),
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(
                      left: 10, top: 20, right: 10, bottom: 20),
                  child: Text(
                    'Are you sure want to Logout?',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(
                      left: 10, top: 20, right: 30, bottom: 20),
                  alignment: Alignment.topRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Text(
                            "Cancel ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                        onTap: () => {Navigator.pop(context)},
                      ),
                      InkWell(
                        child: Text(
                          "Logout Now",
                          style: TextStyle(
                              color: MyColor.appColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        onTap: () => {logout()},
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

void logout() {
  sp.logoutApp();
  SystemNavigator.pop();
}

dismissLoader(BuildContext context) {
  new Future.delayed(Duration.zero, () {
    Navigator.pop(context);
  });
}

showToast(String mesg, int possType) {
  Fluttertoast.showToast(
      msg: mesg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: possType == 1
          ? ToastGravity.TOP
          : possType == 2
              ? ToastGravity.CENTER
              : ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white);
}

checkEmail(String email) {
  final bool _isValid = EmailValidator.validate(email);
  return _isValid;
}

vibrate() async {
  Vibration.vibrate();
  await Future.delayed(Duration(milliseconds: 100));
  Vibration.vibrate();
  /*if (await Vibration.hasCustomVibrationsSupport()) {
    Vibration.vibrate(duration: 100);
  } else {
    Vibration.vibrate();
    await Future.delayed(Duration(milliseconds: 100));
    Vibration.vibrate();
  }*/
}

getOrderStatus() {
  //todo 1=>Pending, 2=>Approved, 3=> Rejected, 4 => Cancelled, 5=>Dispatched, 6=>Complete
  final status = <int>[];
  for (var i = 1; i < 7; i++) {
    status.add(i);
  }
  return status;
}

setCircleBackGround(double width, double height, String image, Color color) {
  return Positioned(
    left: 45,
    top: 30,
    child: new Container(
        width: (width + 10),
        height: (height + 10),
        decoration: new BoxDecoration(
          color: color,
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Image.asset(image, width: width, height: height)),
  );
}

getCheckBox(double padding, String lable) {
  return ListTileTheme(
    horizontalTitleGap: padding,
    child: CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        lable,
      ),
      value: false,
      activeColor: MyColor.appColor,
      checkColor: Colors.grey,
      checkboxShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      contentPadding: EdgeInsets.zero,
      onChanged: (bool? value) {},
    ),
  );
}

setBoxDecoration(Color color, double radius) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
  );
}

String getCommanImagePath(String img) {
  return "assets/image/$img";
}
String getCommanIconPath(String img) {
  return "assets/icon/$img";
}
setBoxDecorationTop(Color color,double radius)
{
  return  BoxDecoration(
    color: color,
    borderRadius: BorderRadius.only(topLeft: Radius.circular(radius),topRight: Radius.circular(radius)),
  );
}

setBoxOuterBorder(Color color,double radius)
{
  return  BoxDecoration(
    border: Border.all(color: color),
    borderRadius: BorderRadius.only(topLeft: Radius.circular(radius),topRight: Radius.circular(radius)),
  );
}

getLeaveInputFeildDecoration() {
  return InputDecoration(
    border: InputBorder.none,
    fillColor: Colors.white,
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 2.0),
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}

  TextInputNoneBorder(int maxLine,int minLine,{String text =""}) {
    return Container(
        decoration: setBoxDecoration(Colors.white, 10),
        padding: EdgeInsets.only(left: 10, right: 10),
        child: TextFormField(
          initialValue: text,
          maxLines: maxLine,
          minLines: minLine,
          decoration: InputDecoration(
              border: InputBorder.none),
        )
    );
  }
TextInputWithBorder(int maxLine,int minLine,{String text =""})
{
  return Container(
      decoration: setBoxDecoration(Colors.grey, 10),
      padding: EdgeInsets.only(left: 10,right: 10),
      child:  TextFormField(
        initialValue: text,
        maxLines: maxLine,
        minLines: minLine,
        decoration: InputDecoration(
          border: InputBorder.none
        ),
      )
  );
}


getLeaveLableTextStyle(Color color)
{
  return TextStyle(
      fontSize: 12,
      color: color,
      fontFamily:"Montserrat",fontWeight: FontWeight.w500);
}

CustomTextStyle(double font,Color color,FontWeight? fontWeight)
{
  return TextStyle(
      fontSize: font,
      color: color,
      fontFamily:"Montserrat",fontWeight: fontWeight);
}

InputFeildDecoration(Color color,double width) {
  return InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color, width: width),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color, width: width),
    ),
    hintText: 'Mobile Number',
  );
}

customContainer(Widget? child,BuildContext context){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage('assets/image/wall.jpg'),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstATop),
        )
    ),
    child: child,
  );
}























