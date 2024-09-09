import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/doctor/housescrrens/patientassesment/search.dart';
import 'package:pregancy/doctor/screens/pregancyform.dart';
import '../../constants.dart';
import '../../cubit/pregancyform_cubit/pregancyform_cubit.dart';
import '../../weidgetes/custom_text_field.dart';
import 'patientcontainer.dart';
import '../../weidgetes/patientpagehead.dart';

class patients extends StatefulWidget {
  static String patientsid = 'patient';
  const patients({Key? key}) : super(key: key);

  @override
  State<patients> createState() => _patientsState();
}

class _patientsState extends State<patients> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, search.searchid);
                },
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, pregancyform.pregancyformid);
                },
                icon: const Icon(Icons.add)),
          ],
          title: Text('patients'.tr()),
          backgroundColor: kprimarycolor,
        ),
        body: Column(children: [
          BlocBuilder<PregancyformCubit, PregancyformState>(
              builder: (context, state) {
            if (state is pregancyformsubitted) {
              if (state.pregnancyformlist.isEmpty) {
                return Center(
                    child: Text(
                  'nopatientsaddedyet'.tr(),
                  style: const TextStyle(color: Colors.black),
                ));
              }
              return Expanded(
                child: ListView.builder(
                    itemCount: state.pregnancyformlist!.length,
                    itemBuilder: (context, index) {
                      return patientcontainer(
                        pregancy: state.pregnancyformlist![index],
                      );
                    }),
              );
            } 
            else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
        ])
        );
  }
}
