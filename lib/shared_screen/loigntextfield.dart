import 'package:flutter/material.dart';

class textfield extends StatelessWidget {
  textfield({required this.hinttext});
  String? hinttext;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          hintText: hinttext,
          border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
    );
  }
}
