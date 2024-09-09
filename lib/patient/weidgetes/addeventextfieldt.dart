import 'package:flutter/material.dart';

import '../constants.dart';

class addeventTextField extends StatelessWidget {
  addeventTextField({required this.hint, required this.controller});
  String hint;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: hint ?? '',
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kprimarycolor, width: 1.5),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kprimarycolor, width: 1.5),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
      ),
    );
  }
}
