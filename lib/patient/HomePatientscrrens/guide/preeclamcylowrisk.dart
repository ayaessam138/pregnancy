// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
// import '../../constants.dart';
// import 'guidesubpage.dart';
//
// class preelcamcyalowrisk extends StatelessWidget {
//   static String preelcamcyalowriskid = 'preelcamcyalowrisk';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: kprimarycolor,
//           title: Text(
//             'preeclampsia'.tr(),
//           ),
//         ),
//         body: SingleChildScrollView(
//             child: Column(children: [
//           subimage(Cardimage: 'assets/images/preclapisa lowrisk.jpg'),
//           guidesubpagemain(
//               title: 'What Is Pre-eclampsia?',
//               text:
//                   'If you have never had high blood pressure before but your blood pressure rises higher than 140/90 mm Hg after week 20 of your pregnancy, you may have preeclampsia (also called Toxemia). You also may be tested for protein in your urine because of stress on your kidneys.'),
//           guidesubpagemain(
//               title: 'Can I Prevent Preeclampsia?',
//               text:
//                   'Healthy lifestyle •Regular exercise • a diet high in vegetables and low in processed foods. •Exercise and a healthy diet can also help to control obesity, chronic hypertension, and diabetes, which are all risk factors for preeclampsia.'),
//           Align(
//             child: Text(
//               'Clinical Practice Recommendations for The Prevention and  Management of Pre-Eclampsia and Eclampsia',
//               style: TextStyle(color: kprimarycolor),
//             ),
//             alignment: Alignment.topLeft,
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           guidesubpagemain(
//               title: 'Practices Recommended',
//               text:
//                   ' Calcium supplementation duringpregnancy in areas where calcium intake islow (<900 mg/day). Low-dose acetylsalicylic acid (aspirin,75 mg) for the prevention of pre-eclampsiain women at high risk of developing the condition.Antihypertensive drugs for pregnantwomen with severe hypertension.In women with severe pre-eclampsia, if there is a viable fetus and the pregnancy is less than 37 weeks of gestation, expectant management can be considered, provided that uncontrolled maternal hypertension,increasing maternal organ dysfunction, and fetal distress do not occur and the conditions can be monitored.'),
//           guidesubpagemain(
//               title: 'Practices NOT Recommended',
//               text:
//                   '* Vitamin D supplementation during pregnancy.* Calcium supplementation during pregnancy in areas where calcium deficiency is not present.* Individual or combined vitamin C and vitamin E supplementation.* Use of diuretics, particularly thiazides,for prevention of pre-eclampsia and its complications.* Advice to rest at home.*Strict bed rest for pregnant women with hypertension (with or without proteinuria).* Restriction in dietary salt intake.'),
//           guidesubpagemain2(
//               title: 'Practice Implication',
//               text:
//                   'Provide calcium to all women with low calcium intake and low-dose acetylsalicylic acid to selected groups for the prevention of PE/E.While vitamin supplementation can be useful for other health conditions, do not provideVitamins C, D, or E, to pregnant women as part of a strategy for prevention of PE/E.Give antihypertensive drugs, but not diuretics, to pregnant women with severe hypertension.',
//               text2:
//                   'Do not advise rest or dietary saltrestriction for pregnant women to prevent pre-eclampsia or its complications.For a woman with severe pre-eclampsia during a preterm pregnancy (<37 weeks), clinicians can monitor the woman if: (1) herblood pressure is under control (2) there is no fetal distress; and(3) there are no signs of maternal organ dysfunction. Continuous monitoring is necessary during this period of expectant management.')
//         ])));
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'guidesubpage.dart';

class preelcamcyalowrisk extends StatelessWidget {
  static String preelcamcyalowriskid = 'preelcamcyalowrisk';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kprimarycolor,
          title: Text(
            'preeclampsia'.tr(),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          subimage(Cardimage: 'assets/images/preclapisa lowrisk.jpg'),
          guidesubpagemain(
              title: 'preeclampsia_definition'.tr(),
              text: 'preeclampsia_definition_answer'.tr()),
          guidesubpagemain(
              title: 'preeclampsia_prevention'.tr(),
              text: 'preeclampsia_prevention_answer'.tr()),
          Align(
            child: Text(
              'ClinicalPracticeRecommendationsforThePreventionandManagementofPre-EclampsiaandEclampsia'
                  .tr(),
              style: TextStyle(color: kprimarycolor),
            ),
            alignment: Alignment.topLeft,
          ),
          SizedBox(
            height: 15,
          ),
          guidesubpagemain(
              title: 'preeclampsia_practices'.tr(),
              text: 'preeclampsia_practices_answer'.tr()),
          guidesubpagemain(
              title: 'preeclampsia_not_recommended'.tr(),
              text: 'preeclampsia_not_recommended_answer'.tr()),
          guidesubpagemain2(
              title: 'PracticeImplication'.tr(),
              text: 'Providecalcium'.tr(),
              text2: 'Donotadviserestordietary'.tr())
        ])));
  }
}
