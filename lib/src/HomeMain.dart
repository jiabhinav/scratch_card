import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:overlay_support/overlay_support.dart';

import '../color/MyColor.dart';
import '../model/model_login.dart';
import '../session/Session.dart';
import '../utill/Constant.dart';
import '../utill/Utility.dart';
import 'HomePage.dart';


class HomeMain extends StatefulWidget {
  static ModelLogin? modelLogin;

  @override
  _HomeState createState() => _HomeState();

}
class _HomeState extends State<HomeMain> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  int _currentIndex = 0;
  late String _title;
  var profile=null;


  final _selectedItemColor = Colors.white;
  final _unselectedItemColor = const Color(0xffa3a3a3);
  final _selectedBgColor = const Color(0xff1a8468);
  final _unselectedBgColor = const Color(0xfff2f2f2);

  int _selectedIndex = 0;
  Color _getIconColor(int index) => _selectedIndex == index ? _selectedItemColor : _unselectedItemColor;
  Color _getBgColor(int index) => _selectedIndex == index ? _selectedBgColor : _unselectedBgColor;
  Color _getItemColor(int index) => _selectedIndex == index ? _selectedItemColor : _unselectedItemColor;
  var isVisible=true;

  final List<Widget> _children = [
    HomePage()
  ];
  

  @override
  void initState() {
    _title="Home";
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
        onPopInvoked: (didPop) {
          if (_currentIndex == 0)
            SystemNavigator.pop();
          else
          {
            /*setState(() {
              _currentIndex = 0;
            });*/
          }
        },
      child:OverlaySupport(
      child: Scaffold(
      appBar: _currentIndex==0 ? AppBar(
           automaticallyImplyLeading: true,
           leading: _currentIndex!=0?IconButton(
             icon: const BackButtonIcon(),
             onPressed: () {
               onTabTapped(0);
             },
           ):null,
          title: _currentIndex==0?Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                    margin: const EdgeInsets.only(left: 10), child: Text(_title,
                  style: TextStyle(fontSize: 16,color:MyColor.black,
                      fontFamily:"Montserrat",fontWeight: FontWeight.w500),)),
                onTap:()=>{
              //  Navigator.push(context, MaterialPageRoute(builder: (_) => PSchoolInfo()))
                },
              ),
            ],
          ):Text(_title,style: TextStyle(color: Colors.black,fontSize: 18)),

          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          actions: <Widget>[
            Padding(padding: EdgeInsets.only(right: 10.0),
            child: Visibility(
              visible: isVisible,
              child:Image.asset(
                'assets/image/dr1.png',
                fit: BoxFit.contain,
                height: 32,
              ),),)


          ], systemOverlayStyle: SystemUiOverlayStyle.dark,
        ): null,
        body:SafeArea(
          child: _children[_currentIndex],

        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 150.0,
                decoration: BoxDecoration(
                    color: MyColor.white
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  height: 75,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 60,
                        height: 60,
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(50.0),
                            image: DecorationImage(
                              image: NetworkImage(profile==null?place_holder:profile==""?place_holder:profile),
                              fit: BoxFit.cover,
                            )),
                        //child: Image.asset('assets/image/logo1.png')
                      ),
                      Padding(padding: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("XXX Jabs", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black)),
                              Text("9899XXXXXXXX", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black)),
                              Text("Edit Profile", style: TextStyle(fontSize: 10,
                                  fontFamily:"Montserrat",fontWeight: FontWeight.w600,color: Colors.redAccent)),
                            ],
                          ))


                    ],
                  ),
                ),
              ),
              ListTile(
                leading: SvgPicture.asset("assets/icon/school_info.svg"),
                title: Text("Profile Info"),
              ),

              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Logout"),
                onTap:() =>
                {
                  dialogLogoutBottomSheet(context)
                },
              )

            ],
          ),
        ),
      ),

      ));

  }


  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          {
            isVisible=true;
            _title = 'Greenfield Public School';
          }
          break;
        case 1:
          {
            _title = 'Notification';
          }
          break;
        case 2:
          {
            _title = 'Chat';
          }
          break;
        case 3:
          {
            //_title = 'NoticeBoard';
            _title = 'Notification';
          }
          break;

      }

    });
  }

  Widget _buildIcon(String iconData, String text, int index) => Container(

    width: MediaQuery.of(context).size.width/4,
    color: _getBgColor(index),
    padding: EdgeInsets.only(bottom: 10,top: 10),
    child: InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
           ImageIcon(AssetImage(iconData),color: _getIconColor(index)),
          //Icon(iconData,color: _getIconColor(index)),
          Text(text, style: TextStyle(fontSize: 12, color: _getItemColor(index))),
        ],
      ),
      onTap: () => _onItemTapped(index),
    ),
  );


  void _onItemTapped(int index) {
    print('asdasdasd');
    setState(() {
      _selectedIndex = index;
    });
  }


  void logout()
  {
    sp.logoutApp();
    SystemNavigator.pop();
  }

/*  child: Row(
  children: [
  *//*    Alignment(Alignment.topLeft,
                child: SvgPicture.asset("assets/icon/navigation_icon.svg"),),
              Expanded(child: Center(child: Column(
                children: [
                  Image.asset(
                    'assets/image/dr1.png',
                    fit: BoxFit.contain,
                    height: 17,
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 10), child: Text(_title,
                    style: TextStyle(fontSize: 12,color:MyColor.black,fontFamily:"Montserrat",fontWeight: FontWeight.w500),)),
                  Visibility(
                      visible: isVisible,
                      child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text("2021-2022",style: TextStyle(fontSize: 10),))),

                ],
              ))),
              Expanded(child:  SvgPicture.asset("assets/icon/chat.svg")),*//*
  Padding(padding: EdgeInsets.all(15),
  child:
  Align(alignment:Alignment.topLeft,
  child:Container(child: SvgPicture.asset("assets/icon/navigation_icon.svg"),)),
  ),
  Expanded(child:
  Align(alignment:Alignment.center,child:Flexible(child: Container(child: Column(
  children: [
  Image.asset(
  'assets/image/dr1.png',
  fit: BoxFit.contain,
  height: 17,
  ),
  Container(
  margin: const EdgeInsets.only(left: 10), child: Text(_title,
  style: TextStyle(fontSize: 12,color:MyColor.black,fontFamily:"Montserrat",fontWeight: FontWeight.w500),)),
  Visibility(
  visible: isVisible,
  child: Container(
  margin: const EdgeInsets.only(left: 10),
  child: Text("2021-2022",style: TextStyle(fontSize: 10),))),

  ],
  ),),flex:1),),
  ),
  Padding(padding: EdgeInsets.all(15),
  child:
  Align(alignment:Alignment.topRight,
  child:Container(child: Image.asset(
  'assets/image/dr1.png',
  fit: BoxFit.contain,
  height: 32,
  ),)),
  ),
  ],
  ),*/



}