import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/doctor/house_weidghets/custtom_card.dart';
import 'package:pregancy/doctor2/cubit/predectionpatientbynurse%20_cubit/predectionpatientbynurse_cubit.dart';
import 'package:pregancy/doctor2/screens/patientnurserecord/analysisnurse.dart';
import 'package:pregancy/doctor2/screens/patientnurserecord/patientnurserecordwiedght/patientnurseecordbody.dart';
import 'package:pregancy/doctor2/screens/patientnurserecord/predectionpatientbynurse.dart';
import 'package:pregancy/doctor2/screens/patientnurserecord/predectionpatientbypatient.dart';
import 'package:pregancy/doctor2/screens/patientnurserecord/prededctiondoctorbynurse.dart';


import '../../constant.dart';

class patientnurserecord extends StatefulWidget {
  static String patientnurserecordid = 'patientnurserecord ';

  @override
  State<patientnurserecord> createState() => _patientnurserecordState();
}

class _patientnurserecordState extends State<patientnurserecord> {
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
          BlocBuilder<PredectionpatientbynurseCubit,
              PredectionpatientbynurseState>(
            builder: (context, state) {
              if (state is Predectionpatientbynursesubmitted) {
                if (state.predectionlist!.isEmpty) {
                  return  Center(
                      child: Text(
                    'nopatientsaddedyet'.tr(),
                    style: TextStyle(color: Colors.black),
                  ));
                }
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.predectionlist!.length,
                      itemBuilder: (context, index) {
                        return patientnurserecordbody(
                          predection: state.predectionlist![index],
                        );
                      }),
                );
              } else if(state is Predectionpatientbynurseloading) {
                return const Center(child: CircularProgressIndicator());
              }
              else{
                return Center(child: Text('Try Later'));
              }
            },
          )
        ],
      ),
    );
  }
}
