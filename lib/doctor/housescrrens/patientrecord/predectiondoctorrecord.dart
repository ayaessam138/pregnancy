import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/doctor/constants.dart';
import 'package:pregancy/doctor/cubit/cubit/predictionDoctor_cubit.dart';
import 'package:pregancy/doctor/housescrrens/patientrecord/predectiondata.dart';


class predectiondoctorrecord extends StatelessWidget {
  static String predectiondoctorrecordid = 'predectiondoctorrecord';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('predection'.tr()),
          backgroundColor: kprimarycolor,
        ),
        body: Column(
          children: [
            BlocBuilder<PredictionDoctorCubit, PredictionDoctorState>(
              builder: (context, state) {
                if (state is PredictionDoctorsubmitted) {
                  if (state.predectionlist!.isEmpty) {
                    return Center(
                        child: Text(
                      'Nopredictionisdoneyet'.tr(),
                      style: TextStyle(color: Colors.black),
                    ));
                  }
                  return Expanded(
                      child: ListView.builder(
                    itemCount: state.predectionlist!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return predectiondoctorcontainer(
                        predection: state.predectionlist![index],
                      );
                    },
                  ));
                } else {
                  return Center(
                      child: Text('Nopredictionisdoneyet'.tr(),
                          style: TextStyle(color: Colors.black)));
                }
              },
            )
          ],
        ));
  }
}
