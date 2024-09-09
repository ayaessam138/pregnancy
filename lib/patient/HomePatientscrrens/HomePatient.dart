import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:pregancy/patient/HomePatientscrrens/UploadAnalysis.dart';
import 'package:pregancy/patient/HomePatientscrrens/kickcounter.dart';

import 'package:pregancy/patient/HomePatientscrrens/notes/NotesView.dart';

import 'package:pregancy/patient/HomePatientscrrens/qusetions.dart';
import 'package:pregancy/patient/HomePatientscrrens/reservations/reservations.dart';
import 'package:pregancy/patient/HomePatientscrrens/reservations/rservationrole.dart';

import '../../doctor/house_weidghets/custtom_card.dart';
import 'guide.dart';

class HomePatient extends StatelessWidget {
  static String houseid = 'housepatient';

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              custtomcard(
                cardimage: 'assets/images/guide.png',
                text: 'guide'.tr(),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    guide.guideid,
                  );
                },
              ),
              custtomcard(
                cardimage: 'assets/images/notes.jpeg',
                text: 'notes'.tr(),
                onTap: () {
                  Navigator.pushNamed(context, NotesView.mainnoteid);
                },
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              custtomcard(
                cardimage: 'assets/images/reservations.jpeg',
                text: 'reservations'.tr(),
                onTap: () {
                  Navigator.pushNamed(
                      context, reservarionrole.reservarionroleid);
                },
              ),
              custtomcard(
                cardimage: 'assets/images/analysis.jpeg',
                text: 'analysis'.tr(),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Uplaodanalysis.analysisid,
                  );
                },
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              custtomcard(
                cardimage: 'assets/images/questions.jpeg',
                text: 'questions'.tr(),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    qusetions.qusetionsid,
                  );
                },
              ),
              custtomcard(
                cardimage: 'assets/images/kick.jpg',
                text: 'kickcounter'.tr(),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    kickcounter.kickcounterid,
                  );
                },
              )
            ],
          ),
        ),
        // Expanded(
        //   child: Row(
        //     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       custtomcard(
        //         cardimage: 'assets/images/appointments.jpeg',
        //         text: 'Pregancy Form',
        //         onTap: () {
        //           Navigator.pushNamed(
        //             context,
        //             pregancyform.pregancyformid,
        //           );
        //         },
        //       ),
        //       custtomcard(
        //         cardimage: 'assets/images/appointments.jpeg',
        //         text: 'page',
        //         onTap: () {
        //           Navigator.pushNamed(
        //             context,
        //             page.pageid,
        //           );
        //         },
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
