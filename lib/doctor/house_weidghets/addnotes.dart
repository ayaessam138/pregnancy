import 'package:flutter/material.dart';

import '../constants.dart';

class addnotes extends StatelessWidget {
  static String addnotesid = 'addnotes';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: kprimarycolor),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                  decoration: InputDecoration(
                      hintText: 'Note',
                      hintStyle: TextStyle(color: Colors.grey)),
                  scrollPadding: EdgeInsets.all(20.0),
                  keyboardType: TextInputType.multiline,
                  maxLines: 999999, // 3dd al lines ms7mos ktba fehA
                  autofocus: true // bt5ly keyboard tft7 awl ma aft7 page,
                  )
            ],
          ),
        ),
      ),
    );
  }
}
