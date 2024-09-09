// import 'package:flutter/material.dart';
// import 'package:pregancy/patient/HomePatientscrrens/guide/guidesubpage.dart';
//
//
// import '../../../doctor/constants.dart';
//
// class preelcamcyahighrisk extends StatelessWidget {
//   static String preelcamcyahighriskid = 'preelcamcyahighrisk';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: kprimarycolor,
//           title: Text(
//             'Pre-eclampsia',
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               subimage(Cardimage: 'assets/images/preeclmsiahighrisk.jpg'),
//               guidesubpagemain(
//                   title: 'What week of pregnancy does preeclampsia start?',
//                   text:
//                   'Preeclampsia typically occurs after 20 weeks of pregnancy, but it can come earlier. Most preeclampsia occurs at or near term (37 weeks gestation). Preeclampsia can also come after delivery (postpartum preeclampsia), which usually occurs between the first few days to one week after delivery. In rare cases, it begins weeks after delivery.'),
//               guidesubpagemain2(
//                   title: 'How is preeclampsia treated?',
//                   text:
//                   'Your healthcare provider will advise you on the best way to treat preeclampsia. Treatment generally depends on how severe your preeclampsia is and how far along you are in pregnancy.If you Are close to full term (37 weeks pregnant or greater), your baby will probably be delivered early. You can still have a vaginal delivery, but sometimes a Cesarean delivery (C-section) is recommended. Your healthcare provider may give you medication to help the fetuss lungs develop and manage your blood pressure until the baby can be delivered. Sometimes it is safer to deliver the baby early than to risk prolonging the pregnancy.',
//                   text2:
//                   'When preeclampsia develops earlier in pregnancy, youll be monitored closely in an effort to prolong the pregnancy and allow for the fetus to grow and develop. Youll have more prenatal appointments, including ultrasounds, urine tests and blood draws. You may be asked to check your blood pressure at home. If you are diagnosed with severe preeclampsia, you could remain in the hospital until you deliver your baby.If the preeclampsia worsens or becomes more severe, your baby will need to be delivered.During labor and following delivery, people with preeclampsia are often given magnesium intravenously (directly into the vein) to prevent the development of eclampsia (seizures from preeclampsia).'),
//               guidesubpagemain(
//                 title: 'Is there a cure for preeclampsia?',
//                 text:
//                 'No, there isn t a cure for preeclampsia. Preeclampsia can only be cured with delivery. Your healthcare provider will still want to monitor you for several weeks after delivery to make sure your symptoms go away.',
//               )
//             ],
//           ),
//         ));
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pregancy/patient/HomePatientscrrens/guide/guidesubpage.dart';


import '../../../doctor/constants.dart';

class preelcamcyahighrisk extends StatelessWidget {
  static String preelcamcyahighriskid = 'preelcamcyahighrisk';
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
          child: Column(
            children: [
              subimage(Cardimage: 'assets/images/preeclmsiahighrisk.jpg'),
              guidesubpagemain(
                  title: 'pregnancy_week_preeclampsia'.tr(),
                  text:
                  'pregnancy_week_preeclampsia_response'.tr()),
              guidesubpagemain(
                  title: 'pregnancy_treatment'.tr(),
                  text:
                  'pregnancy_treatment_response'.tr(),

              ),
              guidesubpagemain(
                title: 'preeclampsia_monitoring'.tr(),
                text:
                'preeclampsia_monitoring_response'.tr(),
              )
            ],
          ),
        ));
  }
}
