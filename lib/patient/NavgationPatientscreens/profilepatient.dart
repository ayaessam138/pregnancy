// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import 'package:sizer/sizer.dart';
// import 'package:intl/intl.dart';
// import '../../doctor/weidgetes/changeprofile.dart';
// import '../../doctor/weidgetes/langdropdown.dart';
// import '../../doctor/weidgetes/lastperiodprofile.dart';
// import '../../doctor/weidgetes/profileimage.dart';
// import '../weidgetes/aboutapp.dart';
// import '../weidgetes/changelangugeprofile.dart';
// import '../weidgetes/periodofpregnacy.dart';
// import 'package:pregancy/core/globalData.dart';
//
// class profile extends StatefulWidget {
//   static String profileid = 'profile';
//
//   @override
//   State<profile> createState() => _profileState();
// }
//
// class _profileState extends State<profile> {
//   String? reslut;
//   String? birthTime;
//   Future<String> getdays() async {
//     await FirebaseFirestore.instance
//         .collection("users")
//         .doc(globalData.userData!["userid"])
//         .get()
//         .then((value) {
//       reslut = value.get('Delvier Time').toString();
//     });
//     print('====================$reslut');
//     DateTime date = DateFormat('M/d/y').parse(reslut!);
//
//     DateTime givenDate = DateTime(date.year, date.month, date.day);
//     DateTime currentDate = DateTime.now();
//
//     Duration difference = givenDate.difference(currentDate);
//     int differenceInDays = difference.inDays;
//
//     int differenceInMonths = differenceInDays ~/ 30;
//     int remainingDays = differenceInDays % 30;
//
//     birthTime =
//         'you will deliver your birth in $differenceInMonths/$remainingDays/${date.year}';
//     print('====================$birthTime');
//     return birthTime!;
//   }
//
//   // bool lagdropdownvisibility = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: getdays(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     profileimage(),
//
//                     // periodofpregancy(),
//                   ],
//                 ),
//                 // lastperiodprofile(),
//                 // Divider(
//                 //   color: Colors.grey,
//                 //   thickness: 1,
//                 // ),
//                 // changelanguageprofile(
//                 //   onpressed: () {
//                 //     setState(() {
//                 //       lagdropdownvisibility = !lagdropdownvisibility;
//                 //     });
//                 //   },
//                 // ),
//                 // Visibility(
//                 //     visible: lagdropdownvisibility,
//                 //     child: Align(
//                 //       alignment: Alignment.topLeft,
//                 //       child: Column(
//                 //         children: [
//                 //           langdropdown(),
//                 //         ],
//                 //       ),
//                 //     )),
//                 // Divider(
//                 //   color: Colors.grey,
//                 //   thickness: 1,
//                 // ),
//                 Text(birthTime ?? '', style: TextStyle(color: Colors.red)),
//                 changeprofile(),
//                 Divider(
//                   color: Colors.grey,
//                   thickness: 1,
//                 ),
//                 aboutapp(),
//                 Divider(
//                   color: Colors.grey,
//                   thickness: 1,
//                 ),
//               ],
//             );
//           } else if (snapshot.hasError) {
//
//             return Text('data');
//           } else {
//             return CircularProgressIndicator();
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/patient/cubit/ProfilePatient/patientprofile_cubit.dart';
import 'package:pregancy/shared_screen/widghts/changeprofile.dart';

import 'package:sizer/sizer.dart';


import '../../doctor/weidgetes/langdropdown.dart';
import '../../doctor/weidgetes/lastperiodprofile.dart';
import '../../doctor/weidgetes/profileimage.dart';
import '../weidgetes/aboutapp.dart';
import '../weidgetes/changelangugeprofile.dart';
import '../weidgetes/periodofpregnacy.dart';
import 'package:pregancy/core/globalData.dart';

class profilepatient extends StatelessWidget {
  static String profileid = 'profile';

  // bool lagdropdownvisibility = false;
  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<PatientprofileCubit>(context).GetDeliveryDate();
    return BlocProvider(
      create: (context) => PatientprofileCubit()..GetDeliveryDate,
      child: Scaffold(
          body: BlocConsumer<PatientprofileCubit, PatientprofileState>(
            listener: (BuildContext context, PatientprofileState state) {
              if (state is GetDeliveytimeLoading) {
                Center(child: CircularProgressIndicator());
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      profileimage(),
                    ],
                  ),
                  Text(BlocProvider
                      .of<PatientprofileCubit>(context)
                      .birthTime ?? '',
                      style: const TextStyle(color: Colors.red)),
                  const changeprofile(),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  const aboutapp(),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ],
              );
            },
          )),
    );
  }
}

// lastperiodprofile(),
// Divider(
//   color: Colors.grey,
//   thickness: 1,
// ),
// changelanguageprofile(
//   onpressed: () {
//     setState(() {
//       lagdropdownvisibility = !lagdropdownvisibility;
//     });
//   },
// ),
// Visibility(
//     visible: lagdropdownvisibility,
//     child: Align(
//       alignment: Alignment.topLeft,
//       child: Column(
//         children: [
//           langdropdown(),
//         ],
//       ),
//     )),
// Divider(
//   color: Colors.grey,
//   thickness: 1,
// ),
