import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/doctor/cubit/cubit/predictionDoctor_cubit.dart';
import 'package:pregancy/doctor/cubit/getimages_cubit/getimages_cubit.dart';
import 'package:pregancy/doctor/housescrrens/patientrecord/analysisrecord.dart';
import 'package:pregancy/doctor/housescrrens/patientrecord/assesmentrecord.dart';
import 'package:pregancy/doctor/housescrrens/patientrecord/predectiondoctorrecord.dart';
import 'package:pregancy/doctor/housescrrens/patientrecord/predectionrecord.dart';
import 'package:pregancy/doctor/screens/reservationrecord.dart';
import 'package:pregancy/doctor/models/predectiondoctor.dart';
import 'package:pregancy/doctor/models/pregnancyform.dart';

import 'package:pregancy/patient/cubit/cubit/predection_patient_cubit.dart';
import 'package:pregancy/patient/models/predectionpatient.dart';

import '../../../shared_screen/widghts/custtom_card.dart';
import '../../constants.dart';
import '../../cubit/pregancyform_cubit/pregancyform_cubit.dart';

class patientsubrecord extends StatelessWidget {
  static String patientsubrecordid = 'patientsubrecord';
  patientsubrecord();

  @override
  Widget build(BuildContext context) {
    final pregancy =
        ModalRoute.of(context)!.settings.arguments as pregancyformmodel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimarycolor,
        title: Text(
          'PatientsRecord'.tr(),
          style: TextStyle(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              custtomcard(
                  onTap: () {
                    Navigator.pushNamed(
                        context, assesmentrecord.assesmentrecordid,
                        arguments: pregancy);
                  },
                  cardimage: 'assets/images/assesmentpink.png',
                  text: 'assessment'.tr()),
              custtomcard(
                  onTap: () {
                    BlocProvider.of<PredectionPatientCubit>(context)
                        .getprectiondpatient(email: pregancy.email!);
                    Navigator.pushNamed(
                      context,
                      predectionrecord.predectionrecordid,
                    );
                  },
                  cardimage: 'assets/images/pink pre.jpg',
                  text: 'predectionByPatient'.tr())
            ],
          )),
          Expanded(
              child: Row(
            children: [
              custtomcard(
                  onTap: () {
                    // Provider.of(context, listen: false);
                    BlocProvider.of<GetimagesCubit>(context)
                        .Getimages(email: pregancy.email!);
                    Navigator.pushNamed(
                        context, analysisrecord.analysisrecordid);
                  },
                  cardimage: 'assets/images/analysisrec.png',
                  text: 'analysis'.tr()),
              custtomcard(
                  text: 'predictionbyDoctor'.tr(),
                  onTap: () {
                    BlocProvider.of<PredictionDoctorCubit>(context)
                        .showpredectiondoctor(email: pregancy.email!);
                    Navigator.pushNamed(
                      context,
                      predectiondoctorrecord.predectiondoctorrecordid,
                    );
                  },
                  cardimage: 'assets/images/pink pre.jpg')
            ],
          )),
          // Expanded(
          //     child: Row(
          //   children: [
          //     custtomcard(
          //         text: 'Predection by Doctor',
          //         onTap: () {
          //           BlocProvider.of<PredictionDoctorCubit>(context)
          //               .showpredectiondoctor(email: pregancy.email!);
          //           Navigator.pushNamed(
          //             context,
          //             predectiondoctorrecord.predectiondoctorrecordid,
          //           );
          //         },
          //         cardimage: 'assets/images/pink pre.jpg')
          //   ],
          // ))
        ],
      ),
    );
  }
}
