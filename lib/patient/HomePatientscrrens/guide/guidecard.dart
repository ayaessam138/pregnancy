import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pregancy/patient/constants.dart';

class guidecard extends StatelessWidget {
  const guidecard(
      {Key? key,
      required this.onTap,
      required this.cardimage,
      required this.text})
      : super(key: key);
  final VoidCallback onTap;
  final String cardimage;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              border: Border.all(color: Color.fromARGB(255, 215, 212, 212))),
          child: Row(
            children: [
              Image.asset(
                cardimage,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 35,
              ),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(color: kprimarycolor),
                ),
              ),
              SizedBox(
                width: 35,
              )
            ],
          ),
        ),
      ),
    );
  }
}
