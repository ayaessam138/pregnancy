import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pregancy/patient/cubit/kickcounter_cubit/kickcouter_state.dart';
import 'package:pregancy/patient/weidgetes/kickcountdata.dart';

import '../constants.dart';
import '../cubit/kickcounter_cubit/kickcounter_cubit.dart';

class kickcounter extends StatelessWidget {
  static String kickcounterid = 'kick';
  @override
  int? kickpoints;
  DateTime kicktime = DateTime.now();

  Widget build(BuildContext context) {
    return BlocConsumer<kickcouter, kickcounterstate>(
      listener: (context, state) {
        kickpoints = BlocProvider.of<kickcouter>(context).kickcounters;
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: kprimarycolor,
            title:  Text(
              'kickcounter'.tr(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          body: Column(children: [
            Center(
              child: Text(
                '${BlocProvider.of<kickcouter>(context).kickcounters}',
                style: const TextStyle(color: kprimarycolor, fontSize: 100),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kprimarycolor,
                    // minimumSize: Size(150, 50)
                  ),
                  onPressed: () {
                    BlocProvider.of<kickcouter>(context).showkicks();
                    BlocProvider.of<kickcouter>(context).increment(points: 1);
                  },
                  child:  Text(
                    "kick".tr(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kprimarycolor,
                    // minimumSize: Size(150, 50)
                  ),
                  onPressed: () {
                    BlocProvider.of<kickcouter>(context).addkick(
                        kickcount: kickpoints.toString(), kicktime: kicktime);
                  },
                  child:  Text(
                    'end'.tr(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kprimarycolor,
                    // minimumSize: Size(150, 50)
                  ),
                  onPressed: () {
                    BlocProvider.of<kickcouter>(context).showkicks();
                    BlocProvider.of<kickcouter>(context).reset();
                    ;
                  },
                  child:  Text(
                    'reset'.tr(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<kickcouter, kickcounterstate>(
              builder: (context, state) {
                if (state is kickcountsubmitted) {
                  if (state.kickcountlist!.isEmpty) {
                    return  Center(
                        child: Text(
                      'nokicksaddedyet'.tr(),
                      style: TextStyle(color: Colors.black),
                    ));
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.kickcountlist!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return kickcountdata(kick: state.kickcountlist![index]);
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              },
            )
          ]),
        );
      },
    );
  }
}
