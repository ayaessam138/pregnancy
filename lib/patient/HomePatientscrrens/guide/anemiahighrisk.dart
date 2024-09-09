//
// import 'package:flutter/material.dart';
// import 'package:pregancy/patient/HomePatientscrrens/guide/guidesubpage.dart';
//
//
// import '../../../doctor/constants.dart';
//
// class anemiahighrisk extends StatelessWidget {
//   static String anemiahighriskid = 'anemiahighrisk';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: kprimarycolor,
//           title: Text(
//             'Anemia',
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               subimage(Cardimage: 'assets/images/anemihighrisk.jpg'),
//               guidesubpagemain(
//                   title: 'How does anemia affect the baby during pregnancy?',
//                   text:
//                   'The developing fetus relies on you to get enough iron, vitamin B12 and folic acid. Anemia can affect the growth of the fetus, especially during the first trimester.If anemia goes untreated, your baby is at higher risk of having anemia after birth, which can lead to developmental problems. Also, anemia increases the risk of delivering your baby early and having a low-weight baby.'),
//               guidesubpagemain(
//                   title: 'Can anemia during pregnancy cause miscarriage?',
//                   text:
//                   'No. Anemia during pregnancy doesn’t directly cause miscarriage, but severe anemia can cause pregnancy complications.'),
//               guidesubpagemain(
//                   title: 'What are the symptoms of anemia during pregnancy?',
//                   text:
//                   'You may not notice any symptoms of mild anemia at first. Over time, you may feel:Fatigue,Cold,Shortness of breath.'),
//               guidesubpagemain(
//                   title: 'How is anemia treated in pregnancy?',
//                   text:
//                   'Mild to moderate anemia: Your provider will usually treat it with a daily prenatal vitamin or iron supplement. This gives your body healthy amounts of iron, vitamin B12 and folic acid.Severe anemia: You may need a blood transfusion'),
//               guidesubpagemain2(
//                 title: 'How can I treat anemia at home while pregnant?',
//                 text:
//                 'The best way to treat the most common types of anemia is to make sure you’re getting enough iron, B12 and folic acid. Take a prenatal vitamin every day. Talk to your healthcare provider about which prenatal vitamin they recommend.',
//                 text2:
//                 'Diet changes can help, too. Eat more foods that are high in iron like spinach, lean beef and turkey. Foods that are high in vitamins that help your body absorb iron (like vitamin C) are important as well, including citrus fruits, tomatoes and peppers.',
//               ),
//               guidesubpagemain(
//                   title:
//                   'How soon after treatment for anemia during pregnancy will I notice a change?',
//                   text:
//                   'If you have iron-deficiency, B12-deficiency or folate-deficiency anemia, you should begin to feel better within a few days of taking a supplement. If you don’t notice a change, talk to your provider.')
//             ],
//           ),
//         ));
//   }
// }


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pregancy/patient/HomePatientscrrens/guide/guidesubpage.dart';

import '../../../doctor/constants.dart';

class anemiahighrisk extends StatelessWidget {
  static String anemiahighriskid = 'anemiahighrisk';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kprimarycolor,
          title: Text(
            'anemia'.tr(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              subimage(Cardimage: 'assets/images/anemihighrisk.jpg'),
              guidesubpagemain(
                  title:
                      'how_does_anemia_affect_the_fetus_during_pregnancy'.tr(),
                  text: 'anemia_affects_the_growth_of_the_fetus'.tr()),
              guidesubpagemain(
                  title: 'does_anemia_cause_miscarriage'.tr(),
                  text: 'anemia_does_not_directly_cause_miscarriage'.tr()),
              guidesubpagemain(
                  title: 'symptoms_of_anemia_during_pregnancy'.tr(),
                  text:
                      'symptoms_of_anemia_may_include_fatigue_cold_and_shortness_of_breath'
                          .tr()),
              guidesubpagemain(
                  title: 'how_is_anemia_treated_during_pregnancy'.tr(),
                  text:
                      'mild_to_moderate_anemia_can_be_treated_with_prenatal_vitamins_or_iron_supplements'
                          .tr()),
              guidesubpagemain(
                title: 'how_can_i_treat_anemia_at_home_during_pregnancy'.tr(),
                text:
                    'making_dietary_changes_and_taking_prenatal_vitamins_can_help_treat_anemia'
                        .tr(),
              ),
              guidesubpagemain(
                  title:
                      'when_will_i_notice_a_change_after_treatment_for_anemia_during_pregnancy'
                          .tr(),
                  text:
                      'if_you_have_iron_deficiency_b12_deficiency_or_folate_deficiency_anemia_you_should_feel_better_within_a_few_days_of_taking_a_supplement'
                          .tr())
            ],
          ),
        ));
  }
}
