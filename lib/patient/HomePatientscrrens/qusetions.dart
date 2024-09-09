// import 'package:flutter/material.dart';
// import 'package:pregancy/patient/constants.dart';
//
// import '../weidgetes/answer.dart';
// import '../weidgetes/question.dart';
//
//
// class qusetions extends StatefulWidget {
//   static String qusetionsid = 'qusetions';
//
//   @override
//   State<qusetions> createState() => _qusetionsState();
// }
//
// class _qusetionsState extends State<qusetions> {
//   bool showAns1 = false;
//   bool showAns2 = false;
//   bool showAns3 = false;
//   bool showAns4 = false;
//   bool showAns5 = false;
//   bool showAns6 = false;
//   bool showAns7 = false;
//   bool showAns8 = false;
//   bool showAns9 = false;
//   bool showAns10 = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Questions'),
//           backgroundColor: kprimarycolor,),
//       body:  SingleChildScrollView(
//         child: Column(
//           children: [
//             question(
//                 text: 'When do pregnancy cravings start? ',
//                 onPressed: () {
//                   setState(
//                         () {
//                       showAns1 = !showAns1;
//                     },
//                   );
//                 }),
//             Visibility(
//                 visible: showAns1,
//                 child: answer(
//                     text: 'Early signs and symptoms Many women still feel fine at 4 weeks, but others may notice sore breasts, fatigue, frequent urination, and nausea (feeling sick).Sometimes pregnant women have some very light bleeding, called "spotting", at the time when their period would be due. This is also known as implantation bleeding, which is when the foetus plants itself into the wall of your womb. Spotting is completely normal and does not need any medical treatment.You may be sick or feel sick – this is commonly known as morning sickness, but it can happen at any time of day. If you feel nauseous and cant keep anything down, contact your GP. You may also notice changes in your breasts. They may become larger and feel tender, like they might do before your period. The veins may show up more and the nipples may darken and stand out.Every woman is different and not all women will notice all these symptoms. If you are eagerly looking out for any hints that you might be pregnant, other early signs of pregnancy include: needing to pee more often – you may find you have to get up in the nightbeing constipated increased vaginal discharge without any soreness or irritation feeling tired having a strange taste in your mouth – many women describe it as metallic going off some things, such as tea, coffee, tobacco smoke or fatty food'
//
//                   ,onTap: () {},
//                     )),
//             question(
//                 text: 'How much weight should I gain in pregnancy?',
//                 onPressed: () {
//                   setState(
//                         () {
//                       showAns2 = !showAns2;
//                     },
//                   );
//                 }),
//             Visibility(
//                 visible: showAns2,
//                 child: Container(
//                   height: 370,
//                   child: answer(
//                     text: 'Weight gain in pregnancy varies from person to person. It also depends on your weight before you become pregnant.Most pregnant women gain between 10kg and 12.5kg (22lb to 26lb), putting on most of the weight after week 20. Much of the extra weight is due to your baby growing, but your body will also be storing fat, ready to make breast milk after your baby is born.Putting on too much or too little weight while you are pregnant can lead to health problems for you or your unborn baby. But dont worry, it is easy to make healthy food choices. Find out what to eat when pregnant and what foods to avoid',
//
//                     onTap: () {},
//                   ),
//                 )),
//             question(
//                 text: 'What prenatal vitamins should I take?',
//                 onPressed: () {
//                   setState(
//                         () {
//                       showAns3 = !showAns3;
//                     },
//                   );
//                 }),
//             Visibility(
//                 visible: showAns3,
//                 child: Container(
//                   height: 650,
//                   child: answer(
//                     text: 'You will get most of the vitamins and minerals you need by eating a healthy, varied diet. But when you are pregnant (and while you are trying to get pregnant) you also need to take a folic acid supplement. To keep bones and muscles healthy, we need vitamin D. From late March/early April to the end of September, most people make enough vitamin D from sunlight on their skin. However, between October and early March we should consider taking a daily vitamin D supplement because we cannot make it from sunlight.Just 10 micrograms a day is all you need – it is the same for kids and grown-ups. Some people should take a vitamin D supplement all year round, find out if this applies to you on the NHS website.Along with the vitamins you should take, there are also some to watch out for and avoid. You should avoid supplements and multivitamins containing vitamin A (retinol) – as too much of it can harm your baby is development. You should also avoid liver and liver products (including fish liver oil), as they are high in vitamin A.Find out more about vitamins and supplements in pregnancy',
//
//                   onTap: () {},
//                   ),
//                 )),
//             question(
//                 text: 'How should I sleep in pregnancy?',
//                 onPressed: () {
//                   setState(
//                         () {
//                       showAns4 = !showAns4;
//                     },
//                   );
//                 }),
//             Visibility(
//                 visible: showAns4,
//                 child: answer(
//                   text: 'Depending on how you normally like to snooze, you might have to rethink your favourite position while you are pregnant.If you sleep on your back, it is safe to continue during the first trimester, but as your bump gets bigger and heavier you will need to sleep on your side, so it is best to get into the habit as soon as you can.By the third trimester (after 28 weeks of pregnancy), sleeping on your side is the safest position for your baby as it helps prevent the risk of stillbirth. Dont worry, if your pregnancy is uncomplicated your risk of stillbirth is low (1 in 200 babies are stillborn) and going to sleep on your side will make it even lower.It is ok if you end up in all sorts of positions when you are asleep. The important thing to remember is to fall asleep on your side, as this means you are sleeping safely for your baby. If you wake up on your back, dont be alarmed, just turn onto your side and go back to sleep.Try sleeping on one side with your knees bent, it will help reduce the amount of pressure on your uterus and help you breathe better. Plus, this position can help relieve backache. You can use pillows under your belly, between your legs, and behind your back if you like.You should go to sleep on your side whenever you have a snooze, including: *going to sleep at night *getting back to sleep, after waking up at night *daytime naps',
//                   onTap: () {},
//                 )),
//             question(
//                 text: 'What happens in an antenatal class?',
//                 onPressed: () {
//                   setState(
//                         () {
//                       showAns5 = !showAns5;
//                     },
//                   );
//                 }),
//             Visibility(
//                 visible: showAns5,
//                 child: Container(
//                   height: 650,
//                   child: answer(
//                     text: 'Antenatal classes are available to give you and your partner lots of helpful information on labour, birth and early parenthood.They are usually informal, fun and sociable, which makes them a great place to meet other parents-to-be. The friends you make at antenatal classes can become a great support network. You can now find many antenatal courses and workshops online.Antenatal classes usually start 8 to 10 weeks before your baby is born, and happen once a week for about 2 hours.You can choose classes that are just for pregnant women, or classes that welcome a partner or a friend. There are sometimes classes especially designed for single mothers or teenagers.'
//                         'Antenatal classes may include info on:'
//                         'diet: how to stay healthy and have a good diet while you are pregnant '
//                         'exercise: what types of exercise are good for keeping fit in pregnancy '
//                         'labour: what to expect '
//                         'relaxation: how to relax while you are pregnant and after you have had your baby '
//                         'delivery methods: different birth methods and interventions'
//                         'after the birth: how to look after your newborn, and how you can stay healthy'
//                         'emotional wellbeing: how you might feel during and after your pregnancy',
//
//                     onTap: () {},
//                   ),
//                 )),
//             question(
//                 text: 'Should I have the flu vaccine?',
//                 onPressed: () {
//                   setState(
//                         () {
//                       showAns6 = !showAns6;
//                     },
//                   );
//                 }),
//             Visibility(
//                 visible: showAns6,
//                 child: Container(
//                   height: 320,
//                   child: answer(
//                     text: 'The flu jab is the safest way to help protect pregnant women and their babies against flu, regardless of their stage in pregnancy, or how fit and healthy they feel.'
//                         'Pregnancy naturally weakens the immune system, which means it is harder to fight off infections. As a result, flu can cause serious complications.'
//                         'One of the most common flu complications is bronchitis - a chest infection that can become serious and develop into pneumonia. Read more about the flu jab in pregnancy on the NHS website.',
//
//                     onTap: () {},
//                   ),
//                 )),
//             question(
//                 text: 'How Will I Know My Due Date?',
//                 onPressed: () {
//                   setState(
//                         () {
//                       showAns7 = !showAns7;
//                     },
//                   );
//                 }),
//             Visibility(
//                 visible: showAns7,
//                 child: Container(
//                   height: 350,
//                   child: answer(
//                     text: 'Understanding how due dates are calculated is important. A woman can normally count on 36 to 40 weeks of pregnancy. To efficiently calculate your due date, you will need to know the date of your last menstrual period — 280 days or 40 weeks from the first day of your last period will be your due date.'
//                         'The due date of a pregnancy is only an estimation. In reality, less than 5% of babies are born on the due date the mother is given. Many factors affect the due date of a child. Considering menstrual periods are not always like clockwork, just one day can throw off the due date.',
//
//                     onTap: () {},
//                   ),
//                 )),
//             question(
//                 text: 'Am I drinking enough water?',
//                 onPressed: () {
//                   setState(
//                         () {
//                       showAns8 = !showAns8;
//                     },
//                   );
//                 }),
//             Visibility(
//                 visible: showAns8,
//                 child: Container(
//                   height: 200,
//                   child: answer(
//                     text: '“Fluids transport nutrition to your baby, prevent preterm labor, and minimize nausea, bloating and headaches,” says women’s health nurse practitioner Camilla Bicknell, RNC, MSN, co-author of “The Pregnancy Power Workbook.” Pale yellow urine is a sign you’re drinking plenty. Not sure? Ask.',
//                     onTap: () {},
//                   ),
//                 )),
//             question(
//                 text: 'Should I change my workout routine?',
//                 onPressed: () {
//                   setState(
//                         () {
//                       showAns9 = !showAns9;
//                     },
//                   );
//                 }),
//             Visibility(
//                 visible: showAns9,
//                 child: Container(
//                   height: 260,
//                   child: answer(
//                     text: 'Kickboxing and ice-skating are out, because of the risk of belly trauma or falling down. But common sense isn’t enough.'
//                         '“Certain pregnancy-related conditions may worsen with exercise,” says obstetrician James Betoni, D.O., co-author of “The Pregnancy Power Workbook.'
//                         '”Looser tendons and ligaments make pregnant women more prone to sports injuries. Get a fitness prescription.',
//
//                     onTap: () {},
//                   ),
//                 )),
//             question(
//                 text: 'What is safe medications during pregnancy?',
//                 onPressed: () {
//                   setState(
//                         () {
//                       showAns10 = !showAns10;
//                     },
//                   );
//                 }),
//             Visibility(
//                 visible: showAns10,
//                 child: Container(
//                   height: 1100,
//                   child: answer(
//                     text: 'Pain or headache relief '
//                         'Acetaminophen (Tylenol; category B) is the drug of choice for pain during pregnancy. It’s widely used with very few documented adverse effects.'
//
//             'Aspirin and nonsteroidal anti-inflammatory drugs (NSAIDs), on the other hand, should be avoided during pregnancy.'
//
//      ' NSAIDs include:'
//                         'ibuprofen (Advil, Motrin)'
//                         'ketoprofen (Orudis)'
//                         'naproxen (Aleve)'
//                         'If your pain is particularly severe — after a surgery, for example — your doctor may prescribe a short course of opioid pain relievers. When taken as directed, they may not affect fetal development.'
//                       'That said, opioid use during pregnancy does carry the risk of withdrawal, called neonatal abstinence syndrome (NAS), after delivery.'
//                       'Cold medicine'
//                       'Cold medications are not well-studied for use during pregnancy. Some doctors suggest trying to wait until after your 12th week to minimize any potential risks to your baby.'
//                       'Safe options include:'
//                       'plain cough syrup, such as Vicks'
//                       'dextromethorphan (Robitussin; category C) and dextromethorphan-guaifenesin (Robitussin DM; category C) cough syrups'
//                         'cough expectorant during the day'
//                         'cough suppressant at night'
//     'acetaminophen (Tylenol; category B) to relieve pain and fever'
//     'The active ingredient in Sudafed, pseudoephedrine, may elevate blood pressure or affect blood flow from the uterus to the fetus. This drug isn’t classified by the FDA. It may be safe during pregnancy, but speak with your doctor if you have high blood pressure or other concerns.'
//
//     'Doctors often recommend trying home treatments before taking medications:'
//
//     'Get plenty of rest.'
//     'Stay hydrated by drinking water and warm liquids, like chicken soup or tea.'
//     'Gargle salt water to ease sore throat.'
//     'Use saline nose drops to fight stuffiness.'
//     'Humidify the air in your room.'
//     'Use menthol rub on your chest.'
//     'Try nasal strips to open airways.'
//     'Suck on cough drops or lozenges.'
//     'PARENTHOOD'
//     'Stages'
//     'Infertility'
//     'Health & Well-Being'
//     'Life'
//     'Sex & Relationships'
//     'Products & Gear',
//                     onTap: () {},
//                   ),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pregancy/patient/constants.dart';

