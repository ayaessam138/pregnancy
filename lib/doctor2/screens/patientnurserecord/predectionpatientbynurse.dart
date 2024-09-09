import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/doctor2/cubit/predectionpatientbynurse%20_cubit/predectionpatientbynurse_cubit.dart';
import 'package:pregancy/doctor2/screens/patientnurserecord/patientnurserecordwiedght/predectionpatientbynursecontanier.dart';


import '../../constant.dart';

class predectionpatientbynurserecord extends StatelessWidget {
  static String predectionpatientbynurserecordid =
      'predectionpatientbynurserecord';
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
            BlocBuilder<PredectionpatientbynurseCubit,
                PredectionpatientbynurseState>(builder: (context, state) {
              if (state is Predectionpatientbynursesubmitted) {
                if (state.predectionlist!.isEmpty) {
                  return Center(
                      child: Text('Nopredictionisdoneyet'.tr(),
                          style: TextStyle(color: Colors.black)));
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.predectionlist!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return predectionpatientbynursecontainer(
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
