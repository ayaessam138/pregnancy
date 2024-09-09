import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

import '../../constants.dart';
import '../custom_text_field.dart';

class personalinfo extends StatelessWidget {
  TextEditingController name;
  TextEditingController patientid;
  TextEditingController email;
  TextEditingController Age;
  TextEditingController Ageatmarriage;
  TextEditingController adress;
  TextEditingController husbandage;
  TextEditingController LevelOfEducation,
      Ocuppation,
      Habit,
      HusbandHabit,
      HusbandOcuppation;
  FocusNode Name;
  FocusNode Patientid;
  FocusNode Email;
  FocusNode age;
  FocusNode ageatmarriage;
  FocusNode Adress;
  FocusNode Husbandage;
  FocusNode levelOfEducation,
      ocuppation,
      habit,
      husbandHabit,
      husbandOcuppation;

  personalinfo({
    required this.name,
    required this.patientid,
    required this.email,
    required this.Age,
    required this.Ageatmarriage,
    required this.adress,
    required this.husbandage,
    required this.LevelOfEducation,
    required this.Ocuppation,
    required this.Habit,
    required this.HusbandHabit,
    required this.HusbandOcuppation,
    required this.Name,
    required this.Patientid,
    required this.Email,
    required this.age,
    required this.ageatmarriage,
    required this.Adress,
    required this.Husbandage,
    required this.levelOfEducation,
    required this.ocuppation,
    required this.habit,
    required this.husbandHabit,
    required this.husbandOcuppation,
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
          labeltext: 'PatientId'.tr(),
          hinttext: 'PatientId'.tr(),
          controller: patientid, foucusnode: Patientid,
          // onchanged: (namevalue) {
          //   name = namevalue;
          // },
        ),
        const SizedBox(
          height: 15,
        ),
        customtextformfield(
          hinttext: 'email'.tr(),
          labeltext:'email'.tr(),
          controller: email,
          valuevaldiation: (value) {
            if (value!.isEmpty) {
              return 'fieldrequired'.tr();
            }
          },
          foucusnode: Email,
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
          hinttext:  'age'.tr(),
          controller: Age, foucusnode: age,
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
          labeltext: 'ageAtMarriage'.tr(),
          hinttext: 'ageAtMarriage'.tr(),
          controller: Ageatmarriage, foucusnode: ageatmarriage,
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
          labeltext: 'adress'.tr(),
          hinttext: 'adress'.tr(),
          controller: adress, foucusnode: Adress,
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
          labeltext: 'levelOfEducation'.tr(),
          hinttext: 'levelOfEducation'.tr(),
          controller: LevelOfEducation, foucusnode: levelOfEducation,
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
          labeltext: 'ocuppation'.tr(),
          hinttext:'ocuppation'.tr(),
          controller: Ocuppation, foucusnode: ocuppation,
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
          labeltext: 'habit'.tr(),
          hinttext: 'habit'.tr(),
          controller: Habit, foucusnode: habit,
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
          labeltext: 'husbandAge'.tr(),
          hinttext:  'husbandAge'.tr(),
          controller: husbandage, foucusnode: Husbandage,
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
          labeltext: 'husbandHabit'.tr(),
          hinttext: 'husbandHabit'.tr(),
          controller: HusbandHabit, foucusnode: husbandHabit,
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
          labeltext: 'husbandOcuppation'.tr(),
          hinttext: 'husbandOcuppation'.tr(),
          controller: HusbandOcuppation, foucusnode: husbandOcuppation,
          // onchanged: (dynamic HusbandOcuppationvalue) {
          //   HusbandOcuppation = HusbandOcuppationvalue;
          // },
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
