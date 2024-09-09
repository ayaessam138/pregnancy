import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class custtomcard extends StatelessWidget {
  const custtomcard(
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
    return Expanded(
      child: Card(
        elevation: 20,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.pinkAccent.withAlpha(30),
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                  aspectRatio: 1.5,
                  child: Image.asset(
                    cardimage,
                  )),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: kprimarycolor,
              ),
              Text(
                text,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
