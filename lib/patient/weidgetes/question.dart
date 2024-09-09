import 'package:flutter/material.dart';
import 'package:pregancy/patient/constants.dart';

class question extends StatelessWidget {
  question({required this.text, this.onPressed});
  VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color.fromARGB(255, 215, 212, 212)
      height: 70,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: kprimarycolor),
              ),
            ),
            IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: kprimarycolor,
                )),
          ],
        ),
      ),
    );
  }
}
