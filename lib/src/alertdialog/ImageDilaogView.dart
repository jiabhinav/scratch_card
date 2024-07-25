import 'package:flutter/material.dart';

import '../../color/MyColor.dart';

/*
class ImageDialogView extends StatelessWidget {

  final String url,title,decr;
  ImageDialogView(this.url, this.title,this.decr);

@override
Widget build(BuildContext context) {
  return Dialog(
    child: Container(
      height: 400,
      child: Column(
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(color: MyColor.skrach_bg, shape: BoxShape.circle),
            child: ClipOval(
              child: SizedBox.fromSize(
                size: Size.fromRadius(48), // Image radius
                child:Image.network(url, fit: BoxFit.cover,width: 200,height: 200,),
              ),
            ),
          ),
          Text('This is a demo alert dialog.'),
        ],
      ),
    ),
  );
}
}*/

/*
Future<Dialog> ImageDialogView(BuildContext context,String url,String text) async {
  return Dialog(
    child: Container(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: MyColor.skrach_bg, shape: BoxShape.circle),
            child: ClipOval(
              child: SizedBox.fromSize(
                size: Size.fromRadius(48), // Image radius
                child:Image.network(url, fit: BoxFit.cover,width: 200,height: 200,),
              ),
            ),
          ),
          Text('This is a demo alert dialog.'),
        ],
      ),
    ),
  );
}
*/


Future<void> ImageDialogView(BuildContext context,String url,String title,String desc) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title:  Text(title),
        content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 200,height: 200,
                decoration: BoxDecoration(color: MyColor.skrach_bg, shape: BoxShape.circle),
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(48), // Image radius
                    child:Image.network(url, fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text(desc),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
