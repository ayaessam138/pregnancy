import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/doctor/weidgetes/pregancyformweidgets/investigation.dart';
import 'package:pregancy/doctor/weidgetes/pregancyformweidgets/obestrichistory.dart';
import 'package:pregancy/doctor/weidgetes/pregancyformweidgets/personalinfo.dart';
import 'package:pregancy/doctor/weidgetes/pregancyformweidgets/physicaleximination.dart';
import 'package:pregancy/doctor/weidgetes/custom_button.dart';
import 'package:pregancy/doctor/weidgetes/subtitleofpregancyform.dart';

import '../constants.dart';
import '../cubit/pregancyform_cubit/pregancyform_cubit.dart';
import '../weidgetes/Dropdownbutton.dart';
import '../weidgetes/custom_text_field.dart';
import '../weidgetes/pregancyformweidgets/menstrualhistory.dart';

class pregancyform extends StatefulWidget {
  static String pregancyformid = 'pregancyform';

  @override
  State<pregancyform> createState() => _pregancyformState();
}

class _pregancyformState extends State<pregancyform> {
  bool HeadNeckvisbility = false;
  bool BreastsNipplesvisbility = false;
  bool Chestvisibility = false;
  bool TeethGumsvisibility = false;
  bool Heartvisbility = false;
  bool Abdomenvisbility = false;
  bool Backbonevisbility = false;
  bool VaricositiesExtremitiesvisibility = false;
  bool Edemavisbility = false;
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController patientid = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController Age = TextEditingController();
  TextEditingController Ageatmarriage = TextEditingController();
  TextEditingController adress = TextEditingController();
  TextEditingController husbandage = TextEditingController();
  TextEditingController LevelOfEducation = TextEditingController();
  TextEditingController Ocuppation = TextEditingController();
  TextEditingController Habit = TextEditingController();
  TextEditingController HusbandHabit = TextEditingController();
  TextEditingController HusbandOcuppation = TextEditingController();
  TextEditingController AgeofMenarche = TextEditingController();
  TextEditingController DurationofMenses = TextEditingController();
  TextEditingController IntervalofCycle = TextEditingController();
  TextEditingController FallTermPregancy = TextEditingController();
  TextEditingController Pretermpregancy = TextEditingController();
  TextEditingController Abortion = TextEditingController();
  TextEditingController LiveBabies = TextEditingController();
  TextEditingController BloodGroup = TextEditingController();
  TextEditingController RhFactor = TextEditingController();
  TextEditingController TORCH = TextEditingController();
  TextEditingController Sugar = TextEditingController();
  TextEditingController Ketone = TextEditingController();
  TextEditingController uss = TextEditingController();
  TextEditingController Height = TextEditingController();
  TextEditingController Weight = TextEditingController();
  TextEditingController PrePregancyBodyMassIndex = TextEditingController();
  TextEditingController BloodPressure = TextEditingController();
  TextEditingController Pluse = TextEditingController();

  String? HeadNeckdropdown;
  TextEditingController headneckspecify = TextEditingController();
  String? BreastsNipplesdropDwonValue;
  TextEditingController BreastsNipplesspeficy = TextEditingController();
  String? ChestdropDwonValue;
  TextEditingController Chestspecify = TextEditingController();
  String? TeethGumsdropDwonValue;
  TextEditingController TeethGumsspecify = TextEditingController();
  String? HeartdropDwonValue;
  TextEditingController Heartspecify = TextEditingController();
  String? AbdomendropDwonValue;
  TextEditingController Abdomenspecify = TextEditingController();
  String? BackbonedropDwonValue;
  TextEditingController Backbonespecify = TextEditingController();
  String? varicositiesExtremitiesValue;
  TextEditingController varicositiesExtremitiesspecify =
      TextEditingController();
  String? EdemadropDwonValue;
  TextEditingController Edemaspecify = TextEditingController();

  String? nausea;
  String? vomiting;
  String? Urinaryfrequency;
  String? fatigue;
  String? breasttndrness;
  String? Vignaldiscarge;
  String? headache;

