import 'package:flutter/material.dart';

class appNavigation extends StatefulWidget {
  static String appNavigationid ='appNavigation';
  const appNavigation({Key? key}) : super(key: key);

  @override
  State<appNavigation> createState() => _appNavigationState();
}

class _appNavigationState extends State<appNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: [
          TextButton(onPressed: (){
            //Navigator.push(context, MaterialPageRoute(builder:(context) => ));
          }, child: Text('Patient'))
        ],
      ),
    );
  }
}
