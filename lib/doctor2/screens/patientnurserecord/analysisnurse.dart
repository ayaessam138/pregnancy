import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../doctor/cubit/getimages_cubit/getimages_cubit.dart';
import '../../../doctor/housescrrens/patientrecord/analysisbody.dart';
import '../../constant.dart';

class analysisnurse extends StatelessWidget {
  static String analysisnurseid = 'analysisnurse';
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
                    'Patient does not add analysis, yet',
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
