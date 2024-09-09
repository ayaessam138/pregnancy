import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pregancy/shared_screen/widghts/changeprofile.dart';
import 'package:sizer/sizer.dart';

import '../../patient/weidgetes/langdropdown.dart';
import '../weidgetes/aboutapp.dart';
import '../weidgetes/changelangugeprofile.dart';


import '../weidgetes/profileimage.dart';



class profileDoctor extends StatelessWidget {
  static String profileid = 'profile';

  //final CollectionReference drappointmentssref = FirebaseFirestore.instance.collection("dr");
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              profileimage(),
            ],
          ),
          changeprofile(),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          aboutapp(),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
