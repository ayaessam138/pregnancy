import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/doctor/cubit/pregancyform_cubit/pregancyform_cubit.dart';

import 'package:pregancy/doctor/housescrrens/patientassesment/patientsassesment.dart';
import 'package:pregancy/doctor/housescrrens/patientrecord/partientrecord.dart';

import 'package:pregancy/doctor/models/pregnancyform.dart';
import 'package:pregancy/doctor/screens/dr%20registration.dart';
import 'package:pregancy/doctor/screens/dr_appointments.dart';
import 'package:pregancy/doctor/screens/prediction.dart';
import 'package:pregancy/doctor2/screens/nurseregesteration.dart';


import 'package:pregancy/doctor/screens/predectionpatientbydoctor.dart';
import 'package:pregancy/patient/HomePatientscrrens/notes/NotesView.dart';

import '../house_weidghets/custtom_card.dart';

import '../house_weidghets/notes.dart';

class housedoctor extends StatelessWidget {
  static String houseid = 'housedoctor';

  @override
  Widget build(BuildContext context) {
    final pregancy =
        ModalRoute.of(context)?.settings.arguments as pregancyformmodel?;
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              custtomcard(
                cardimage:
                    'assets/images/womwn-fotor-bg-remover-20230608201219.png',
                text: 'patients'.tr(),
                onTap: () {
                  BlocProvider.of<PregancyformCubit>(context)
                      .showpregnancyformdata();
                  Navigator.pushNamed(context, patients.patientsid,
                      arguments: pregancy);
                },
              ),
              custtomcard(
                cardimage: 'assets/images/nootes.jpg',
                text: 'notes'.tr(),
                onTap: () {
                  Navigator.pushNamed(context, NotesView.mainnoteid);
                },
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              custtomcard(
                cardimage: 'assets/images/regesteration pink.jpg',
                text: 'reservationregister'.tr(),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                      nurseregesterations.nurseregesterationsid
                  );
                },
              ),
              custtomcard(
                cardimage: 'assets/images/medical record.jpg',
                text: 'PatientsRecord'.tr(),
                onTap: () {
                  BlocProvider.of<PregancyformCubit>(context)
                      .showpregnancyformdata();
                  Navigator.pushNamed(context, patientrecord.patientrecordid,
                      arguments: pregancy);
                },
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              custtomcard(
                cardimage: 'assets/images/pink pre.jpg',
                text: 'predection'.tr(),
                onTap: () {
                  Navigator.pushNamed(context,
                      predectionpatientbydoctor.predectionpatientbydoctorid);
                },
              ),
              custtomcard(
                cardimage: 'assets/images/appoitments22.png',
                text: 'appoitments'.tr(),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    doctor_appointments.appointmentsidd,
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
