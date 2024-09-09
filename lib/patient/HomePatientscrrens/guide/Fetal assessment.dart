// import 'package:flutter/material.dart';
//
// import '../../constants.dart';
// import 'guidesubpage.dart';
//
// class Fetalassessment extends StatelessWidget {
//   static String fetalassessment = 'Fetal assessment';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: kprimarycolor,
//           title: Text(
//             ' Fetal Assessment',
//           ),
//         ),
//         body: SingleChildScrollView(
//             child: Column(
//           children: [
//             subimage(Cardimage: 'assets/images/fetal assesment.jpg'),
//             guidesubpagemain(
//                 title: 'Daily fetal movement counting',
//                 text:
//                     'Daily fetal movement counting, such as with "count-to-ten" kick charts, is only recommended in the context of rigorous research.'),
//             guidesubpagemain(
//                 title: 'Symphysis-fundal height (SFH) measurement',
//                 text:
//                     'Replacing abdominal palpation with symphysis-fundal height (SFH) measurement for the assessment of fetal growth is not recommended to improve perinatal outcomes. A change from what is usually practiced (abdominal palpation or SFH measurement) in a particular setting is not recommended.'),
//             guidesubpagemain(
//                 title: 'Antenatal cardio- tocography',
//                 text:
//                     'Routine antenatal cardiotocography" is not recommended for pregnant women to improve maternal and perinatal outcomes. '),
//             guidesubpagemain(
//                 title: 'Ultrasound scan',
//                 text:
//                     ' One ultrasound scan before 24 weeks of gestation (early ultrasound) is recommended for pregnant women to estimate gestational age, improve detection of fetal anomalies and multiple pregnancies, reduce induction of labour for post-term pregnancy, and improve a woman s pregnancy experience.'),
//             guidesubpagemain(
//                 title: 'Doppler ultrasound of fetal blood vessels',
//                 text:
//                     ' Routine Doppler ultrasound examination is not recommended for pregnant women to improve maternal and perinatal outcomes."')
//           ],
//         )));
//   }
// }
//
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'guidesubpage.dart';

class Fetalassessment extends StatelessWidget {
  static String fetalassessment = 'Fetal assessment';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kprimarycolor,
          title: Text(
            'assessment_fetal'.tr(),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                subimage(Cardimage: 'assets/images/fetal assesment.jpg'),
                guidesubpagemain(
                    title: 'counting_movement_fetal_daily'.tr(),
                    text:
                    'research_rigorous_of_context'.tr()),
                guidesubpagemain(
                    title: 'symphysis_fetal_height_measurement'.tr(),
                    text:
                    'not_recommended_for_fetal_growth'.tr()),
                guidesubpagemain(
                    title: 'cardiotocography_antenatal'.tr(),
                    text:
                    'not_recommended_for_pregnant_women'.tr()),
                guidesubpagemain(
                    title: 'scan_ultrasound'.tr(),
                    text:
                    'recommended_for_pregnant_women'.tr()),
                guidesubpagemain(
                    title: 'vessels_blood_fetal_of_ultrasound_doppler'.tr(),
                    text:
                    'not_recommended_for_pregnant_women_doppler'.tr())
              ],
            )));
  }
}