  String? heartburn;
  String? faitness;
  String? constipation;
  String? flatulence;
  String? varicoseviens;

  String? dyspena;
  String? backache;
  String? ankleedma;
  String? legCramps;
  String? hemorrhiods;

  FocusNode Name = FocusNode();
  FocusNode Patientid = FocusNode();
  FocusNode Email = FocusNode();
  FocusNode age = FocusNode();
  FocusNode ageatmarriage = FocusNode();
  FocusNode Adress = FocusNode();
  FocusNode Husbandage = FocusNode();
  FocusNode levelOfEducation = FocusNode();
  FocusNode ocuppation = FocusNode();
  FocusNode habit = FocusNode();
  FocusNode husbandHabit = FocusNode();
  FocusNode husbandOcuppation = FocusNode();
  FocusNode ageofMenarche = FocusNode();
  FocusNode durationofMenses = FocusNode();
  FocusNode intervalofCycle = FocusNode();
  FocusNode fallTermPregancy = FocusNode();
  FocusNode pretermpregancy = FocusNode();
  FocusNode abortion = FocusNode();
  FocusNode liveBabies = FocusNode();
  FocusNode bloodGroup = FocusNode();
  FocusNode rhFactor = FocusNode();
  FocusNode tORCH = FocusNode();
  FocusNode sugar = FocusNode();
  FocusNode ketone = FocusNode();
  FocusNode Uss = FocusNode();
  FocusNode height = FocusNode();
  FocusNode weight = FocusNode();
  FocusNode prePregancyBodyMassIndex = FocusNode();
  FocusNode bloodPressure = FocusNode();
  FocusNode pluse = FocusNode();
  FocusNode Headneckspecify = FocusNode();

  FocusNode breastsNipplesspeficy = FocusNode();

  FocusNode chestspecify = FocusNode();

  FocusNode teethGumsspecify = FocusNode();

  FocusNode heartspecify = FocusNode();

  FocusNode abdomenspecify = FocusNode();

  FocusNode backbonespecify = FocusNode();

  FocusNode VaricositiesExtremitiesspecify = FocusNode();

