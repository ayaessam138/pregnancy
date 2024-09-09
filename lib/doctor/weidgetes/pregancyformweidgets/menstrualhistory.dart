import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../custom_text_field.dart';

class menstrualhistory extends StatelessWidget {
  menstrualhistory(
      {required this.DurationofMenses,
      required this.IntervalofCycle,
      required this.AgeOfMenrache,
      required this.durationofMenses,
      required this.intervalofCycle,
      required this.ageOfMenrache});
  TextEditingController DurationofMenses, IntervalofCycle, AgeOfMenrache;
  FocusNode durationofMenses, intervalofCycle, ageOfMenrache;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customtextformfield(
          valuevaldiation: (value) {
            if (value!.isEmpty) {
              return 'fieldrequired'.tr();
            }
          },
          fieldtype: TextInputType.number,
          labeltext: 'ageOfMenarche'.tr(),
          hinttext: 'ageOfMenarche'.tr(),
          controller: AgeOfMenrache, foucusnode: ageOfMenrache,
          // onchanged: (dynamic AgeOfMenrachevalue) {
          //   AgeOfMenrache = AgeOfMenrachevalue;
          // },
        ),
        const SizedBox(
          height: 15,
        ),
        customtextformfield(
          valuevaldiation: (value) {
            if (value!.isEmpty) {
              return 'fieldrequired'.tr();
            }
          },
          fieldtype: TextInputType.number,
          labeltext: 'durationOfMenses'.tr(),
          hinttext: 'durationOfMenses'.tr(),
          controller: DurationofMenses, foucusnode: durationofMenses,
          // onchanged: (dynamic DurationofMensesvalue) {
          //   DurationofMenses = DurationofMensesvalue;
          // },
        ),
        const SizedBox(
          height: 15,
        ),
        customtextformfield(
          valuevaldiation: (value) {
            if (value!.isEmpty) {
              return 'fieldrequired'.tr();
            }
          },
          fieldtype: TextInputType.number,
          labeltext: 'intervalOfMenstrualCycle'.tr(),
          hinttext: 'intervalOfMenstrualCycle'.tr(),
          controller: IntervalofCycle, foucusnode: intervalofCycle,
          // onchanged: (dynamic IntervalofCyclevalue) {
          //   IntervalofCycle = IntervalofCyclevalue;
          // },
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
