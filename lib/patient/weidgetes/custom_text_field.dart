import 'package:flutter/material.dart';

class customtextformfield extends StatelessWidget {
  customtextformfield({
    this.hinttext,
    this.onchanged,
    this.labeltext,
    required String? Function(dynamic value) valuevaldiation,
  });
  String? hinttext;
  String? labeltext;
  Function(String)? onchanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'field required';
        }
      },
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
