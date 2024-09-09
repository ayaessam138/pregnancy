// import 'package:flutter/material.dart';
//
// import '../../constants.dart';
// import 'guidesubpage.dart';
//
// class anemialowrisk extends StatelessWidget {
//   static String anemialowriskid = 'anemialowrisk';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kprimarycolor,
//         title: Text(
//           'Anemia',
//         ),
//       ),
//       body: SingleChildScrollView(
//           child: Column(
//         children: [
//           subimage(Cardimage: 'assets/images/anemialowrisk.jpg'),
//           guidesubpagemain(
//               title: 'What is anemia during pregnancy?',
//               text:
//                   'Anemia is when you don’t have enough red blood cells to carry oxygen throughout your body. When your body doesn’t get enough oxygen from your blood, it can’t function properly. A person who has anemia during pregnancy is considered anemic'),
//           guidesubpagemain(
//               title: 'Who is most likely to have anemia during pregnancy? ',
//               text:
//                   'Throughout pregnancy, the amount of blood in your body increases by 20% to 30%. That means your body needs more iron for more red blood cells. You may be at higher risk for anemia during pregnancy if you are: Pregnant with multiples. Not consuming enough iron, Having back to-back pregnancies with minimal time between, experiencing a heavy menstrual flow befor'),
//           guidesubpagemain(
//               title:
//                   'Good nutrition is the best way to prevent anemia during pregnancy',
//               text:
//                   ' when trying to become pregnant. Eating foods high in iron can help with maintaining the supply of iron necessary to function properly. These foods include: (red meat, dark green leafy vegetables. eggs, peanuts, fortified cereals)')
//         ],
//       )),
//     );
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'guidesubpage.dart';

class anemialowrisk extends StatelessWidget {
  static String anemialowriskid = 'anemialowrisk';
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
              subimage(Cardimage: 'assets/images/anemialowrisk.jpg'),
              guidesubpagemain(
                  title: 'pregnancy_during_anemia'.tr(),
                  text:
                  'pregnancy_during_anemia_response'.tr()),
              guidesubpagemain(
                  title: 'pregnancy_during_anemia_risk'.tr(),
                  text:
                  'pregnancy_during_anemia_risk_response'.tr()),
              guidesubpagemain(
                  title: 'pregnancy_during_anemia_anemic'.tr(),
                  text:
                  'pregnancy_during_anemia_anemic_response'.tr()),
              guidesubpagemain(
                  title:
                  'pregnancy_during_anemia_prevention'.tr(),
                  text:
                  'pregnancy_during_anemia_prevention_response'.tr()),
              guidesubpagemain(
                  title:
                  'pregnancy_during_anemia_nutrition'.tr(),
                  text:
                  'pregnancy_during_anemia_nutrition_response'.tr())
            ],
          )),
    );
  }
}
