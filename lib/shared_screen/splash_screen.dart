// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:pregancy/core/globalData.dart';
// import 'package:pregancy/doctor/screens/DoctorLayout.dart';
// import 'package:pregancy/doctor2/navigationscreen/LayoutNurse.dart';
// import 'package:pregancy/doctor2/screens/homenurse.dart';
// import 'package:pregancy/patient/screens/LayoutPatient.dart';
// import 'package:pregancy/shared_screen/loginScreen.dart';
//
// import '../storage/storage_keys.dart';
// import '../storage/storage_repo_impl.dart';
//
// class splashScreen extends StatefulWidget {
//   const splashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<splashScreen> createState() => _splashScreenState();
// }
//
// class _splashScreenState extends State<splashScreen> {
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 3)).then((value) async {
//       if (await StorageRepoImpl().isContain(StorageKeys.userdata)) {
//         String? data = await StorageRepoImpl().read(StorageKeys.userdata);
//         globalData.userData = json.decode(data!);
//         if (globalData.userData!["type"] == "doctor") {
//           Navigator.of(context)
//               .pushNamedAndRemoveUntil(DoctorLayout.homeid, (route) => false);
//         } else if (globalData.userData!["type"] == "nurse") {
//           Navigator.of(context).pushNamedAndRemoveUntil(
//               LayOutNurse.homenursepageid, (route) => false);
//         } else {
//           Navigator.of(context)
//               .pushNamedAndRemoveUntil(LayoutPatient.homeid, (route) => false);
//         }
//       } else {
//         Navigator.of(context)
//             .pushNamedAndRemoveUntil(Login.logid, (route) => false);
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Image.asset("assets/images/logo22.jpeg"),
//       ),
//     );
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pregancy/core/globalData.dart';
import 'package:pregancy/doctor/screens/DoctorLayout.dart';
import 'package:pregancy/doctor2/navigationscreen/LayoutNurse.dart';
import 'package:pregancy/doctor2/screens/homenurse.dart';
import 'package:pregancy/patient/NavgationPatientscreens/LayoutPatient.dart';
import 'package:pregancy/shared_screen/cache_helper.dart';
import 'package:pregancy/shared_screen/loginScreen.dart';

import '../unuses/storage/storage_repo_impl.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) async {
      if (CacheHelper.getData(key: 'Userrole') == "doctor") {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(DoctorLayout.homeid, (route) => false);
      } else if (CacheHelper.getData(key: 'Userrole') == "nurse") {
        Navigator.of(context).pushNamedAndRemoveUntil(
            LayOutNurse.homenursepageid, (route) => false);
      } else if (CacheHelper.getData(key: 'Userrole') == 'patient') {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(LayoutPatient.homeid, (route) => false);
      } else {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(Login.logid, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('CacheHelper.getData(key: ))');
    print(CacheHelper.getData(key: 'Userrole'));
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/logo22.jpeg"),
      ),
    );
  }
}
