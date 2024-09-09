import 'package:flutter/material.dart';
import 'package:pregancy/doctor/constants.dart';
import 'package:pregancy/patient/HomePatientscrrens/guide/guidesubpage.dart';


class AboutAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('About App'),
          backgroundColor: kprimarycolor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              guidesubpagemain2(
                title: 'PFU',
                text:
                    '  "A lot can happen in nine months. Make sure you understand every minute of it with PFU.a sophisticated Pregnancy Following UP app that gives the pregnant woman and doctor detailed daily updates every step of the way.The Pregnancy Following UP is a mobile application that allows the woman  doctor to create her/his own profile by entering her/his  user name .password , email and other related data Then use the application as a smart diary for the pregnant woman to personalize her pregnancy following up , and for doctor to follow up his/her patients too.Also the application is used to make early detection for pregnant woman if she is at high , medium or low risk in her pregnancy and if she is at high risk to detect if she is at high risk for anemia , diabetes or pre-eclampsia .Our application has 2 main users :The Pregnant woman : the main user of the application that wants to make sure her pregnancy goes healthy without any complications,"The Doctor : who can view all patients and delete patient from application. Also can add patient , add lab results, add other enteries.",',
                text2:
                    'Maternal high risk refers to the increased likelihood of complications during pregnancy, childbirth, or the postpartum period. Maternal high risk can becaused by a variety of factors, including pre-existing medical conditions, such asdiabetes or hypertension, advanced maternal age, multiple gestations, andprevious pregnancy complications. Maternal high risk can lead to seriouscomplications for both the mother and baby, including preterm birth, low birthweight, stillbirth, and maternal mortality.the application is used to make early detection for pregnant woman if she is athigh , medium or low risk in her pregnancy and this in patient’s view In order notto make the patient panic and if she is at high risk to detect if she is at high riskfor anemia , diabetes or pre-eclampsia and this is happen in doctor’s view',
              ),
              guidesubpagemain(
                title:
                    '                                 --------------------              ',
                text:
                    'Maternal high risk refers to the increased likelihood of complications during pregnancy, childbirth, or the postpartum period. Maternal high risk can becaused by a variety of factors, including pre-existing medical conditions, such as diabetes or hypertension, advanced maternal age, multiple gestations, and previous pregnancy complications. Maternal high risk can lead to serious complications for both the mother and baby, including preterm birth, low birth,weight, stillbirth, and maternal mortality.the application is used to make early detection for pregnant woman if she is at high , medium or low risk in her pregnancy and this in patient’s view In order not to make the patient panic and if she is at high risk to detect if she is at high risk for anemia , diabetes or pre-eclampsia and this is happen in doctor’s view.',
              )
            ],
          ),
        )
//       body: Padding(
//         padding: const EdgeInsets.all(30),
//         child: Container(
//           child: Column(
//             children: [
//               Text(
//                 "A lot can happen in nine months. Make sure you understand every minute of it with PFU."
//                 " a sophisticated Pregnancy Following UP app that gives the pregnant woman and doctor detailed daily updates every step of the way."
//                 " The Pregnancy Following UP is a mobile application that allows the woman  doctor to create her/his own profile by entering her/his  user name ."
//                 " password , email and other related data ."
//                 " Then use the application as a smart diary for the pregnant woman to personalize her pregnancy following up , and for doctor to follow up his/her patients too."
//                 " Also the application is used to make early detection for pregnant woman if she is at high , medium or low risk in her pregnancy and if she is at high risk to detect if she is at high risk for anemia , diabetes or pre-eclampsia ."
//                 "Our application has 2 main users :The Pregnant woman : the main user of the application that wants to make sure her pregnancy goes healthy without any complications,"
//                 "The Doctor : who can view all patients and delete patient from application. Also can add patient , add lab results, add other enteries.",
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                     color: Colors.grey[600]),
//               ),
//               Text("Maternal health is a critical aspect of public health, as it directly impacts the"
// "health and well-being of mothers and their newborns. Maternal health risks can"
// "arise during pregnancy, childbirth, and the postpartum period, and can result in"
// "serious complications and even death. Some of the most common maternal"
// "health risks include gestational diabetes, anemia, pre-eclampsia. These"
// "conditions can have long-term effects on the health of both the mother and"
// child, and early detection and management are crucial in preventing
// complications and ensuring positive health outcomes. Understanding the most
// common maternal health risks is essential for healthcare providers and
// policymakers to develop effective strategies to improve maternal health and
// reduce maternal mortality rates.
// We employed machine learning models , including extra decision tree and
// decision tree to tackle the challenge of detection maternal health risks most
// common maternal health risks include gestational diabetes, anemia, preeclampsia.
// Our experimental results showed promising outcomes, with the Random Forest
// achieving an accuracy 81% and Decision Tree 75% . These results indicate the
// models' ability to accurately detect the detection maternal health risks most
// common maternal health risks include gestational diabetes, anemia, preeclampsia.')
//             ],
//           ),
//         ),
//       ),
        );
  }
}
