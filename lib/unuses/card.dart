// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
// class custtomcard extends StatelessWidget {
//   custtomcard(
//       {super.key,
//       required this.text,
//       required this.onTap,
//       required this.cardimage});
//
//   final String? text;
//   final VoidCallback onTap;
//   String cardimage;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: onTap,
//         child: Card(
//           child: Container(
//             margin: EdgeInsets.all(15),
//             width: 140,
//             padding: EdgeInsets.all(30),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Expanded(
//                   child: Image.asset(
//                     '$cardimage',
//                     width: 30,
//                     height: 30,
//                   ),
//                 ),
//                 Divider(
//                   height: 10,
//                   thickness: 1,
//                   endIndent: 30,
//                   indent: 14,
//                   color: Colors.grey,
//                 ),
//                 Expanded(
//                   child: Text(
//                     '$text',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }
