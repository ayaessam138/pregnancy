import 'package:flutter/material.dart';

import '../constants.dart';

class Subtitleofpregnacyform extends StatelessWidget {
  Subtitleofpregnacyform({required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: kprimarycolor, fontSize: 24),
      ),
    );
  }
}
