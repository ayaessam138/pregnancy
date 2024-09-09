// import 'package:flutter/material.dart';
//
// import '../../constants.dart';
// import 'guidesubpage.dart';
//
// class Maternalfetalassessment extends StatelessWidget {
//   static String Maternalfetalassessmentid = 'Maternalfetalassessmentid';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kprimarycolor,
//         title: Text(
//           'Maternal Fetal Assessment',
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             subimage(
//                 Cardimage: 'assets/images/Maternal and fetal assessment.jpg'),
//             guidesubpagemain(
//                 title: 'Anemia',
//                 text:
//                     'Full blood count testing is the recommended method for diagnosing anaemia in pregnancy. In settings where full blood count testing is not available, on-site haemoglobin testing with a haemoglobinometer is recommended over the use of the haemoglobin colour scale as the method for diagnosing anaemia in pregnancy.'),
//             guidesubpagemain(
//                 title: 'Maternal assessment Asymptomaticbacteriuria (ASB)',
//                 text:
//                     ' Midstream urine culture is the recommended method for diagnosing asymptomatic bacteriuria (ASB) in pregnancy. In settings where urine culture is not available, on-site midstream urine Gram- staining is recommended over the use of dipstick tests as the method for diagnosing ASB in pregnancy.'),
//             guidesubpagemain(
//                 title: 'Intimate partner violence (IPV)',
//                 text:
//                     'Clinical enquiry about the possibility of intimate partner violence(IPV) should be strongly considered at antenatal care visits when assessing conditions that may be caused or complicated by IPV in order to improve clinical diagnosis and subsequent care, where there is the capacity to provide a supportive response (including referral where appropriate) and where the WHO minimum requirements are met.mn'),
//             guidesubpagemain(
//                 title: 'Gestational diabetes mellitus(GDM)',
//                 text:
//                     'Hyperglycaemia first detected at any time during pregnancy should be classified as either gestational diabetes mellitus (GDM) or diabetes mellitus in pregnancy, according to WHO criteria.'),
//             guidesubpagemain(
//                 title: 'Tobacco use',
//                 text:
//                     ' Health-care providers should ask all pregnant women about their use of alcohol and other substances (past and present) as early as possible in the pregnancy and at every antenatal care visit.'),
//             guidesubpagemain(
//                 title: 'Substance use',
//                 text:
//                     'Health-care providers should ask all pregnant women about their use of alcohol and other substances (past and present) as early as possible in the pregnancy and at every antenatal care visit.'),
//             guidesubpagemain(
//                 title: 'Human immuno-deficiency virus(HIV) and syphilis',
//                 text:
//                     'In high-prevalence settings, provider-initiated testing and counselling (PITC) for HIV should be considered a routine component of the package of care for pregnant women in all antenatal care settings. In low-prevalence settings, PITC can be considered for pregnant women in antenatal care settings as a key component of the effort to eliminate mother-to-child transmission of HIV, and to integrate HIV testing with syphilis, viral or other key tests, as relevant to the setting, and to strengthen the underlying maternal and child health systems.'),
//             guidesubpagemain(
//                 title: 'Tuberculosis (TB)',
//                 text:
//                     ' In settings where the tuberculosis (TB) prevalence in the general population is 100/100 000 population or higher, systematic screening for active TB should be considered for pregnant women as part of antenatal care')
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'guidesubpage.dart';

class Maternalfetalassessment extends StatelessWidget {
  static String Maternalfetalassessmentid = 'Maternalfetalassessmentid';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimarycolor,
        title: Text(
          'assessment_fetal_maternal'.tr(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            subimage(
                Cardimage: 'assets/images/Maternal and fetal assessment.jpg'),
            guidesubpagemain(
                title: 'anemia'.tr(), text: 'anemia_diagnosis_pregnancy'.tr()),
            guidesubpagemain(
                title: 'MaternalassessmentAsymptomaticBacteriuria'.tr(),
                text: 'bacteriuria_diagnosis_pregnancy'.tr()),
            guidesubpagemain(
                title: 'intimate_partner_violence'.tr(),
                text: 'ipv_enquiry_recommendation'.tr()),
            guidesubpagemain(
                title: 'Gestational diabetes mellitus(GDM)',
                text:
                    'Hyperglycaemia first detected at any time during pregnancy should be classified as either gestational diabetes mellitus (GDM) or diabetes mellitus in pregnancy, according to WHO criteria.'),
            guidesubpagemain(
                title: 'Tobaccouse'.tr(),
                text:
                    'Health-careprovidersshouldaskallpregnantwomenabouttheiruseofalcohol'
                        .tr()),
            guidesubpagemain(
                title: 'Humanimmunodeficiencyvirus(HIV)andsyphilis'.tr(),
                text: 'Inhigh-prevalencesettings'.tr()),
            guidesubpagemain(
                title: 'tuberculosis'.tr(),
                text: 'Insettingswherethetuberculosis'.tr())
          ],
        ),
      ),
    );
  }
}
