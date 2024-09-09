import 'package:flutter/material.dart';
import 'package:pregancy/patient/constants.dart';

class GuideContainer extends StatelessWidget {
  GuideContainer({required this.text, this.onPressed});
  VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
        left: BorderSide(color: Colors.transparent),
        top: BorderSide(color: Colors.transparent),
        right: BorderSide(color: Colors.transparent),
        bottom: BorderSide(width: 1, color: Color.fromARGB(255, 215, 212, 212)),
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
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: kprimarycolor),
            ),
            const Spacer(),
            IconButton(
                onPressed: onPressed, icon: const Icon(Icons.arrow_drop_down)),
          ],
        ),
      ),
    );
  }
}
