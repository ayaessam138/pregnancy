// import 'package:flutter/material.dart';
// import 'package:pregancy/patient/HomePatientscrrens/guide/guidesubpage.dart';
//
//
//
// import '../../../doctor/constants.dart';
//
// class diabiteshighrisk extends StatelessWidget {
//   static String diabiteshighriskid = 'diabiteshighrisk';
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
//           child: Column(
//             children: [
//               subimage(Cardimage: 'assets/images/diabiiteshighrisk.jpg'),
//               Text('Tips for Women with Gestational Diabetes',
//                   style: TextStyle(
//                       color: kprimarycolor, fontWeight: FontWeight.bold)),
//               guidesubpagemain(
//                   title: 'Eat Healthy Foods',
//                   text:
//                       'Eat healthy foods from a meal plan made for a person with diabetes. A dietitian can help you create a healthy meal plan. A dietitian can also help you learn how to control your blood sugar while you are pregnant.'),
//               guidesubpagemain(
//                   title: 'Exercise Regularly',
//                   text:
//                       'tExercise is another way to keep blood sugar under control. It helps to balance food intake. After checking with your doctor, you can exercise regularly during and after pregnancy. Get at least 30 minutes of moderate-intensity physical activity at least five days a week. This could be brisk walking, swimming, or actively playing with childrenext'),
//               guidesubpagemain(
//                   title: 'Monitor Blood Sugar Often',
//                   text:
//                       'Because pregnancy causes the body’s need for energy to change, blood sugar levels can change very quickly. Check your blood sugar often, as directed by your doctor.'),
//               guidesubpagemain(
//                   title: 'Take Insulin, If Needed',
//                   text:
//                       'Sometimes a woman with gestational diabetes must take insulin. If insulin is ordered by your doctor, take it as directed in order to help keep blood sugar under control.'),
//               guidesubpagemain(
//                   title: 'Get Tested for Diabetes after Pregnancy',
//                   text:
//                       'Get tested for diabetes 6 to 12 weeks after your baby is born, and then every 1 to 3 years.For most women with gestational diabetes, the diabetes goes away soon after delivery. When it does not go away, the diabetes is called type 2 diabetes. Even if the diabetes does go away after the baby is born, half of all women who had gestational diabetes develop type 2 diabetes later. It’s important for a woman who has had gestational diabetes to continue to exercise and eat a healthy diet after pregnancy to prevent or delay getting type 2 diabetes. She should also remind her doctor to check her blood sugar every 1 to 3 years.')
//             ],
//           ),
//         ));
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pregancy/patient/HomePatientscrrens/guide/guidesubpage.dart';

import '../../../doctor/constants.dart';

class diabiteshighrisk extends StatelessWidget {
  static String diabiteshighriskid = 'diabiteshighrisk';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kprimarycolor,
          title:  Text(
            'diabetes'.tr(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const subimage(Cardimage: 'assets/images/diabiiteshighrisk.jpg'),
              Text('tips_gestational_diabetes'.tr(),
                  style: const TextStyle(
                      color: kprimarycolor, fontWeight: FontWeight.bold)),
              guidesubpagemain(
                  title: 'healthy_eating'.tr(),
                  text: 'meal_plan_description'.tr()),
              guidesubpagemain(
                  title: 'exercise_regularly'.tr(),
                  text: 'exercise_description'.tr()),
              guidesubpagemain(
                  title: 'monitor_blood_sugar'.tr(),
                  text: 'monitoring_description'.tr()),
              guidesubpagemain(
                  title: 'take_insulin'.tr(), text: 'insulin_description'.tr()),
              guidesubpagemain(
                  title: 'diabetes_test_after_pregnancy'.tr(),
                  text: 'diabetes_test_description'.tr())
            ],
          ),
        ));
  }
}
