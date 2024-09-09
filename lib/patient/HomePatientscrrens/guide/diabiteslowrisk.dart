// import 'package:flutter/material.dart';
//
// import '../../constants.dart';
// import 'guidesubpage.dart';
//
// class diabiteslowrisk extends StatelessWidget {
//   static String diabiteslowriskid = 'diabiteslowrisk';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: kprimarycolor,
//           title: Text(
//             'Diabetes',
//           ),
//         ),
//         body: SingleChildScrollView(
//             child: Column(
//           children: [
//             subimage(Cardimage: 'assets/images/diabites low risk.jpg'),
//             guidesubpagemain(
//                 title: 'What is gestational diabetes?',
//                 text:
//                     '•Impaired glucose tolerance (IGT) and impaired fasting glycaemia (IFG) are intermediate conditions in the transition between normality and diabetes.'),
//             guidesubpagemain(
//                 title:
//                     'What increases my chance of developing gestational diabetes?',
//                 text:
//                     '•are overweight•had gestational diabetes before•have a parent, brother, or sister with type 2 diabetes•have prediabetes, meaning your blood glucose levels are higher than normal yet not high enough for a diagnosis of diabetes•are African American, American Indian, Asian American, Hispanic/Latina, or Pacific Islander American•have a hormonal disorder called polycystic ovary syndrome NIH external link, also known as PCOS'),
//             guidesubpagemain(
//                 title:
//                     'How can I lower my chance of developing gestational diabetes?',
//                 text:
//                     '•If you are thinking about becoming pregnant and are overweight, you can lower your chance of developing gestational diabetes by losing extra weight and increasing physical activity before you become pregnant. Taking these steps can improve how your body uses insulin and help your blood glucose levels stay normal')
//           ],
//         )));
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'guidesubpage.dart';

class diabiteslowrisk extends StatelessWidget {
  static String diabiteslowriskid = 'diabiteslowrisk';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kprimarycolor,
          title: Text(
            'diabetes'.tr(),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            subimage(Cardimage: 'assets/images/diabites low risk.jpg'),
            guidesubpagemain(
                title: 'gestational_diabetes_definition'.tr(),
                text: 'gestational_diabetes_definition_response'.tr()),
            guidesubpagemain(
                title: 'gestational_diabetes_igt_ifg'.tr(),
                text: 'gestational_diabetes_igt_ifg_response'.tr()),
            guidesubpagemain(
                title: 'gestational_diabetes_risk_factors'.tr(),
                text: 'gestational_diabetes_risk_factors_response'.tr()),
            guidesubpagemain(
                title: 'gestational_diabetes_prevention'.tr(),
                text: 'gestational_diabetes_prevention_response'.tr())
          ],
        )));
  }
}