import '../weidgetes/answer.dart';
import '../weidgetes/question.dart';


class qusetions extends StatefulWidget {
  static String qusetionsid = 'qusetions';

  @override
  State<qusetions> createState() => _qusetionsState();
}

class _qusetionsState extends State<qusetions> {
  bool showAns1 = false;
  bool showAns2 = false;
  bool showAns3 = false;
  bool showAns4 = false;
  bool showAns5 = false;
  bool showAns6 = false;
  bool showAns7 = false;
  bool showAns8 = false;
  bool showAns9 = false;
  bool showAns10 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('questions'.tr()),
        backgroundColor: kprimarycolor,),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            question(
                text: 'Whendopregnancycravingsstart'.tr(),
                onPressed: () {
                  setState(
                        () {
                      showAns1 = !showAns1;
                    },
                  );
                }),
            Visibility(
                visible: showAns1,
                child: answer(
                  text: 'Earlysignsandsymptoms'.tr()

                  ,onTap: () {},
                )),
            question(
                text: 'HowmuchweightshouldIgaininpregnancy'.tr(),
                onPressed: () {
                  setState(
                        () {
                      showAns2 = !showAns2;
                    },
                  );
                }),
            Visibility(
                visible: showAns2,
                child: SingleChildScrollView(
                  child: Container(
                    // height: 370,
                    child: answer(
                      text: 'Weightgaininpregnancy'.tr(),
                  
                      onTap: () {},
                    ),
                  ),
                )),
            question(
                text: 'WhatprenatalvitaminsshouldItake'.tr(),
                onPressed: () {
                  setState(
                        () {
                      showAns3 = !showAns3;
                    },
                  );
                }),
            Visibility(
                visible: showAns3,
                child: Container(
                  // height: 650,
                  child: answer(
                    text: 'vitmain'.tr(),

                    onTap: () {},
                  ),
                )),
            question(
                text: 'HowshouldIsleepinpregnancy'.tr(),
                onPressed: () {
                  setState(
                        () {
                      showAns4 = !showAns4;
                    },
                  );
                }),
            Visibility(
                visible: showAns4,
                child: answer(
                  text: 'sleep'.tr(),
                  onTap: () {},
                )),
            question(
                text: 'Whathappensinanantenatalclass'.tr(),
                onPressed: () {
                  setState(
                        () {
                      showAns5 = !showAns5;
                    },
                  );
                }),
            Visibility(
                visible: showAns5,
                child: Container(
                  // height: 650,
                  child: answer(
                    text: 'before'.tr(),

                    onTap: () {},
                  ),
                )),
            question(
                text: 'ShouldIhavethefluvaccine'.tr(),
                onPressed: () {
                  setState(
                        () {
                      showAns6 = !showAns6;
                    },
                  );
                }),
            Visibility(
                visible: showAns6,
                child: Container(
                  // height: 320,
                  child: answer(
                    text: 'fluvaccine'.tr(),

                    onTap: () {},
                  ),
                )),
            question(
                text: 'HowWillIKnowMyDueDate'.tr(),
                onPressed: () {
                  setState(
                        () {
                      showAns7 = !showAns7;
                    },
                  );
                }),
            Visibility(
                visible: showAns7,
                child: Container(
                  // height: 350,
                  child: answer(
                    text: 'duedate'.tr(),

                    onTap: () {},
                  ),
                )),
            question(
                text: 'AmIdrinkingenoughwater'.tr(),
                onPressed: () {
                  setState(
                        () {
                      showAns8 = !showAns8;
                    },
                  );
                }),
            Visibility(
                visible: showAns8,
                child: Container(
                  // height: 200,
                  child: answer(
                    text: 'water'.tr(),
                    onTap: () {},
                  ),
                )),
            question(
                text: 'ShouldIchangemyworkoutroutine'.tr(),
                onPressed: () {
                  setState(
                        () {
                      showAns9 = !showAns9;
                    },
                  );
                }),
            Visibility(
                visible: showAns9,
                child: Container(
                  // height: 260,
                  child: answer(
                    text:'workout'.tr(),

                    onTap: () {},
                  ),
                )),
            question(
                text: 'Whatissafemedicationsduringpregnancy'.tr(),
                onPressed: () {
                  setState(
                        () {
                      showAns10 = !showAns10;
                    },
                  );
                }),
            Visibility(
                visible: showAns10,
                child: SingleChildScrollView(
                  child: Container(
                    // height: 1100,
                    child: answer(
                      text: 'safemedications'.tr(),
                      onTap: () {},
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
