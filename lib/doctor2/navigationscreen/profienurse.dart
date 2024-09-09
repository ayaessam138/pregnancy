import 'package:flutter/material.dart';
import 'package:pregancy/doctor2/navigationscreen/aboutapp.dart';
import 'package:pregancy/unuses/cahangeprofilenurse.dart';
import 'package:pregancy/doctor2/weidgets/aboutappnurse.dart';
import 'package:pregancy/shared_screen/widghts/changeprofile.dart';

import '../../doctor/weidgetes/profileimage.dart';

class profilenurse extends StatelessWidget {
  static String profilenurseid = 'profilenurse';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
          aboutappnurse(),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
