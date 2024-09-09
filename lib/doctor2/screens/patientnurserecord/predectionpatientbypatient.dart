import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/doctor/housescrrens/patientrecord/predectiondata.dart';

import 'package:pregancy/patient/cubit/cubit/predection_patient_cubit.dart';

import '../../constant.dart';

class predectionpatientbypatientrecord extends StatelessWidget {
  static String predectionpatientbypatientrecordid =
      'predectionpatientbypatientrecord';
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
