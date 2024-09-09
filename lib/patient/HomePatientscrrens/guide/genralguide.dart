import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:pregancy/patient/HomePatientscrrens/guide/Maternalfetalassessment.dart';
import 'package:pregancy/patient/constants.dart';


import 'Fetal assessment.dart';
import 'Interventionsforcommonphysiologicalsymptoms.dart';
import 'Nutritionalmterventions.dart';
import 'Preventivemeasures.dart';
import 'guidecard.dart';

class genralguide extends StatelessWidget {
  static String genralguideid = 'genralguide';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('guides_general'.tr()),
        backgroundColor: kprimarycolor,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          guidecard(
              onTap: () {
                Navigator.pushNamed(context,
                    Nutritionalinterventions.Nutritionalinterventionsid);
              },
              cardimage: 'assets/images/Nutritional mterventions.jpg',
              text: 'interventions_nutritional'.tr()),
          guidecard(
              onTap: () {
                Navigator.pushNamed(
                    context, Maternalfetalassessment.Maternalfetalassessmentid);
              },
              cardimage: 'assets/images/Maternal and fetal assessment.jpg',
              text: 'assessment_fetal_maternal'.tr()),
          guidecard(
              onTap: () {
                Navigator.pushNamed(context, Fetalassessment.fetalassessment);
              },
              cardimage: 'assets/images/fetal assesment.jpg',
              text:    'assessment_fetal'.tr(),),
          guidecard(
              onTap: () {
                Navigator.pushNamed(
                    context, Preventivemeasures.Preventivemeasuresid);
              },
              cardimage: 'assets/images/Preventive measures.jpg',
              text: 'measures_preventive'.tr()),
          guidecard(
              onTap: () {
                Navigator.pushNamed(
                    context,
                    Interventionsphysiologicalsymptoms
                        .Interventionsphysiologicalsymptomsid);
              },
              cardimage:
                  'assets/images/Interventions for common physiological symptoms.jpg',
              text: 'changes_physiological_common'.tr())
        ]),
      ),
    );
  }
}
