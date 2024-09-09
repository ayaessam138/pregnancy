import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pregancy/doctor/housescrrens/patientrecord/predectiondata.dart';
import 'package:pregancy/doctor/models/pregnancyform.dart';
import 'package:pregancy/doctor/weidgetes/assesmentsubtitle.dart';


import '../../constants.dart';

class patientdata extends StatefulWidget {
  static String patientdataid = 'patientdata';

  @override
  State<patientdata> createState() => _patientdataState();
}

class _patientdataState extends State<patientdata> {
  bool personalinfovisbility = false;
  bool Menstrualhistoryvisbility = false;
  bool Obstetrichistoryvisbility = false;
  bool Investegationsvisbility = false;
  bool PhysicalExaminationvisbility = false;
  bool complainsoffirsttrimestervisbility = false;
  bool complainsofsecondtrimestervisbility = false;
  bool complainsofthirdtrimestervisbility = false;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as pregancyformmodel;
    return Scaffold(
      appBar: AppBar(
        title: Text('assessment'.tr()),
        backgroundColor: kprimarycolor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              assesmentsubtitle(
                text: 'personalInformation'.tr(),
                onPressed: () {
                  setState(() {
                    personalinfovisbility = !personalinfovisbility;
                  });
                },
              ),
              Visibility(
                visible: personalinfovisbility,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title:
                          textstyle(text: 'name'.tr()),
                      subtitle: Text(args.name!),
                    ),
                    ListTile(
                      title:
                          textstyle(text: 'email'.tr()),
                      subtitle: Text(args.email!),
                    ),
                    ListTile(
                      title: textstyle(text: 'age'.tr()),
                      subtitle: Text(args.Age!),
                    ),
                    ListTile(
                      title: textstyle(
                          text: 'ageAtMarriage'.tr()),
                      subtitle: Text(args.Ageatmarriage!),
                    ),
                    ListTile(
                      title:
                          textstyle(text: 'adress'.tr()),
                      subtitle: Text(args.adress!),
                    ),
                    ListTile(
                      title: textstyle(
                          text: 'husbandAge'.tr()),
                      subtitle: Text(args.husbandage!),
                    ),
                    ListTile(
                      title: textstyle(
                          text: 'levelOfEducation'.tr()),
                      subtitle: Text(args.LevelOfEducation!),
                    ),
                    ListTile(
                      title: textstyle(
                          text: 'ocuppation'.tr()),
                      subtitle: Text(args.Ocuppation!),
                    ),
                    ListTile(
                      title:
                          textstyle(text: 'habit'.tr()),
                      subtitle: Text(args.Habit!),
                    ),
                    ListTile(
                      title: textstyle(
                          text: 'husbandHabit'.tr()),
                      subtitle: Text(args.HusbandHabit!),
                    ),
                    ListTile(
                      title: textstyle(
                          text: 'husbandOcuppation'.tr()),
                      subtitle: Text(args.HusbandOcuppation!),
                    )
                  ],
                ),
              ),
              assesmentsubtitle(
                text: 'menstrualHistory'.tr(),
                onPressed: () {
                  setState(() {
                    Menstrualhistoryvisbility = !Menstrualhistoryvisbility;
                  });
                },
              ),
              Visibility(
                visible: Menstrualhistoryvisbility,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: textstyle(
                          text: 'ageOfMenarche'.tr()),
                      subtitle: Text(args.AgeofMenarche!),
                    ),
                    ListTile(
                      title: textstyle(
                          text: 'durationOfMenses'.tr()),
                      subtitle: Text(args.DurationofMenses!),
                    ),
                    ListTile(
                      title: textstyle(
                          text:
                              'intervalOfMenstrualCycle'.tr()),
                      subtitle: Text(args.IntervalofCycle!),
                    )
                  ],
                ),
              ),
              assesmentsubtitle(
                text: 'obstetricHistory'.tr(),
                onPressed: () {
                  setState(() {
                    Obstetrichistoryvisbility = !Obstetrichistoryvisbility;
                  });
                },
              ),
              Visibility(
                visible: Obstetrichistoryvisbility,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: textstyle(
                          text: 'fullTermBirth'.tr()),
                      subtitle: Text(args.FallTermPregancy!),
                    ),
                    ListTile(
                      title: textstyle(
                          text: 'pretermBirth'.tr()),
                      subtitle: Text(args.Pretermpregancy!),
                    ),
                    ListTile(
                      title: textstyle(
                          text: 'abortion'.tr()),
                      subtitle: Text(args.Abortion!),
                    ),
                    ListTile(
                      title: textstyle(
                          text: 'liveBabies'.tr()),
                      subtitle: Text(args.LiveBabies!),
                    )
                  ],
                ),
              ),
              assesmentsubtitle(
                text: 'investigations'.tr(),
                onPressed: () {
                  setState(() {
                    Investegationsvisbility = !Investegationsvisbility;
                  });
                },
              ),
              Visibility(
                visible: Investegationsvisbility,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: textstyle(
                          text: 'bloodGroup'.tr()),
                      subtitle: Text(args.BloodGroup!),
                    ),
                    ListTile(
                      title: textstyle(
                          text: 'rhFactor'.tr()),
                      subtitle: Text(args.RhFactor!),
                    ),
                    ListTile(
                      title:
                          textstyle(text: 'tORCH'.tr()),
                      subtitle: Text(args.TORCH!),
                    ),
                    ListTile(
                      title:
                          textstyle(text: 'sugar'.tr()),
                      subtitle: Text(args.Sugar!),
                    ),
                    ListTile(
                      title:
                          textstyle(text: 'ketone'.tr()),
                      subtitle: Text(args.Ketone!),
                    ),
                    ListTile(
                      title: textstyle(text: 'uss'.tr()),
                      subtitle: Text(args.uss!),
                    )
                  ],
                ),
              ),
              assesmentsubtitle(
                text: 'PhysicalExamination'.tr(),
                onPressed: () {
                  setState(() {
                    PhysicalExaminationvisbility =
                        !PhysicalExaminationvisbility;
                  });
                },
              ),
              Visibility(
                visible: PhysicalExaminationvisbility,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title:
                          textstyle(text: 'weight'.tr()),
                      subtitle: Text(args.Weight!),
                    ),
                    ListTile(
                      title:
                          textstyle(text: 'height'.tr()),
                      subtitle: Text(args.Height!),
                    ),
                    ListTile(
                      title: textstyle(
                          text:
                              'prePregancyBodyMassindex'.tr()),
                      subtitle: Text(args.PrePregancyBodyMassIndex!),
                    ),
                    ListTile(
                      title: textstyle(
                          text: 'bloodPressure'.tr()),
                      subtitle: Text(args.BloodPressure!),
                    ),
                    ListTile(
                      title:
                          textstyle(text: 'pulse'.tr()),
                      subtitle: Text(args.Pluse!),
                    ),
                    ListTile(
                      title: textstyle(
                          text: 'headNeck'.tr()),
                      subtitle: Text(args.HeadNeckdropdown!),
                    ),
                    ListTile(
                      title: textstyle(
                          text: 'headNeck'.tr()),
                      subtitle: Text(args.headneckspecify!),
                    ),
                    ListTile(
                      title: textstyle(
                          text: 'breastNipples'.tr()),
                      subtitle: Text(args.BreastsNipplesdropDwonValue!),
                    ),
                    ListTile(
                      title: textstyle(
                          text: 'breastNipples'.tr()),
                      subtitle: Text(args.BreastsNipplesspeficy!),
                    ),
                    ListTile(
                      title:
                          textstyle(text: 'chest'.tr()),
                      subtitle: Text(args.ChestdropDwonValue!),
                    ),
                    ListTile(
                      title:
                          textstyle(text: 'chest'.tr()),
                      subtitle: Text(args.Chestspecify!),
                    ),
                    ListTile(
                      title: textstyle(
                          text: 'teethGums'.tr()),
                      subtitle: Text(args.TeethGumsdropDwonValue!),
                    ),
                    ListTile(
                      title: textstyle(
                          text: 'teethGums'.tr()),
                      subtitle: Text(args.TeethGumsspecify!),
                    ),
                    ListTile(
                      title:
                          textstyle(text: 'heart'.tr()),
                      subtitle: Text(args.HeartdropDwonValue!),
                    ),
                    ListTile(
                      title:
                          textstyle(text: 'heart'.tr()),
                      subtitle: Text(args.Heartspecify!),
                    ),
                    ListTile(
                      title:
                          textstyle(text: 'abdomen'.tr()),
                      subtitle: Text(args.AbdomendropDwonValue!),
                    ),
                    ListTile(
                      title:
                          textstyle(text: 'abdomen'.tr()),
                      subtitle: Text(args.Abdomenspecify!),
                    ),
                    ListTile(
                      title: textstyle(
                          text: 'backbone'.tr()),
                      subtitle: Text(args.BackbonedropDwonValue!),
                    ),
                    ListTile(
                      title: textstyle(
                          text: 'backbone'.tr()),
                      subtitle: Text(args.Backbonespecify!),
                    ),
                    ListTile(
                      title: textstyle(
                          text:
                              'varicositiesextremities'.tr()),
                      subtitle: Text(args.varicositiesExtremitiesValue!),
                    ),
                    ListTile(
                      title: textstyle(
                          text:'varicositiesextremities'.tr()),
                      subtitle: Text(args.varicositiesExtremitiesspecify!),
                    ),
                    ListTile(
                      title:
                          textstyle(text: 'edema'.tr()),
                      subtitle: Text(args.EdemadropDwonValue!),
                    ),
                    ListTile(
                      title:
                          textstyle(text: 'edema'.tr()),
                      subtitle: Text(args.Edemaspecify!),
                    )
                  ],
                ),
              ),
              assesmentsubtitle(
                text: 'complains_of_first_trimester'.tr(),
                onPressed: () {
                  setState(() {
                    complainsoffirsttrimestervisbility =
                        !complainsoffirsttrimestervisbility;
                  });
                },
              ),
              Visibility(
                  visible: complainsoffirsttrimestervisbility,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: textstyle(text: 'nausea'.tr()),
                        subtitle: Text(args.nausea!),
                      ),
                      ListTile(
                        title: textstyle(text: 'vomiting'.tr()),
                        subtitle: Text(args.vomiting!),
                      ),
                      ListTile(
                        title: textstyle(text: 'urinary_frequency'.tr()),
                        subtitle: Text(args.Urinaryfrequency!),
                      ),
                      ListTile(
                        title: textstyle(text: 'fatigue'.tr()),
                        subtitle: Text(args.fatigue!),
                      ),
                      ListTile(
                        title: textstyle(text: 'breast_tenderness'.tr()),
                        subtitle: Text(args.breasttndrness!),
                      ),
                      ListTile(
                        title: textstyle(text: 'vaginal_discharge'.tr()),
                        subtitle: Text(args.Vignaldiscarge!),
                      ),
                      ListTile(
                        title: textstyle(text: 'headache'.tr()),
                        subtitle: Text(args.headache!),
                      )
                    ],
                  )),
              assesmentsubtitle(
                text: 'complains_of_second_trimester'.tr(),
                onPressed: () {
                  setState(() {
                    complainsofsecondtrimestervisbility =
                        !complainsofsecondtrimestervisbility;
                  });
                },
              ),
              Visibility(
                  visible: complainsofsecondtrimestervisbility,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: textstyle(text: 'heart_burn'.tr()),
                        subtitle: Text(args.heartburn!),
                      ),
                      ListTile(
                        title: textstyle(text: 'faintness'.tr()),
                        subtitle: Text(args.faitness!),
                      ),
                      ListTile(
                        title: textstyle(text: 'constipation'.tr()),
                        subtitle: Text(args.constipation!),
                      ),
                      ListTile(
                        title: textstyle(text: 'flatulence'.tr()),
                        subtitle: Text(args.flatulence!),
                      ),
                      ListTile(
                        title: textstyle(text: 'varicose_veins'.tr()),
                        subtitle: Text(args.varicoseviens!),
                      )
                    ],
                  )),
              assesmentsubtitle(
                text: 'complains_of_third_trimester'.tr(),
                onPressed: () {
                  setState(() {
                    complainsofthirdtrimestervisbility =
                        !complainsofthirdtrimestervisbility;
                  });
                },
              ),
              Visibility(
                  visible: complainsofthirdtrimestervisbility,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: textstyle(text: 'dyspnea'.tr()),
                        subtitle: Text(args.dyspena!),
                      ),
                      ListTile(
                        title: textstyle(text: 'backache'.tr()),
                        subtitle: Text(args.backache!),
                      ),
                      ListTile(
                        title: textstyle(text: 'ankle_edema'.tr()),
                        subtitle: Text(args.ankleedma!),
                      ),
                      ListTile(
                        title: textstyle(text: 'leg_cramps'.tr()),
                        subtitle: Text(args.legCramps!),
                      ),
                      // ListTile(
                      //   title: textstyle(text: 'Hemorrhiods'),
                      //   subtitle: Text(args.hemorrhiods!),
                      // )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
