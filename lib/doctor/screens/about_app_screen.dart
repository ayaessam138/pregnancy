import 'package:flutter/material.dart';
import 'package:pregancy/doctor/constants.dart';
import 'package:pregancy/patient/HomePatientscrrens/guide/guidesubpage.dart';


class AboutAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('About App'),
          backgroundColor: kprimarycolor,
        ),
        body: guidesubpagemain(
          title: 'PFU',
          text:
              'Doctor can take patient history and Updates through Assesment,Doctor can Take his Own Notes,Doctor can make preedections through predection form ,Doctor can Add events in calender,Doctor can view his reservations and determine his avalible appoitments,Doctor can view patient record wcich contain his analysis , assesmen,And predection result',
        ));
  }
}
