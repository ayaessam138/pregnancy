import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pregancy/doctor/weidgetes/custom_text_field.dart';


class predectionpatientbydoctororpatientweidget extends StatelessWidget {
  TextEditingController Age;
  TextEditingController SysBp;
  TextEditingController DiaBp;
  TextEditingController BloodSugar;
  TextEditingController BodyTemperature;
  TextEditingController HeartRate;
  TextEditingController? name;
  TextEditingController? email;
  FocusNode age;
  FocusNode sysBp;
  FocusNode diaBp;
  FocusNode bloodSugar;
  FocusNode bodyTemperature;
  FocusNode heartRate;
  FocusNode? Name;
  FocusNode? Email;

  predectionpatientbydoctororpatientweidget(
      {required this.Age,
      required this.SysBp,
      required this.DiaBp,
      required this.BloodSugar,
      required this.BodyTemperature,
      required this.HeartRate,
      required this.age,
      required this.sysBp,
      required this.diaBp,
      required this.bloodSugar,
      required this.bodyTemperature,
      required this.heartRate,
      this.Name,
      this.name,
      this.Email,
      this.email});

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

          labeltext: 'name'.tr(),
          hinttext: 'name'.tr(),
          controller: name, foucusnode: Name,
          // onchanged: (namevalue) {
          //   name = namevalue;
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

          labeltext: 'email'.tr(),
          hinttext: 'email'.tr(),
          controller: email, foucusnode: Email,
          // onchanged: (namevalue) {
          //   name = namevalue;
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
          labeltext: 'age'.tr(),
          hinttext: 'age'.tr(),
          controller: Age, foucusnode: age,
          // onchanged: (namevalue) {
          //   name = namevalue;
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
          labeltext: 'systolicbloodpressure'.tr(),
          hinttext: 'systolicbloodpressure'.tr(),
          controller: SysBp, foucusnode: sysBp,
          // onchanged: (namevalue) {
          //   name = namevalue;
          // },
        ),
        const SizedBox(
          height: 15,
        ),
        customtextformfield(
          fieldtype: TextInputType.number,
          hinttext: 'diastolicbloodpressure'.tr(),
          labeltext:  'diastolicbloodpressure'.tr(),
          controller: DiaBp,
          valuevaldiation: (value) {
            if (value!.isEmpty) {
              return 'fieldrequired'.tr();
            }
          },
          foucusnode: diaBp,
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
          labeltext: 'bloodsugar'.tr(),
          hinttext: 'bloodsugar'.tr(),
          controller: BloodSugar, foucusnode: bloodSugar,
          // onchanged: (dynamic Agevalue) {
          //   Age = Agevalue;
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
          labeltext: 'bodytemperature'.tr(),
          hinttext: 'bodytemperature'.tr(),
          controller: BodyTemperature, foucusnode: bodyTemperature,
          // onchanged: (dynamic Ageatmarriagevalue) {
          //   Ageatmarriage = Ageatmarriagevalue;
          // }
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
          labeltext: 'heartbeatrate'.tr(),
          hinttext: 'heartbeatrate'.tr(),
          controller: HeartRate, foucusnode: heartRate,
          // onchanged: (dynamic Adressvalue) {
          //   adress = Adressvalue;
          // },
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
