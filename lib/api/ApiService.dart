
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config/URLS.dart';
import '../model/model_dash_board.dart';
import '../model/model_login.dart';
import '../session/Session.dart';
import '../utill/Utility.dart';

/* Future<ModelDashBoard> getDashboard(BuildContext context) async {

     showLoader(context);
    var token= sp.getToken();
    print("dwwdfwfwffw"+token.toString());
    final response = await http.post(
      Uri.parse(URLS.BASE_URL+'dashboard'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': token,
      },
      body: jsonEncode(<String, String>{
        'title': "title",
      }),
    );

    debugPrint("responseis==>>>>" + jsonEncode(response.body));
    print(ModelDashBoard.fromJson(jsonDecode(response.body)));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print(new ModelDashBoard.fromJson(jsonResponse));
     dismissLoader(context);
      return new ModelDashBoard.fromJson(jsonResponse);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception. Navigator.pop(context);
      dismissLoader(context);
      throw Exception('Failed to create album.');
    }
  }*/





  Future<ModelLogin> login(BuildContext context,String mobile,String otp) async {

  showLoader(context);
   var params = {
     "phone":mobile,
     "password":otp
   };
   final response = await http.post(
       Uri.parse(URLS.BASE_URL+'login'),
       body: params
   );

   debugPrint("responseis==>>>>" + jsonEncode(response.body));
   print(ModelLogin.fromJson(jsonDecode(response.body)));
   if (response.statusCode == 200) {
     final jsonResponse = json.decode(response.body);
     print(new ModelLogin.fromJson(jsonResponse));
     Navigator.pop(context);
     return new ModelLogin.fromJson(jsonResponse);
   } else {
     // If the server did not return a 201 CREATED response,
     // then throw an exception.
     Navigator.pop(context);
     throw Exception('Failed to create album.');
   }
 }



  Future<ModelLogin> regsiter(BuildContext context,Map<String,String> map,File gst,File aadhar) async {

  showLoader(context);
  var params = {
    "phone":"9899131677",
    "password":"12345"
  };


  var request = http.MultipartRequest('POST', Uri.parse(URLS.BASE_URL+'register'));
  request.files.add(http.MultipartFile('gst_image',
      gst.readAsBytes().asStream(), gst.lengthSync(),
      filename: gst.toString().split("/").last));

  request.files.add(http.MultipartFile('aadhar_image',
      aadhar.readAsBytes().asStream(), aadhar.lengthSync(),
      filename: aadhar.toString().split("/").last));
  request.fields.addAll(map);

       var result = await request.send();

 // var response = await http.Response.fromStream(result);
  //var response = await result.stream.bytesToString();
  var response = await http.Response.fromStream(result);
  debugPrint("regsiter==>>>>" + response.body);
  //print("regsiterrespnsisi>>>>"+ModelLogin.fromJson(jsonEncode(response.body)).message!);
  if (result.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    //print(new ModelLogin.fromJson(jsonResponse));
    Navigator.pop(context);
    return new ModelLogin.fromJson(jsonResponse);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    Navigator.pop(context);
    throw Exception('Failed to create album.');
  }


}




Future<ModelLogin> updateBusniessProfile(BuildContext context,Map map) async {
  showLoader(context);
  final response = await http.post(
      Uri.parse(URLS.BASE_URL+'editProfile'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': sp.getToken(),
      },
      body: map
  );

  debugPrint("responseis==>>>>" + jsonEncode(response.body)+"="+sp.getToken().toString());
  print(ModelLogin.fromJson(jsonDecode(response.body)));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    print(new ModelLogin.fromJson(jsonResponse));
    dismissLoader(context);
    return new ModelLogin.fromJson(jsonResponse);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    dismissLoader(context);
    throw Exception('Failed to create album.');
  }

}





