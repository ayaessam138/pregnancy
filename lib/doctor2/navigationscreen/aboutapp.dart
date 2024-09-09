import 'package:flutter/material.dart';

import '../../patient/HomePatientscrrens/guide/guidesubpage.dart';
import '../constant.dart';

class aboutapp extends StatelessWidget {
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
              'Nurse can take patient history and Updates through Assesment,Nurse can Take his Own Notes,Nurse can make preedections through predection form ,Nurse can Add events in calender,Nurse can view his reservations and determine his avalible appoitments,Nurse can view patient record wcich contain his analysis , assesmen,And predection result',
        ));
  }
}
