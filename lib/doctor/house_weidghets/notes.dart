import 'package:flutter/material.dart';

import '../../patient/constants.dart';
import 'addnotes.dart';

class notes extends StatelessWidget {
  // static String notesid = 'notes';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kprimarycolor,
          title: Text(
            "Notes",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, addnotes.addnotesid);
          },
          backgroundColor: kprimarycolor,
          child: const Icon(Icons.add),
        ));
  }
}
