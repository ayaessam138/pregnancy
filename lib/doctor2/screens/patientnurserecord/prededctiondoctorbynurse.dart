import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/doctor2/cubit/predectiondoctorbynurse_cubit/predectiondoctorbynurse_cubit.dart';
import 'package:pregancy/doctor2/screens/patientnurserecord/patientnurserecordwiedght/predectiondoctorbynursecontanier.dart';


import '../../constant.dart';

class predectiondoctorbynurserecord extends StatelessWidget {
  static String predectiondoctorbynurserecordid =
      'predectiondoctorbynurserecord';
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
            BlocBuilder<PredectiondoctorbynurseCubit,
                PredectiondoctorbynurseState>(builder: (context, state) {
              if (state is Predectiondoctorbynursesubmitted) {
                if (state.predectionlist!.isEmpty) {
                  return Center(
                      child: Text('Nopredictionisdoneyet'.tr(),
                          style: TextStyle(color: Colors.black)));
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.predectionlist!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return predectiondoctorbynursecontainer(
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
