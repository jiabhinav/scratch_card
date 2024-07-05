

import 'package:flutter/material.dart';
import 'package:scrach_card/color/MyColor.dart';

addressInputDecoration(String title)
{
  return  InputDecoration(
      filled: true,
      contentPadding: EdgeInsets.only(left: 10),
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
      hintText: title,);
}

registerInputDecoration(String title)
{
  return  InputDecoration(
    filled: true,
    contentPadding: EdgeInsets.only(left: 10),
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
    hintText: title,);
}

addressContainerBg()
{
  return  BoxDecoration(
      border: Border.all(
        color: MyColor.textFeildBorder,width: 1.0
      ),
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)));
}

addressTextStyle()
{
  return  TextStyle(
      height: 1.5,
      fontSize: 16.0,
      color: Colors.black
  );
}

addressText(String title)
{
  return  Text(
    title,
    textAlign: TextAlign.left,style: TextStyle(color: MyColor.textFeildBorder,fontSize: 12),
  );
}