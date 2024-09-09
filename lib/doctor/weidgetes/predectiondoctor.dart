import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pregancy/doctor/weidgetes/custom_text_field.dart';


class predectiondoctorweidget extends StatelessWidget {
  TextEditingController Age;
  TextEditingController email;
  TextEditingController FamHisto;
  TextEditingController ChronicHtn;
  TextEditingController ChronicDiabetes;
  TextEditingController BMI;
  TextEditingController SysBp;
  TextEditingController DiaBp;
  TextEditingController Hb;
  TextEditingController Hematocrit;
  TextEditingController MCH;
  TextEditingController MCHC;
  TextEditingController MCV;
  TextEditingController Platelet;
  TextEditingController SerumCreatinine;
  TextEditingController HDL;

  // TextEditingController BloodSugar;
  // TextEditingController BodyTemperature;
  // TextEditingController HeartRate;
  FocusNode age;
  FocusNode Email;
  FocusNode famHisto;
  FocusNode chronicHtn;
  FocusNode chronicDiabetes;
  FocusNode bMI;
  FocusNode sysBp;
  FocusNode diaBp;
  FocusNode hb;
  FocusNode hematocrit;
  FocusNode mCH;
  FocusNode mCHC;
  FocusNode mCV;
  FocusNode platelet;
  FocusNode serumCreatinine;
  FocusNode hDL;

  // FocusNode bloodSugar;
  // FocusNode bodyTemperature;
  // FocusNode heartRate;
  predectiondoctorweidget({
    required this.Age,
    required this.email,
    required this.FamHisto,
    required this.ChronicHtn,
    required this.ChronicDiabetes,
    required this.BMI,
    required this.SysBp,
    required this.DiaBp,
    required this.Hb,
    required this.Hematocrit,
    required this.MCH,
    required this.MCHC,
    required this.MCV,
    required this.Platelet,
    required this.SerumCreatinine,
    required this.HDL,

    required this.age,
    required this.Email,
    required this.famHisto,
    required this.chronicHtn,
    required this.chronicDiabetes,
    required this.bMI,
    required this.sysBp,
    required this.diaBp,
    required this.hb,
    required this.hematocrit,
    required this.mCH,
    required this.mCHC,
    required this.mCV,
    required this.platelet,
    required this.serumCreatinine,
    required this.hDL,
    // required this.bloodSugar,
    // required this.bodyTemperature,
    // required this.heartRate,
  });

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
          labeltext: 'FamilyHistory'.tr(),
          hinttext: 'FamilyHistory'.tr(),
          controller: FamHisto, foucusnode: famHisto,
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
          labeltext: 'Chronic Htn',
          hinttext: 'Chronic Htn',
          controller: ChronicHtn, foucusnode: chronicHtn,
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
          labeltext: 'BMI',
          hinttext: 'BMI',
          controller: BMI, foucusnode: bMI,
          // onchanged: (dynamic Adressvalue) {
          //   adress = Adressvalue;
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
          labeltext: 'Chronic Diabetes',
          hinttext: 'ChronicDiabetes',
          controller: ChronicDiabetes, foucusnode: chronicDiabetes,
          // onchanged: (LevelOfEducationvalue) {
          //   LevelOfEducation = LevelOfEducationvalue;
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
          hinttext: 'systolicbloodpressure'.trim(),
          controller: SysBp, foucusnode: sysBp,
          // onchanged: (Ocuppationvalue) {
          //   Ocuppation = Ocuppationvalue;
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
          labeltext: 'diastolicbloodpressure'.tr(),
          hinttext: 'diastolicbloodpressure'.tr(),
          controller: DiaBp, foucusnode: diaBp,
          // onchanged: (Habitvalue) {
          //   Habit = Habitvalue;
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
          labeltext: 'HB'.tr(),
          hinttext: 'HB'.tr(),
          controller: Hb, foucusnode: hb,
          // onchanged: (dynamic husbandagevalue) {
          //   husbandage = husbandagevalue;
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
          labeltext: 'hematocrit'.tr(),
          hinttext: 'hematocrit'.tr(),
          controller: Hematocrit, foucusnode: hematocrit,
          // onchanged: (dynamic HusbandHabitvalue) {
          //   HusbandHabit = HusbandHabitvalue;
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
          labeltext: 'MCh'.tr(),
          hinttext: 'MCh'.tr(),
          controller: MCH, foucusnode: mCH,
          // onchanged: (dynamic HusbandOcuppationvalue) {
          //   HusbandOcuppation = HusbandOcuppationvalue;
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
          labeltext: 'MCHc'.tr(),
          hinttext: 'MCHc'.tr(),
          controller: MCHC, foucusnode: mCHC,
          // onchanged: (LevelOfEducationvalue) {
          //   LevelOfEducation = LevelOfEducationvalue;
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
          labeltext: 'MCv'.tr(),
          hinttext: 'MCv'.tr(),
          controller: MCV, foucusnode: mCV,
          // onchanged: (Ocuppationvalue) {
          //   Ocuppation = Ocuppationvalue;
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
          labeltext: 'platelet'.tr(),
          hinttext: 'platelet'.tr(),
          controller: Platelet, foucusnode: platelet,
          // onchanged: (Habitvalue) {
          //   Habit = Habitvalue;
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
          labeltext: 'serumCreatinine'.tr(),
          hinttext: 'serumCreatinine'.tr(),
          controller: SerumCreatinine, foucusnode: serumCreatinine,
          // onchanged: (dynamic husbandagevalue) {
          //   husbandage = husbandagevalue;
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
          labeltext: 'HDl'.tr(),
          hinttext: 'HDl'.tr(),
          controller: HDL, foucusnode: hDL,
          // onchanged: (dynamic HusbandHabitvalue) {
          //   HusbandHabit = HusbandHabitvalue;
          // },
        ),
        // const SizedBox(
        //   height: 15,
        // ),
        // customtextformfield(
        //   valuevaldiation: (value) {
        //     if (value!.isEmpty) {
        //       return 'fieldrequired'.tr();
        //     }
        //   },
        //   fieldtype: TextInputType.number,
        //   labeltext: 'bloodsugar'.tr(),
        //   hinttext: 'bloodsugar'.tr(),
        //   controller: BloodSugar, foucusnode: bloodSugar,
        //   // onchanged: (Ocuppationvalue) {
        //   //   Ocuppation = Ocuppationvalue;
        //   // },
        // ),
        // const SizedBox(
        //   height: 15,
        // ),
        // customtextformfield(
        //   valuevaldiation: (value) {
        //     if (value!.isEmpty) {
        //       return 'fieldrequired'.tr();
        //     }
        //   },
        //   fieldtype: TextInputType.number,
        //   labeltext: 'bodytemperature'.tr(),
        //   hinttext: 'bodytemperature'.tr(),
        //   controller: BodyTemperature, foucusnode: bodyTemperature,
        //   // onchanged: (Habitvalue) {
        //   //   Habit = Habitvalue;
        //   // },
        // ),
        // const SizedBox(
        //   height: 15,
        // ),
        // customtextformfield(
        //   valuevaldiation: (value) {
        //     if (value!.isEmpty) {
        //       return 'fieldrequired'.tr();
        //     }
        //   },
        //   fieldtype: TextInputType.number,
        //   labeltext: 'heartbeatrate'.tr(),
        //   hinttext: 'heartRate'.tr(),
        //   controller: HeartRate, foucusnode: heartRate,
        //   // onchanged: (dynamic husbandagevalue) {
        //   //   husbandage = husbandagevalue;
        //   // },
        // ),
        // const SizedBox(
        //   height: 15,
        // ),
      ],
    );
  }
}
