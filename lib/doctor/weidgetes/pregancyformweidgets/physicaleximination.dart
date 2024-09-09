import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../custom_text_field.dart';

class physicaleximination extends StatelessWidget {
  physicaleximination(
      {required this.Height,
      required this.Weight,
      required this.PrePregancyBodyMassIndex,
      required this.BloodPressure,
      required this.Pluse,
      required this.height,
      required this.weight,
      required this.prePregancyBodyMassIndex,
      required this.bloodPressure,
      required this.pluse});
  TextEditingController Height,
      Weight,
      PrePregancyBodyMassIndex,
      BloodPressure,
      Pluse;
  FocusNode height, weight, prePregancyBodyMassIndex, bloodPressure, pluse;
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
          labeltext: 'height'.tr(),
          hinttext: 'height'.tr(),
          controller: Height, foucusnode: height,
          // onchanged: (dynamic Heightvalue) {
          //   Height = Heightvalue;
          // },
        ),
        customtextformfield(
          valuevaldiation: (value) {
            if (value!.isEmpty) {
              return 'fieldrequired'.tr();
            }
          },
          fieldtype: TextInputType.number,
          labeltext: 'weight'.tr(),
          hinttext:'weight'.tr(),
          controller: Weight, foucusnode: weight,
          // onchanged: (dynamic Weightvalue) {
          //   Weight = Weightvalue;
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
          labeltext: 'prePregancyBodyMassindex'.tr(),
          hinttext: 'prePregancyBodyMassindex'.tr(),
          controller: PrePregancyBodyMassIndex,
          foucusnode: prePregancyBodyMassIndex,
          // onchanged: (dynamic PrePregancyBodyMassIndexvalue) {
          //   PrePregancyBodyMassIndex = PrePregancyBodyMassIndexvalue;
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
          labeltext: 'bloodPressure'.tr(),
          hinttext: 'bloodPressure'.tr(),
          controller: BloodPressure, foucusnode: bloodPressure,
          // onchanged: (dynamic BloodPressurevalue) {
          //   BloodPressure = BloodPressurevalue;
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
          labeltext: 'pulse'.tr(),
          hinttext: 'pulse'.tr(),
          controller: Pluse, foucusnode: pluse,
          // onchanged: (dynamic Plusevalue) {
          //   Pluse = Plusevalue;
          // },
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
