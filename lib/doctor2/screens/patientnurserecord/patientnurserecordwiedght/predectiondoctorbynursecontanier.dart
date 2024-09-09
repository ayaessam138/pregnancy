import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pregancy/doctor2/models/pedectiondoctorbynurse.dart';
import 'package:intl/intl.dart';
import 'package:pregancy/doctor2/screens/patientnurserecord/patientnurserecordwiedght/predectionpatientbynursecontanier.dart';


import '../../../constant.dart';

class predectiondoctorbynursecontainer extends StatelessWidget {
  predectiondoctorbynursecontainer({required this.predection});
  final predectiondoctorbynursemodel predection;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        onTap: () {
          Navigator.pushNamed(context,
              predectiondoctorbynursedata.predectiondoctorbynursedataid,
              arguments: predection);
        },
        leading: Image.asset('assets/images/patientassesment.png'),
        title: Text(
          '${DateFormat('yyyy-MM-dd – kk:mm').format(predection.time!)}',
          style: const TextStyle(
              color: kprimarycolor, fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}

class predectiondoctorbynursedata extends StatelessWidget {
  static String predectiondoctorbynursedataid = 'predectiondoctorbynursedata';
  predectiondoctorbynursedata({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as predectiondoctorbynursemodel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimarycolor,
        title: Text('predection'.tr()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: textstyle(text: 'age'.tr()),
              subtitle: Text(args.Age!),
            ),
            Divider(),
            ListTile(
                title: textstyle(
                  text: 'FamilyHistory'.tr(),
                ),
                subtitle: Text(args.FamHisto!)),
            Dvider(),
            ListTile(
                title: textstyle(text: 'ChronicHtn'.tr()),
                subtitle: Text(args.ChronicHtn!)),
            Dvider(),
            ListTile(
                title: textstyle(text: 'ChronicDiabetes'.tr()),
                subtitle: Text(args.ChronicDiabetes!)),
            Dvider(),
            ListTile(title: textstyle(text: 'BMi'), subtitle: Text(args.BMI!)),
            Dvider(),
            ListTile(
                title: textstyle(
                    text: 'systolicbloodpressure'.tr()),
                subtitle: Text(args.SysBp!)),
            Dvider(),
            ListTile(
                title: textstyle(
                    text: 'diastolicbloodpressure'.tr()),
                subtitle: Text(args.DiaBp!)),
            Dvider(),
            ListTile(
                title: textstyle(text: 'HB'.tr()), subtitle: Text(args.Hb!)),
            Dvider(),
            ListTile(
                title: textstyle(text: 'hematocrit'.tr()),
                subtitle: Text(args.Hematocrit!)),
            Dvider(),
            ListTile(title: textstyle(text: 'MCh'.tr()), subtitle: Text(args.MCH!)),
            Dvider(),
            ListTile(title: textstyle(text: 'MCHc'.tr()), subtitle: Text(args.MCH!)),
            Dvider(),
            ListTile(title: textstyle(text: 'MCv'.tr()), subtitle: Text(args.MCV!)),
            Dvider(),
            ListTile(
                title: textstyle(text: 'platelet'.tr()),
                subtitle: Text(args.Platelet!)),
            Dvider(),
            ListTile(
                title: textstyle(text: 'serumCreatinine'.tr()),
                subtitle: Text(args.SerumCreatinine!)),
            Dvider(),
            ListTile(title: textstyle(text: 'HDl'.tr()), subtitle: Text(args.HDL!)),
            Dvider(),

            // Dvider(),
            // ListTile(
            //     title: textstyle(text: 'BloodSugar'),
            //     subtitle: Text(args.BloodSugar!)),
            // Dvider(),
            // ListTile(
            //     title: textstyle(text: 'BodyTemperature'),
            //     subtitle: Text(args.BodyTemperature!)),
            // Dvider(),
            // ListTile(
            //     title: textstyle(text: 'HeartRate'),
            //     subtitle: Text(args.HeartRate!)
            //     ),
          ],
        ),
      ),
    );
  }
}
