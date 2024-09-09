import 'package:flutter/material.dart';


import '../constants.dart';
import '../models/kickcount.dart';

class kickcountdata extends StatelessWidget {
  kickcountdata({required this.kick});
  @override
  final kickcounts kick;
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: Colors.transparent),
            top: BorderSide(color: Colors.transparent),
            right: BorderSide(color: Colors.transparent),
            bottom: BorderSide(width: 1, color: Color.fromARGB(255, 215, 212, 212)),
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
                child: Text(
                  'Counts:' + kick.kickcount!,
                  style: TextStyle(
                    color: kprimarycolor,
                  ),
                )),
            Expanded(
                child: Text(
                  'Date:' + kick.kicktime.toString(),
                  style: TextStyle(
                    color: kprimarycolor,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
