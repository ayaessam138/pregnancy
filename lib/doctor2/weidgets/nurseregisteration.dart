// import 'package:flutter/material.dart';

// import '../../doctor/weidgetes/custom_text_field.dart';

// class nurseregesterationweidget extends StatelessWidget {
//   nurseregesterationweidget({
//     required this.university,
//     required this.graduationYear,
//     required this.clinicLocation,
//     required this.ticketPrice,
//   });
//   TextEditingController university;
//   TextEditingController graduationYear;
//   TextEditingController clinicLocation;
//   TextEditingController ticketPrice;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         customtextformfield(
//           valuevaldiation: (value) {
//             if (value!.isEmpty) {
//               return 'field required';
//             }
//           },
//           labeltext: 'University',
//           hinttext: 'University',
//           controller: university,
//           // onchanged: (BloodGroupvalue) {
//           //   BloodGroup = BloodGroupvalue;
//           // },
//         ),
//         SizedBox(
//           height: 15,
//         ),
//         customtextformfield(
//           valuevaldiation: (value) {
//             if (value!.isEmpty) {
//               return 'field required';
//             }
//           },
//           fieldtype: TextInputType.text,
//           labeltext: 'Graduation Year',
//           hinttext: 'Graduation Year',
//           controller: graduationYear,
//           // onchanged: (RhFactorvalue) {
//           //   RhFactor = RhFactorvalue;
//           // },
//         ),
//         SizedBox(
//           height: 15,
//         ),
//         customtextformfield(
//           valuevaldiation: (value) {
//             if (value!.isEmpty) {
//               return 'field required';
//             }
//           },
//           fieldtype: TextInputType.text,
//           labeltext: 'Clinic Location',
//           hinttext: 'Clinic Location',
//           controller: clinicLocation,
//           // onchanged: (dynamic TORCHvalue) {
//           //   TORCH = TORCHvalue;
//           // },
//         ),
//         SizedBox(
//           height: 15,
//         ),
//         customtextformfield(
//           valuevaldiation: (value) {
//             if (value!.isEmpty) {
//               return 'field required';
//             }
//           },
//           fieldtype: TextInputType.number,
//           labeltext: 'Ticket Price',
//           hinttext: 'Ticket Price',
//           controller: ticketPrice,
//           // onchanged: (dynamic Sugarvalue) {
//           //   Sugar = Sugarvalue;
//           // },
//         ),
//         SizedBox(
//           height: 15,
//         ),
//       ],
//     );
//   }
// }
