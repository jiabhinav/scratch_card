import 'dart:convert';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/ModelLogin.dart';

class Session {
late SharedPreferences _pref;
final String _isLogin='islogin';

    init() async{
      _pref=await SharedPreferences.getInstance();
    }

    set login(bool value)=>_pref.setBool(_isLogin, value);
    bool get login=>_pref.getBool(_isLogin)??false;

      getName()  {
        return _pref.getString('name');
      }
      getEmail()  {

        return _pref.getString('email');
      }

      getPaid()  {

        return _pref.getInt('paid');
      }

      getMobile()  {
        return _pref.getString('phone');
      }
      getProfile()  {
        return _pref.getString('profile');
      }

    getId()  {
        return _pref.getString('id');
    }

    setPaid(int paid)
    {
      _pref.setInt('paid', paid);
    }


  Future<ModelLogin?>read2() async {

      if(_pref.getString('info_jqr')!=null)
        {
          Map<String,dynamic> userMap = jsonDecode(_pref.getString('info_jqr')!);
          return ModelLogin.fromJson(userMap);
        }
      else
        {
          return null;
        }

 }


saveUpdate(ModelLogin? modelLogin) async {

    /*_pref.setString('token', modelLogin!.payload!.token!);
    _pref.setString('id', modelLogin.payload!.userId.toString());
    _pref.setString('name', modelLogin.payload!.businessName.toString());
    _pref.setString('mobile', modelLogin.payload!.phone.toString());
    _pref.setString('email', modelLogin.payload!.email!);
    _pref.setString('profile', modelLogin.payload!.profileImage.toString());*/
    //getToken();
   }

  void setProfile(String image)
  {
    if(image!=null)
      {
        _pref.setString('profile',image.toString());
      }

  }

  checkKey()
  {
    if(_pref.containsKey('email'))
      {
        return true;
      }
    else{
      return false;
    }
  }


  save(ModelLogin modelLogin) async {

       _pref.setString('status', modelLogin.result!.status!);
       _pref.setString('name', modelLogin.result!.name!);
       _pref.setString('username', modelLogin.result!.username!);
       _pref.setString('email', modelLogin.result!.email!);
       _pref.setString('phone', modelLogin.result!.phone!);
       _pref.setInt('paid', modelLogin.result!.paid!.toInt());
       _pref.setInt('points', modelLogin.result!.points!.toInt());
       login=true;
      // print(login);

  //getToken();
}

  save2(ModelLogin? modelLogin) async {
    String user = jsonEncode(ModelLogin.fromJson(modelLogin as Map<String, dynamic>));
    //   String storePayment = jsonEncode(modelLogin?.toJson());
    _pref.setString('info_jqr', user);
  }


  logoutApp() async {
    _pref.clear();
  }

}

Session sp=Session();