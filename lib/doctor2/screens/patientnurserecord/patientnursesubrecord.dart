import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/doctor/house_weidghets/custtom_card.dart';
import 'package:pregancy/doctor2/cubit/predectionpatientbynurse%20_cubit/predectionpatientbynurse_cubit.dart';
import 'package:pregancy/doctor2/models/predectionpatientbynurse.dart';
import 'package:pregancy/doctor2/screens/patientnurserecord/analysisnurse.dart';
import 'package:pregancy/doctor2/screens/patientnurserecord/predectionpatientbynurse.dart';
import 'package:pregancy/doctor2/screens/patientnurserecord/predectionpatientbypatient.dart';
import 'package:pregancy/doctor2/screens/patientnurserecord/prededctiondoctorbynurse.dart';

import 'package:pregancy/patient/cubit/cubit/predection_patient_cubit.dart';

import '../../../doctor/cubit/getimages_cubit/getimages_cubit.dart';
import '../../constant.dart';
import '../../cubit/predectiondoctorbynurse_cubit/predectiondoctorbynurse_cubit.dart';

class patientnursesubrecord extends StatelessWidget {
  static String patientnursesubrecordid = 'patientnursesubrecord ';
  @override
  Widget build(BuildContext context) {
    final predection = ModalRoute.of(context)!.settings.arguments
        as predectionpatientbynursemodel;
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
                    BlocProvider.of<GetimagesCubit>(context)
                        .Getimages(email: predection.email!);
                    Navigator.pushNamed(
                      context,
                      analysisnurse.analysisnurseid,
                    );
                  },
                  cardimage: 'assets/images/analysisrec.png',
                  text: 'analysis'.tr()),
              custtomcard(
                  onTap: () {
                    BlocProvider.of<PredectionPatientCubit>(context)
                        .getprectiondpatient(email: predection.email!);
                    Navigator.pushNamed(
                        context,
                        predectionpatientbypatientrecord
                            .predectionpatientbypatientrecordid);
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
                    BlocProvider.of<PredectionPatientCubit>(context)
                        .getprectiondpatient(email: predection.email!);
                    Navigator.pushNamed(
                        context,
                        predectionpatientbynurserecord
                            .predectionpatientbynurserecordid);
                  },
                  cardimage: 'assets/images/pink pre.jpg',
                  text: 'PredictionPatientbyDoctor'.tr()),
              custtomcard(
                  text: 'predictionbyDoctor'.tr(),
                  onTap: () {
                    BlocProvider.of<PredectiondoctorbynurseCubit>(context)
                        .showpredectiondoctor(email: predection.email!);
                    Navigator.pushNamed(
                        context,
                        predectiondoctorbynurserecord
                            .predectiondoctorbynurserecordid);
                  },
                  cardimage: 'assets/images/pink pre.jpg')
            ],
          )),
        ],
      ),
    );
  }
}
