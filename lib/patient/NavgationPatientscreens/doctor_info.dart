import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pregancy/patient/constants.dart';

class doctorInfo extends StatefulWidget {
  static String doctorInfoid = 'doctorInfo';

  const doctorInfo({Key? key}) : super(key: key);

  @override
  State<doctorInfo> createState() => _doctorInfoState();
}

class _doctorInfoState extends State<doctorInfo> {
  @override
  Widget build(BuildContext context) {
    List users = [];
    return Container(
      alignment: AlignmentDirectional.topStart,
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.grey[500],
        borderRadius: BorderRadiusDirectional.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${users[0]['myusername']}",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "university: ${users[0]['University']}",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            Text(
              "Graduation year:${users[0]['Graduation Year']}",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            Text(
              "clinic location:${users[0]['Clinic Location']}",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            Text(
              "Ticket Price:${users[0]['Ticket Price']}",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
