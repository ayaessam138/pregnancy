import 'package:flutter/material.dart';

class customtextformfield extends StatelessWidget {
  customtextformfield(
      {this.hinttext,
      this.onchanged,
      this.labeltext,
      this.fieldtype,
      this.controller,
      required this.valuevaldiation,
      required this.foucusnode});
  String? hinttext;
  String? labeltext;
  FormFieldValidator<String> valuevaldiation;
  FocusNode? foucusnode;
  Function(dynamic)? onchanged;
  TextInputType? fieldtype;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: foucusnode,
      controller: controller,
      keyboardType: fieldtype,
      validator: valuevaldiation,
      onChanged: onchanged,
      decoration: InputDecoration(
          labelText: labeltext,
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 233, 221, 221))),
          border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 233, 216, 216)))),
    );
  }
}

// class fieldLabel extends StatelessWidget {
//   String fieldlabel;
//   fieldLabel({required this.fieldlabel});

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       fieldlabel,
//       style: TextStyle(fontWeight: FontWeight.bold),
//     );
//   }
// }
