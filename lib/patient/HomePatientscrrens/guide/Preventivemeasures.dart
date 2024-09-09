// import 'package:flutter/material.dart';
//
// import '../../constants.dart';
// import 'guidesubpage.dart';
//
// class Preventivemeasures extends StatelessWidget {
//   static String Preventivemeasuresid = 'Preventive measures';
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
//             child: Column(
//           children: [
//             subimage(Cardimage: 'assets/images/Preventive measures.jpg'),
//             guidesubpagemain(
//                 title: 'Antibiotics for asymptomatic bacteriuria (ASB)',
//                 text:
//                     ' A seven-day antibiotic regimen is recommended for all pregnant women with asymptomatic bacteriuria (ASB) to prevent persistent bacteriuria, preterm birth and low birth weight.'),
//             guidesubpagemain(
//                 title:
//                     'Antibiotic prophylaxis to prevent recurrent urinary tract infections',
//                 text:
//                     'Antibiotic prophylaxis is only recommended to prevent recurrent urinary tract infections in pregnant women in the context of rigorous research.'),
//             guidesubpagemain(
//                 title: 'Antenatal anti-D immunoglobulin administration',
//                 text:
//                     'Antenatal prophylaxis with anti-D immunoglobulin in non-sensitized Rh-negative pregnant women at 28 and 34 weeks of gestation to prevent RhD alloimmunization is only recommended in the context of rigorous research.'),
//             guidesubpagemain(
//                 title: 'Preventive anthelminthic treatment',
//                 text:
//                     'In endemic areas," preventive anthelminthic treatment is recommended for pregnant women after the first trimester as part of worm infection reduction programmes.'),
//             guidesubpagemain(
//                 title: 'Tetanus toxoid vaccination',
//                 text:
//                     ' Tetanus toxoid vaccination is recommended for all pregnant women, depending on previous tetanus vaccination exposure, to prevent neonatal mortality from tetanus.'),
//             guidesubpagemain(
//                 title:
//                     'Malaria prevention: intermittent preventive treatment in pregnancy (IPTp)',
//                 text:
//                     'In malaria-endemic areas in Africa, intermittent preventive treatment with sulfadoxine-pyrimethamine (IPTp-SP) is recommended for all pregnant women. Dosing should start in the second trimester, and doses should be given at least one month apart, with the objective of ensuring that at least three doses are received.'),
//             guidesubpagemain(
//                 title: 'Pre-exposure prophylaxis (PrEP) for HIV prevention',
//                 text:
//                     'Oral pre-exposure prophylaxis (PrEP) containing tenofovir disoproxil fumarate (TDF) should be offered as an additional prevention choice for pregnant women at substantial risk of HIV infection as part of combination prevention approaches.')
//           ],
//         )));
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'guidesubpage.dart';

class Preventivemeasures extends StatelessWidget {
  static String Preventivemeasuresid = 'Preventive measures';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kprimarycolor,
          title: Text(
            'measures_preventive'.tr(),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                subimage(Cardimage: 'assets/images/Preventive measures.jpg'),
                guidesubpagemain(
                    title: 'asb_antibiotics'.tr(),
                    text:
                    'asb_recommendation'.tr()),
                guidesubpagemain(
                    title:
                    'prophylaxis_antibiotic'.tr(),
                    text:
                    'antibiotic_prophylaxis_recommendation'.tr()),
                guidesubpagemain(
                    title: 'immunoglobin_D_anti'.tr(),
                    text:
                    'immunoglobin_D_anti_recommendation'.tr()),
                guidesubpagemain(
                    title: 'treatment_anthelminthic_preventive'.tr(),
                    text:
                    'anthelminthic_treatment_recommendation'.tr()),
                guidesubpagemain(
                    title: 'vaccination_toxoid_tetanus'.tr(),
                    text:
                    'tetanus_vaccination_recommendation'.tr()),
                guidesubpagemain(
                    title:
                    'prevention_malaria'.tr(),
                    text:
                    'malaria_prevention_recommendation'.tr()),

              ],
            )));
  }
}
