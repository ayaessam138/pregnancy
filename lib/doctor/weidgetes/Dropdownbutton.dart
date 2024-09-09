import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/doctor/cubit/pregancyform_cubit/pregancyform_cubit.dart';

import '../constants.dart';

class Dropdownbuttonformfield extends StatelessWidget {
  Dropdownbuttonformfield({required this.text, required this.onchanged});
  String text;
  Function(dynamic)? onchanged;

  List<String> dropDwonListValue = ['Normal', 'AbNormal'];

  String dropDwonValue = 'Normal';

  String? fieldvalue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: fieldvalue,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 233, 221, 221))),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 233, 216, 216))),
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),),
        label: Text(text),
      ),
      items: dropDwonListValue.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          child: Text(value),
          value: value,
        );
      }).toList(),
      onChanged: onchanged,
    );
  }
}

class Dropdownbuttonformfield2 extends StatelessWidget {
  Dropdownbuttonformfield2({required this.text, required this.onchanged});
  String text;
  Function(dynamic)? onchanged;

  List<String> dropDwonListValue = ['yes', 'no'];

  String dropDwonValue = 'yes';

  String? fieldvalue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: fieldvalue,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 233, 221, 221))),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 233, 216, 216))),
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),),
        label: Text(text),
      ),
      items: dropDwonListValue.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          child: Text(value),
          value: value,
        );
      }).toList(),
      onChanged: onchanged,
    );
  }
}

// class Dropdownbuttonformfield3 extends StatelessWidget {
//   Dropdownbuttonformfield3({required this.text, required this.onchanged});
//   String text;
//   Function(dynamic)? onchanged;

//   String dropDwonValue = 'name';

//   String? fieldvalue;

//   @override
//   Widget build(BuildContext context) {
//     List<String> dropDwonListValue =
//         BlocProvider.of<PregancyformCubit>(context).usersList;
//     return DropdownButtonFormField(
//       value: fieldvalue,
//       decoration: InputDecoration(
//         enabledBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Color.fromARGB(255, 158, 149, 149))),
//         border: const OutlineInputBorder(
//             borderSide: BorderSide(color: Color.fromARGB(255, 233, 216, 216))),
//         // border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),),
//         label: Text(text),
//       ),
//       items: dropDwonListValue.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           child: Text(value),
//           value: value,
//         );
//       }).toList(),
//       onChanged: onchanged,
//     );
//   }
// }

class Dropdownbuttonformfield4 extends StatelessWidget {
  Dropdownbuttonformfield4({required this.text, required this.onchanged, required this.fieldvalue});
  String text;
  Function(dynamic)? onchanged;

  // String dropDwonValue = 'yes';

  Map<String,dynamic>? fieldvalue;

  @override
  Widget build(BuildContext context) {
    print(fieldvalue);

    List<Map<String, dynamic>> dropDwonListValue =
        BlocProvider.of<PregancyformCubit>(context).usersList;
    print('dropDwonListValue');
    print(dropDwonListValue);
    return dropDwonListValue.isNotEmpty?DropdownButtonFormField(
      value: fieldvalue,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 233, 221, 221))),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 233, 216, 216))),
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),),
        label: Text(text),
      ),
      items: dropDwonListValue.map<DropdownMenuItem<Map<String, dynamic>>>(
          (dynamic value) {
        return DropdownMenuItem<Map<String, dynamic>>(
          child: Text(value['username']),
          value: value,
        );
      }).toList(),
      onChanged: onchanged,
    ):Text('No Nurse Registeried , Yet');
  }
}
