import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/doctor/housescrrens/patientrecord/patientrecordbody.dart';


import '../../constants.dart';
import '../../cubit/pregancyform_cubit/pregancyform_cubit.dart';

class patientrecord extends StatelessWidget {
  static String patientrecordid = 'patientrecord';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimarycolor,
        title: Text(
          'patients'.tr(),
          style: const TextStyle(),
        ),
      ),
      body: Column(
        children: [
          BlocBuilder<PregancyformCubit, PregancyformState>(
            builder: (context, state) {
              if (state is pregancyformsubitted) {
                if (state.pregnancyformlist!.isEmpty) {
                  return  Center(
                      child: Text(
                    'nopatientsaddedyet'.tr(),
                    style: const TextStyle(color: Colors.black),
                  ));
                }
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.pregnancyformlist!.length,
                      itemBuilder: (context, index) {
                        return patientrecordbody(
                          pregancy: state.pregnancyformlist![index],
                        );
                      }),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      ),
    );
  }
}
