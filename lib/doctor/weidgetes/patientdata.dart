import 'package:flutter/material.dart';
import 'package:pregancy/doctor/screens/pregancyform.dart';
import '../constants.dart';

class patientdata extends StatelessWidget {
  // patientdata(
  //     {required this.patientid, required this.patientname, required this.id});
  // final String patientname;
  // final String patientid;
  // final String id;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Text(
        //   patientid,
        //   style: TextStyle(color: kprimarycolor),
        // ),
        // Text(
        //   patientname,
        //   style: TextStyle(color: kprimarycolor),
        // ),
        // TextButton.icon(
        //   onPressed: () {
        //     Navigator.pushNamed(context, pregancyform.pregancyformid);
        //   },
        //   icon: Icon(
        //     color: kprimarycolor,
        //     Icons.edit,
        //   ),
        //   label: Text(
        //     'Assesment',
        //     style:
        //         TextStyle(backgroundColor: kprimarycolor, color: Colors.white),
        //   ),
        // ),
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, pregancyform.pregancyformid);
            },
            child: Container(
              height: 25,
              decoration: BoxDecoration(
                  border: Border.all(color: kprimarycolor),
                  color: Colors.white),
              child: Center(
                child: Text(
                  'Assesment',
                  style: TextStyle(color: kprimarycolor),
                ),
              ),
            )),
        Stack(children: [
          IconButton(
              onPressed: () async {
                // BlocProvider.of<AddpatientCubit>(context).deletepatient(id: id);
              },
              icon: Icon(
                Icons.delete,
                color: kprimarycolor,
              )),
        ])
      ],
    );
  }
}
