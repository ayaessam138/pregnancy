import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:pregancy/patient/HomePatientscrrens/guide/anemiahighrisk.dart';
import 'package:pregancy/patient/HomePatientscrrens/guide/anemialowrisk.dart';
import 'package:pregancy/patient/HomePatientscrrens/guide/diabiteshighrisk.dart';
import 'package:pregancy/patient/HomePatientscrrens/guide/diabiteslowrisk.dart';
import 'package:pregancy/patient/HomePatientscrrens/guide/genralguide.dart';
import 'package:pregancy/patient/HomePatientscrrens/guide/preeclamcyahighrisk.dart';
import 'package:pregancy/patient/HomePatientscrrens/guide/preeclamcylowrisk.dart';

import '../constants.dart';
import '../weidgetes/giude_subcontainer.dart';
import '../weidgetes/guide_container.dart';

class guide extends StatefulWidget {
  static String guideid = 'guide';

  @override
  State<guide> createState() => _guideState();
}

class _guideState extends State<guide> {
  bool showguide = false;
  bool showsubcontanierlowrisk = false;
  bool showsubcontanierhighrisk = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimarycolor,
        title: Text('guide'.tr()),
      ),
      body: Column(
        children: [
          GuideContainer(
              text: 'genralguides'.tr(),
              onPressed: () {
                setState(
                  () {
                    showguide = !showguide;
                  },
                );
              }),
          Visibility(
              visible: showguide,
              child: Column(
                children: [
                  GuideSubContainer(
                      text: 'guide'.tr(),
                      onTap: () {
                        Navigator.pushNamed(context, genralguide.genralguideid);
                      })
                ],
              )),
          GuideContainer(
              onPressed: () {
                setState(
                  () {
                    showsubcontanierlowrisk = !showsubcontanierlowrisk;
                  },
                );
              },
              text: 'lowrisk'.tr()),
          Visibility(
              visible: showsubcontanierlowrisk,
              child: Column(
                children: [
                  GuideSubContainer(
                      text: 'anemia'.tr()
                      ,
                      onTap: () {
                        Navigator.pushNamed(
                            context, anemialowrisk.anemialowriskid);
                      }),
                  GuideSubContainer(
                      text: 'preeclampsia'.tr(),
                      onTap: () {
                        Navigator.pushNamed(
                            context, preelcamcyalowrisk.preelcamcyalowriskid);
                      }),
                  GuideSubContainer(
                      text: 'diabetes'.tr(),
                      onTap: () {
                        Navigator.pushNamed(
                            context, diabiteslowrisk.diabiteslowriskid);
                      })
                ],
              )),
          GuideContainer(
              onPressed: () {
                setState(
                  () {
                    showsubcontanierhighrisk = !showsubcontanierhighrisk;
                  },
                );
              },
              text: 'highrisk'.tr()),
          Visibility(
              visible: showsubcontanierhighrisk,
              child: Column(
                children: [
                  GuideSubContainer(
                      text: 'anemia'.tr(),
                      onTap: () {
                        Navigator.pushNamed(
                            context, anemiahighrisk.anemiahighriskid);
                      }),
                  GuideSubContainer(
                      text: 'preeclampsia'.tr(),
                      onTap: () {
                        Navigator.pushNamed(
                            context, preelcamcyahighrisk.preelcamcyahighriskid);
                      }),
                  GuideSubContainer(
                      text: 'diabetes'.tr(),
                      onTap: () {
                        Navigator.pushNamed(
                            context, diabiteshighrisk.diabiteshighriskid);
                      })
                ],
              )),
        ],
      ),
    );
  }
}