  FocusNode edemaspecify = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text(
            'assessment'.tr(),
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: kprimarycolor,
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Subtitleofpregnacyform(title: 'personalInformation'.tr()),
                const SizedBox(
                  height: 15,
                ),
                personalinfo(
                    name: name,
                    email: email,
                    Age: Age,
                    Ageatmarriage: Ageatmarriage,
                    adress: adress,
                    husbandage: husbandage,
                    LevelOfEducation: LevelOfEducation,
                    Ocuppation: Ocuppation,
                    Habit: Habit,
                    HusbandHabit: HusbandHabit,
                    HusbandOcuppation: HusbandOcuppation,
                    patientid: patientid,
                    Name: Name,
                    Patientid: Patientid,
                    Email: Email,
                    age: age,
                    ageatmarriage: ageatmarriage,
                    Adress: Adress,
                    Husbandage: Husbandage,
                    levelOfEducation: levelOfEducation,
                    ocuppation: ocuppation,
                    habit: habit,
                    husbandHabit: husbandHabit,
                    husbandOcuppation: husbandOcuppation),
                const SizedBox(
                  height: 15,
                ),
                Subtitleofpregnacyform(title: 'menstrualHistory'.tr()),
                const SizedBox(
                  height: 15,
                ),
                menstrualhistory(
                    DurationofMenses: DurationofMenses,
                    IntervalofCycle: IntervalofCycle,
                    AgeOfMenrache: AgeofMenarche,
                    durationofMenses: durationofMenses,
                    intervalofCycle: intervalofCycle,
                    ageOfMenrache: ageofMenarche),
                const SizedBox(
                  height: 15,
                ),
                Subtitleofpregnacyform(title: 'obstetricHistory'.tr()),
                const SizedBox(
                  height: 15,
                ),
                obertichistory(
                    FallTermPregancy: FallTermPregancy,
                    Pretermpregancy: Pretermpregancy,
                    Abortion: Abortion,
                    LiveBabies: LiveBabies,
                    fallTermPregancy: fallTermPregancy,
                    pretermpregancy: pretermpregancy,
                    abortion: abortion,
                    liveBabies: liveBabies),
                Subtitleofpregnacyform(title: 'investigations'.tr()),
                const SizedBox(
                  height: 15,
                ),
                investigations(
                    BloodGroup: BloodGroup,
                    Ketone: Ketone,
                    RhFactor: RhFactor,
                    Sugar: Sugar,
                    TORCH: TORCH,
                    uss: uss,
                    bloodGroup: bloodGroup,
                    rhFactor: rhFactor,
                    tORCH: tORCH,
                    sugar: sugar,
                    ketone: ketone,
                    Uss: Uss),
                const SizedBox(
                  height: 15,
                ),
                Subtitleofpregnacyform(title: 'PhysicalExamination'.tr()),
                const SizedBox(
                  height: 15,
                ),
                physicaleximination(
                    Height: Height,
                    Weight: Weight,
                    PrePregancyBodyMassIndex: PrePregancyBodyMassIndex,
                    BloodPressure: BloodPressure,
                    Pluse: Pluse,
                    height: height,
                    weight: weight,
                    prePregancyBodyMassIndex: prePregancyBodyMassIndex,
                    bloodPressure: bloodPressure,
                    pluse: pluse),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield(
                  onchanged: (value) {
                    setState(() {
                      HeadNeckdropdown = value;
                      status = value!;
                      if (status == 'Normal') {
                        HeadNeckvisbility = false;
                      } else if (status == 'AbNormal') {
                        HeadNeckvisbility = true;
                      }
                    });
                  },
                  text: 'headNeck'.tr(),
                ),
                const SizedBox(
                  height: 15,
                ),
                Visibility(
                  visible: HeadNeckvisbility,
                  child: customtextformfield(
                    controller: headneckspecify,
                    valuevaldiation: (value) {
                      if (value!.isEmpty) {
                        return 'fieldrequired'.tr();
                      }
                    },
                    hinttext: 'headNeck'.tr(),
                    foucusnode: Headneckspecify,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield(
                  onchanged: (value) {
                    setState(() {
                      BreastsNipplesdropDwonValue = value;
                      status = value!;
                      if (status == 'Normal') {
                        BreastsNipplesvisbility = false;
                      } else if (status == 'AbNormal') {
                        BreastsNipplesvisbility = true;
                      }
                    });
                  },
                  text: 'breastNipples'.tr(),
                ),
                const SizedBox(
                  height: 15,
                ),
                Visibility(
                    visible: BreastsNipplesvisbility,
                    child: customtextformfield(
                      controller: BreastsNipplesspeficy,
                      valuevaldiation: (value) {
                        if (value!.isEmpty) {
                          return 'fieldrequired'.tr();
                        }
                      },
                      hinttext: 'breastNipples'.tr(),
                      foucusnode: breastsNipplesspeficy,
                    )),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield(
                  onchanged: (value) {
                    setState(() {
                      ChestdropDwonValue = value;
                      status = value!;
                      if (status == 'Normal') {
                        Chestvisibility = false;
                      } else if (status == 'AbNormal') {
                        Chestvisibility = true;
                      }
                    });
                  },
                  text: 'chest'.tr(),
                ),
                const SizedBox(
                  height: 15,
                ),
                Visibility(
                    visible: Chestvisibility,
                    child: customtextformfield(
                      controller: Chestspecify,
                      valuevaldiation: (value) {
                        if (value!.isEmpty) {
                          return 'fieldrequired'.tr();
                        }
                      },
                      hinttext: 'SpecifyAbnormal'.tr(),
                      foucusnode: chestspecify,
                    )),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield(
                  onchanged: (value) {
                    setState(() {
                      TeethGumsdropDwonValue = value;
                      status = value!;
                      if (status == 'Normal') {
                        TeethGumsvisibility = false;
                      } else if (status == 'AbNormal') {
                        TeethGumsvisibility = true;
                      }
                    });
                  },
                  text: 'teethGums'.tr(),
                ),
                const SizedBox(
                  height: 15,
                ),
                Visibility(
                    visible: TeethGumsvisibility,
                    child: customtextformfield(
                      valuevaldiation: (value) {
                        if (value!.isEmpty) {
                          return 'fieldrequired'.tr();
                        }
                      },
                      hinttext: 'SpecifyAbnormal'.tr(),
                      foucusnode: teethGumsspecify,
                    )),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield(
                  onchanged: (value) {
                    setState(() {
                      HeartdropDwonValue = value;
                      status = value!;
                      if (status == 'Normal') {
                        Heartvisbility = false;
                      } else if (status == 'AbNormal') {
                        Heartvisbility = true;
                      }
                    });
                  },
                  text: 'heart'.tr(),
                ),
                const SizedBox(
                  height: 15,
                ),
                Visibility(
                    visible: Heartvisbility,
                    child: customtextformfield(
                      controller: Heartspecify,
                      valuevaldiation: (value) {
                        if (value!.isEmpty) {
                          return 'fieldrequired'.tr();
                        }
                      },
                      hinttext: 'SpecifyAbnormal'.tr(),
                      foucusnode: heartspecify,
                    )),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield(
                  onchanged: (value) {
                    setState(() {
                      AbdomendropDwonValue = value;
                      status = value!;
                      if (status == 'Normal') {
                        Abdomenvisbility = false;
                      } else if (status == 'AbNormal') {
                        Abdomenvisbility = true;
                      }
                    });
                  },
                  text: 'abdomen'.tr(),
                ),
                const SizedBox(
                  height: 15,
                ),
                Visibility(
                    visible: Abdomenvisbility,
                    child: customtextformfield(
                      controller: Abdomenspecify,
                      valuevaldiation: (value) {
                        if (value!.isEmpty) {
                          return 'fieldrequired'.tr();
                        }
                      },
                      hinttext: 'SpecifyAbnormal'.tr(),
                      foucusnode: abdomenspecify,
                    )),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield(
                  onchanged: (value) {
                    setState(() {
                      BackbonedropDwonValue = value;
                      status = value!;
                      if (status == 'Normal') {
                        Backbonevisbility = false;
                      } else if (status == 'AbNormal') {
                        Backbonevisbility = true;
                      }
                    });
                  },
                  text: 'backbone'.tr(),
                ),
                const SizedBox(
                  height: 15,
                ),
                Visibility(
                    visible: Backbonevisbility,
                    child: customtextformfield(
                      controller: Backbonespecify,
                      valuevaldiation: (value) {
                        if (value!.isEmpty) {
                          return 'fieldrequired'.tr();
                        }
                      },
                      hinttext: 'SpecifyAbnormal'.tr(),
                      foucusnode: backbonespecify,
                    )),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield(
                  onchanged: (value) {
                    setState(() {
                      varicositiesExtremitiesValue = value;
                      status = value!;
                      if (status == 'Normal') {
                        VaricositiesExtremitiesvisibility = false;
                      } else if (status == 'AbNormal') {
                        VaricositiesExtremitiesvisibility = true;
                      }
                    });
                  },
                  text: 'varicositiesextremities'.tr(),
                ),
                const SizedBox(
                  height: 15,
                ),
                Visibility(
                    visible: VaricositiesExtremitiesvisibility,
                    child: customtextformfield(
                      controller: varicositiesExtremitiesspecify,
                      valuevaldiation: (value) {
                        if (value!.isEmpty) {
                          return 'fieldrequired'.tr();
                        }
                      },
                      hinttext: 'SpecifyAbnormal'.tr(),
                      foucusnode: VaricositiesExtremitiesspecify,
                    )),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield(
                  onchanged: (value) {
                    setState(() {
                      EdemadropDwonValue = value;
                      status = value!;
                      if (status == 'Normal') {
                        Edemavisbility = false;
                      } else if (status == 'AbNormal') {
                        Edemavisbility = true;
                      }
                    });
                  },
                  text: 'edema'.tr(),
                ),
                const SizedBox(
                  height: 15,
                ),
                Visibility(
                    visible: Edemavisbility,
                    child: customtextformfield(
                      controller: Edemaspecify,
                      valuevaldiation: (value) {
                        if (value!.isEmpty) {
                          return 'fieldrequired'.tr();
                        }
                      },
                      hinttext: 'SpecifyAbnormal'.tr(),
                      foucusnode: edemaspecify,
                    )),
                const SizedBox(
                  height: 15,
                ),
                Subtitleofpregnacyform(title: 'complains_of_first_trimester'.tr()),
                Dropdownbuttonformfield2(
                  text: 'nausea'.tr(),
                  onchanged: (value) {
                    setState(() {
                      nausea = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield2(
                  text: 'vomiting'.tr(),
                  onchanged: (value) {
                    setState(() {
                      vomiting = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield2(
                  text: 'urinary_frequency'.tr(),
                  onchanged: (value) {
                    setState(() {
                      Urinaryfrequency = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield2(
                  text: 'fatigue'.tr(),
                  onchanged: (value) {
                    setState(() {
                      fatigue = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield2(
                  text: 'breast_tenderness'.tr(),
                  onchanged: (value) {
                    setState(() {
                      breasttndrness = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield2(
                  text: 'vaginal_discharge'.tr(),
                  onchanged: (value) {
                    setState(() {
                      Vignaldiscarge = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield2(
                  text: 'headache'.tr(),
                  onchanged: (value) {
                    setState(() {
                      headache = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Subtitleofpregnacyform(title: 'complains_of_second_trimester'.tr()),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield2(
                  text: 'heart_burn'.tr(),
                  onchanged: (value) {
                    setState(() {
                      heartburn = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield2(
                  text: 'faintness'.tr(),
                  onchanged: (value) {
                    setState(() {
                      faitness = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield2(
                  text: 'constipation'.tr(),
                  onchanged: (value) {
                    setState(() {
                      constipation = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield2(
                  text: 'flatulence'.tr(),
                  onchanged: (value) {
                    setState(() {
                      flatulence = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield2(
                  text: 'varicose_veins'.tr(),
                  onchanged: (value) {
                    setState(() {
                      varicoseviens = value;
                    });
                  },
                ),
                Subtitleofpregnacyform(title: 'complains_of_third_trimester'.tr()),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield2(
                  text: 'dyspnea'.tr(),
                  onchanged: (value) {
                    setState(() {
                      dyspena = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield2(
                  text: 'backache'.tr(),
                  onchanged: (value) {
                    setState(() {
                      backache = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield2(
                  text: 'ankle_edema'.tr(),
                  onchanged: (value) {
                    setState(() {
                      ankleedma = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield2(
                  text: 'leg_cramps'.tr(),
                  onchanged: (value) {
                    setState(() {
                      legCramps = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Dropdownbuttonformfield2(
                  text: 'hemorrhoids'.tr(),
                  onchanged: (value) {
                    setState(() {
                      hemorrhiods = value;
                    });
                  },
                ),
                custoumbutton(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      BlocProvider.of<PregancyformCubit>(context).submitform(
                        name: name.text,
                        patientid: patientid.text,
                        email: email.text,
                        Age: Age.text,
                        Ageatmarriage: Ageatmarriage.text,
                        adress: adress.text,
                        husbandage: husbandage.text,
                        LevelOfEducation: LevelOfEducation.text,
                        Ocuppation: Ocuppation.text,
                        Habit: Habit.text,
                        HusbandHabit: HusbandHabit.text,
                        HusbandOcuppation: HusbandOcuppation.text,
                        AgeofMenarche: AgeofMenarche.text,
                        DurationofMenses: DurationofMenses.text,
                        IntervalofCycle: IntervalofCycle.text,
                        FallTermPregancy: FallTermPregancy.text,
                        Pretermpregancy: Pretermpregancy.text,
                        Abortion: Abortion.text,
                        LiveBabies: LiveBabies.text,
                        BloodGroup: BloodGroup.text,
                        RhFactor: RhFactor.text,
                        TORCH: TORCH.text,
                        Sugar: Sugar.text,
                        Ketone: Ketone.text,
                        uss: uss.text,
                        Height: Height.text,
                        Weight: Weight.text,
                        PrePregancyBodyMassIndex: PrePregancyBodyMassIndex.text,
                        BloodPressure: BloodPressure.text,
                        Pluse: Pluse.text,
                        HeadNeckdropdown:
                            HeadNeckdropdown ?? 'NotDeterminedyet'.tr(),
                        headneckspecify: headneckspecify.text ?? 'headnormal',
                        BreastsNipplesdropDwonValue:
                            BreastsNipplesdropDwonValue ??
                                'NotDeterminedyet'.tr(),
                        BreastsNipplesspeficy: BreastsNipplesspeficy.text ??
                            'BreastsNipplesnormal',
                        ChestdropDwonValue:
                            ChestdropDwonValue ?? 'NotDeterminedyet'.tr(),
                        Chestspecify: Chestspecify.text ?? 'Chestnormal',
                        TeethGumsdropDwonValue:
                            TeethGumsdropDwonValue ?? 'NotDeterminedyet'.tr(),
                        TeethGumsspecify:
                            TeethGumsspecify.text ?? 'TeethGumsnormal',
                        HeartdropDwonValue:
                            HeartdropDwonValue ?? 'NotDeterminedyet'.tr(),
                        Heartspecify: Heartspecify.text ?? 'Heartnormal',
                        AbdomendropDwonValue:
                            AbdomendropDwonValue ?? 'NotDeterminedyet'.tr(),
                        Abdomenspecify: Abdomenspecify.text ?? 'Abdomennormal',
                        BackbonedropDwonValue:
                            BackbonedropDwonValue ?? 'NotDeterminedyet'.tr(),
                        Backbonespecify:
                            Backbonespecify.text ?? 'Backbonenormal',
                        varicositiesExtremitiesValue:
                            varicositiesExtremitiesValue ??
                                'NotDeterminedyet'.tr(),
                        varicositiesExtremitiesspecify:
                            varicositiesExtremitiesspecify.text ??
                                'varicositiesExtremitiesnormal',
                        EdemadropDwonValue:
                            EdemadropDwonValue ?? 'NotDeterminedyet'.tr(),
                        Edemaspecify: Edemaspecify.text ?? 'Edemanormal',
                        nausea: nausea ?? 'NotDeterminedyet'.tr(),
                        vomiting: vomiting ?? 'NotDeterminedyet'.tr(),
                        Urinaryfrequency:
                            Urinaryfrequency ?? 'NotDeterminedyet'.tr(),
                        fatigue: fatigue ?? 'NotDeterminedyet'.tr(),
                        breasttndrness: breasttndrness ?? 'NotDeterminedyet'.tr(),
                        Vignaldiscarge: Vignaldiscarge ?? 'NotDeterminedyet'.tr(),
                        headache: headache ?? 'NotDeterminedyet'.tr(),
                        heartburn: heartburn ?? 'NotDeterminedyet'.tr(),
                        faitness: faitness ?? 'NotDeterminedyet'.tr(),
                        flatulence: flatulence ?? 'NotDeterminedyet'.tr(),
                        dyspena: dyspena ?? 'NotDeterminedyet'.tr(),
                        backache: backache ?? 'NotDeterminedyet'.tr(),
                        ankleedma: ankleedma ?? 'NotDeterminedyet'.tr(),
                        legCramps: legCramps ?? 'NotDeterminedyet'.tr(),
                        hemorrhiods: hemorrhiods ?? 'NotDeterminedyet'.tr(),
                        constipation: constipation ?? 'NotDeterminedyet'.tr(),
                        varicoseviens: varicoseviens ?? 'NotDeterminedyet'.tr(),
                      );
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.pop(context);
                      });
                    }
                  },
                  text: 'submit'.tr(),
                )
              ],
            ),
          ),
        )));
  }
}
