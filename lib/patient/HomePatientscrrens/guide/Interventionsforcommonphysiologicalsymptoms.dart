// import 'package:flutter/material.dart';
//
// import '../../constants.dart';
// import 'guidesubpage.dart';
//
// class Interventionsphysiologicalsymptoms extends StatelessWidget {
//   static String Interventionsphysiologicalsymptomsid =
//       'Interventionsphysiologicalsymptoms';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kprimarycolor,
//         title: Text(
//           ' Common Physiological Changes',
//         ),
//       ),
//       body: SingleChildScrollView(
//           child: Column(
//         children: [
//           subimage(
//               Cardimage:
//                   'assets/images/Interventions for common physiological symptoms.jpg'),
//           guidesubpagemain(
//               title: 'Nausea and vomiting Heartburn',
//               text:
//                   'Ginger, chamomile, vitamin B6 and/or acupuncture are recommended for the relief of nausea in early pregnancy, based on a woman s preferences and available options.'),
//           guidesubpagemain(
//               title: 'Heartburn',
//               text:
//                   'Advice on diet and lifestyle is recommended to prevent and relieve heartburn in pregnancy. Antacid preparations can be offered to women with troublesome symptoms that are not relieved by lifestyle modification.'),
//           guidesubpagemain(
//               title: 'Leg cramps',
//               text:
//                   'Magnesium, calcium or non-pharmacological treatment options can be used for the relief of leg cramps in pregnancy, based on a woman s preferences and available options.'),
//           guidesubpagemain(
//               title: 'Low back and pelvic pain',
//               text:
//                   'texRegular exercise throughout pregnancy is recommended to prevent low back and pelvic pain. There are a number of different treatment options that can be used, such as physiotherapy, support belts and acupuncture, based on a womans preferences and available options.'),
//           guidesubpagemain(
//               title: 'Constipation',
//               text:
//                   ' Wheat bran or other fibre supplements can be used to relieve constipation in pregnancy if the condition fails to respond to dietary modification, based on a womans preferences and available options.'),
//           guidesubpagemain(
//               title: 'Varicose veins & oedema',
//               text:
//                   ' Non-pharmacological options, such as compression stockings, leg elevation and water immersion, can be used for the management of varicose veins and oedema in pregnancy, based on a woman s preferences and available options.t')
//         ],
//       )),
//     );
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'guidesubpage.dart';

class Interventionsphysiologicalsymptoms extends StatelessWidget {
  static String Interventionsphysiologicalsymptomsid =
      'Interventionsphysiologicalsymptoms';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimarycolor,
        title: Text(
          'changes_physiological_common'.tr(),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              const subimage(
                  Cardimage:
                  'assets/images/Interventions for common physiological symptoms.jpg'),
              guidesubpagemain(
                  title: 'vomiting_and_nausea'.tr(),
                  text: 'ginger_chamomile_vitaminB6_acupuncture_recommended'.tr()),
              guidesubpagemain(
                  title: 'heartburn'.tr(),
                  text: 'advice_on_diet_and_lifestyle_recommended'.tr()),
              guidesubpagemain(
                  title: 'leg_cramps'.tr(),
                  text:
                  'magnesium_calcium_non_pharmacological_treatment_recommended'
                      .tr()),
              guidesubpagemain(
                  title: 'low_back_and_pelvic_pain'.tr(),
                  text: 'regular_exercises_recommended'.tr()),
              guidesubpagemain(
                  title: 'constipation'.tr(),
                  text: 'wheat_bran_fiber_supplements_recommended'.tr()),
              guidesubpagemain(
                  title: 'varicose_veins_and_edema'.tr(),
                  text: 'non_pharmacological_options_recommended'.tr())
            ],
          )),
    );
  }
}