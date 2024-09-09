import 'package:flutter/material.dart';

import '../constants.dart';

// class assesmentsubtitle extends StatelessWidget {
//   assesmentsubtitle({super.key, required this.title});
//   String title;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//            border: Border.all(color: kprimarycolor),
//           // borderRadius: BorderRadius.circular(12)
//           ),
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Text(
//           title,
//           style: TextStyle(
//             color: kprimarycolor,
//             fontSize: 35,
//           ),
//         ),
//       ),
//     );
//   }
// }
class assesmentsubtitle extends StatelessWidget {
  assesmentsubtitle({required this.text, this.onPressed});
  VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          left: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          bottom:
              BorderSide(width: 1, color: Color.fromARGB(255, 215, 212, 212)),
        )),
        // color: Color.fromARGB(255, 215, 212, 212)
        height: 50,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: kprimarycolor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
