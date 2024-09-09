import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/doctor/cubit/getimages_cubit/getimages_cubit.dart';
import 'package:pregancy/doctor/housescrrens/patientrecord/analysisbody.dart';


import '../../constants.dart';

class analysisrecord extends StatelessWidget {
  static String analysisrecordid = 'analysisrecord';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('analysis'.tr()),
        backgroundColor: kprimarycolor,
      ),
      body: Column(
        children: [
          BlocBuilder<GetimagesCubit, GetimagesState>(
            builder: (context, state) {
              if (state is Getimagesstored) {
                if (state.imageslist.isEmpty) {
                  return Center(
                      child: Text(
                    'Patientdoesnotaddanalysisyet'.tr(),
                    style: TextStyle(color: Colors.black),
                  ));
                }
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.imageslist!.length,
                      itemBuilder: (context, index) {
                        return analysisbody(
                          image: state.imageslist![index],
                        );
                      }),
                );
              } else {
                return Center(child: Text('NoAnalysisaddedyet'.tr()));
              }
            },
          )
        ],
      ),
    );
  }
}
