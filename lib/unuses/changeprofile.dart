// import 'package:flutter/material.dart';
// import 'package:pregancy/doctor/constants.dart';
// import 'package:pregancy/patient/NavgationPatientscreens/change_profile_screen.dart';
//
// import '../../doctor/screens/change_profile_screen.dart';
//
// class changeprofile extends StatelessWidget {
//   const changeprofile({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Icon(
//           Icons.edit_note_rounded,
//           color: kprimarycolor,
//           size: 35,
//         ),
//         Expanded(
//           child: Container(
//             width: double.infinity,
//             height: 50,
//             alignment: AlignmentDirectional.centerStart,
//             child: MaterialButton(
//               onPressed: () {
//                 Navigator.pushNamed(
//                     context, ChangePatientProfile.ChangePatientProfileid);
//                 // Navigator.push(context,
//                 //     MaterialPageRoute(builder: (BuildContext context) {
//                 //   return ChangePatientProfile();
//                 // }));
//               },
//               child: Text(
//                 'change profile',
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
