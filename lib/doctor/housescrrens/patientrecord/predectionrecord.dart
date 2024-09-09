import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/doctor/cubit/cubit/predictionDoctor_cubit.dart';
import 'package:pregancy/doctor/cubit/pregancyform_cubit/pregancyform_cubit.dart';

import 'package:pregancy/doctor/housescrrens/patientrecord/predectiondata.dart';
import 'package:pregancy/doctor/models/predectiondoctor.dart';
import 'package:pregancy/doctor/models/pregnancyform.dart';

import 'package:pregancy/patient/cubit/cubit/predection_patient_cubit.dart';
import 'package:pregancy/patient/models/predectionpatient.dart';

import '../../constants.dart';

class predectionrecord extends StatefulWidget {
  static String predectionrecordid = 'predectionrecord';

  @override
  State<predectionrecord> createState() => _predectionrecordState();
}

class _predectionrecordState extends State<predectionrecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  // Navigator.pushNamed(context, search.searchid);
                },
                icon: Icon(Icons.search)),
          ],
          title: Text('predection'.tr()),
          backgroundColor: kprimarycolor,
        ),
        body: Column(
          children: [
            BlocBuilder<PredectionPatientCubit, PredectionPatientState>(
                builder: (context, state) {
              if (state is PredectionPatientsubmiited) {
                if (state.predectionlist!.isEmpty) {
                  return Center(
                      child: Text('Nopredictionisdoneyet'.tr(),
                          style: TextStyle(color: Colors.black)));
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.predectionlist!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return predectionpatientcontainer(
                          predection: state.predectionlist![index]);
                    },
                  ),
                );
                //  return Text('data');
              } else {
                return Center(
                    child: Text('Nopredictionisdoneyet'.tr(),
                        style: TextStyle(color: Colors.black)));
              }
            }),
          ],
        ));
  }
}
