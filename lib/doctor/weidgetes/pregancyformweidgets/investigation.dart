import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../custom_text_field.dart';

class investigations extends StatelessWidget {
  investigations(
      {required this.BloodGroup,
      required this.Ketone,
      required this.RhFactor,
      required this.Sugar,
      required this.TORCH,
      required this.uss,
      required this.bloodGroup,
      required this.ketone,
      required this.rhFactor,
      required this.sugar,
      required this.tORCH,
      required this.Uss});
  TextEditingController BloodGroup, RhFactor, TORCH, Sugar, Ketone, uss;
  FocusNode bloodGroup, rhFactor, tORCH, sugar, ketone, Uss;
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
          labeltext: 'bloodGroup'.tr(),
          hinttext: 'bloodGroup'.tr(),
          controller: BloodGroup, foucusnode: bloodGroup,
          // onchanged: (BloodGroupvalue) {
          //   BloodGroup = BloodGroupvalue;
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
          labeltext: 'rhFactor'.tr(),
          hinttext: 'rhFactor'.tr(),
          controller: RhFactor, foucusnode: rhFactor,
          // onchanged: (RhFactorvalue) {
          //   RhFactor = RhFactorvalue;
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
          labeltext: 'tORCH'.tr(),
          hinttext: 'tORCH'.tr(),
          controller: TORCH, foucusnode: tORCH,
          // onchanged: (dynamic TORCHvalue) {
          //   TORCH = TORCHvalue;
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
          labeltext: 'sugar'.tr(),
          hinttext: 'sugar'.tr(),
          controller: Sugar, foucusnode: sugar,
          // onchanged: (dynamic Sugarvalue) {
          //   Sugar = Sugarvalue;
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
          labeltext: 'ketone'.tr(),
          hinttext: 'ketone'.tr(),
          controller: Ketone, foucusnode: ketone,
          // onchanged: (dynamic Ketonevalue) {
          //   Ketone = Ketonevalue;
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
          labeltext: 'uss'.tr(),
          hinttext: 'uss'.tr(),
          controller: uss, foucusnode: Uss,
          // onchanged: (dynamic ussvalue) {
          //   uss = ussvalue;
          // },
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
