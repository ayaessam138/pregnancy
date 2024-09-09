// import 'package:flutter/material.dart';
// import 'package:pregancy/patient/constants.dart';
//
// import 'guidesubpage.dart';
//
// class Nutritionalinterventions extends StatelessWidget {
//   static String Nutritionalinterventionsid = 'Nutritionalmterventions';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: kprimarycolor,
//           title: Text(
//             'Nutritional interventions',
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               subimage(Cardimage: 'assets/images/Nutritional mterventions.jpg'),
//               guidesubpagemain2(
//                 title: 'Dietary interventions',
//                 text:
//                     'Counselling about healthy eating and keeping physically active during pregnacy is recommended for pregnant women to stay healthy and to prevent excessive weight gain during pregnancy.In undernourished populations, nutrition education on increasing daily energy and protein intake is recommended for pregnant women toreduce the risk of low-birth-weight neonat',
//                 text2:
//                     'In undernourished populations, balanced energy and protein dietary supplementation is recommended for pregnant women to reduce the risk of stillbirths and small-for-gestational-age neonates.,In undernourished populations, high-protein supplementation is not recommended for pregnant women to improve maternal and perinatal outcomes.',
//               ),
//               guidesubpagemain2(
//                 title: 'Iron& Folic Acid supplements',
//                 text:
//                     'Daily oral iron and folic acid supplementation with 30 mg to 60 mgof elemental iron and 400 µg (0.4 mg) of folic acid is recommended for pregnant women to prevent maternal anaemia, puerperal sepsis, low birth weight, and preterm birth.',
//                 text2:
//                     'Intermittent oral iron and folic acid supplementation with 120g of elemental iron and 2800 µg (2.8 mg) of folic acid once weekly isrecommended for pregnant women to improve maternal and neonatal outcomes if daily iron is not acceptable due to side-effects, and in populations with an anaemia prevalence among pregnant women of less than 20%.',
//               ),
//               guidesubpagemain(
//                 title: 'Calcium Supplements',
//                 text:
//                     'In populations with low dietary calcium intake, daily calciumsupplementation (1.5-2.0 g oral elemental calcium) is recommended forpregnant women to reduce the risk of pre-eclampsia.',
//               ),
//               guidesubpagemain(
//                   title: 'Vitamin A Supplements',
//                   text:
//                       'Vitamin A supplementation is only recommended for pregnant women in areas where vitamin A deficiency is a severe public health problem, to prevent night blindness.'),
//               guidesubpagemain(
//                   title: 'Zinc Supplements',
//                   text:
//                       'Zinc supplementation for pregnant women is only recommended in the cotext of rigorous research.'),
//               guidesubpagemain(
//                   title: 'Multiple Micronutrient Supplements',
//                   text:
//                       'Multiple micronutrient supplementation is not recommended for pregnant women to improve maternal and perinatal outcomes'),
//               guidesubpagemain(
//                   title: 'Vitamin B6(pyridoxine) Supplements',
//                   text:
//                       'Vitamin B6 (pyridoxine) supplementation is not recommended for pregnant women to improve maternal and perinatal outcomes.'),
//               guidesubpagemain(
//                   title: 'Vitamin E and C Supplements',
//                   text:
//                       ' Vitamin E and C supplementation is not recommended for pregnant women to improve maternal and perinatal outcomes.'),
//               guidesubpagemain(
//                   title: 'Vitamin D Supplements',
//                   text:
//                       'Vitamin D supplementation is not recommended for pregnant women to improve maternal and perinatal outcomes.'),
//               guidesubpagemain(
//                   title: 'Restricting Caffeine intake',
//                   text:
//                       'For pregnant women with high daily caffeine intake (more than 300 mg per day), lowering daily caffeine intake during pregnancy is recommended to reduce the risk of pregnancy loss and low-birth-weight neonates.')
//             ],
//           ),
//         ));
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pregancy/patient/constants.dart';

import 'guidesubpage.dart';

class Nutritionalinterventions extends StatelessWidget {
  static String Nutritionalinterventionsid = 'Nutritionalmterventions';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kprimarycolor,
          title: Text(
            'interventions_nutritional'.tr(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              subimage(Cardimage: 'assets/images/Nutritional mterventions.jpg'),
              guidesubpagemain2(
                title: 'interventions_dietary'.tr(),
                text:
                'counseling_pregnant_women'.tr(),
                text2:
                'counseling_pregnant_women_details'.tr(),
              ),
              guidesubpagemain2(
                title: 'iron_folic_acid_supplementation'.tr(),
                text:
                'iron_folic_acid_supplementation_details'.tr(),
                text2:
                'intermittent_iron_folic_acid_supplementation_details'.tr(),
              ),
              guidesubpagemain(
                title: 'calcium_supplementation'.tr(),
                text:
                'calcium_supplementation_details'.tr(),
              ),
              guidesubpagemain(
                  title: 'vitamin_a_supplementation'.tr(),
                  text:
                  'vitamin_a_supplementation_details'.tr()),
              guidesubpagemain(
                  title: 'zinc_supplementation'.tr(),
                  text:
                  'zinc_supplementation_details'.tr()),
              guidesubpagemain(
                  title: 'multiple_micronutrient_supplementation'.tr(),
                  text:
                  'multiple_micronutrient_supplementation_details'.tr()),
              guidesubpagemain(
                  title: 'vitamin_b6_supplementation'.tr(),
                  text:
                  'vitamin_b6_supplementation_details'.tr()),
              guidesubpagemain(
                  title: 'vitamin_e_c_supplementation'.tr(),
                  text:
                  'vitamin_e_c_supplementation_details'.tr()),
              guidesubpagemain(
                  title: 'vitamin_d_supplementation'.tr(),
                  text:
                  'vitamin_d_supplementation_details'.tr()),
              guidesubpagemain(
                  title: 'restricting_caffeine_intake'.tr(),
                  text:
                  'restricting_caffeine_intake_details'.tr())
            ],
          ),
        ));
  }
}
