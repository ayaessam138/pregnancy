import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pregancy/doctor2/models/predectionpatientbynurse.dart';


import '../../../constant.dart';
import 'package:intl/intl.dart';

class predectionpatientbynursecontainer extends StatelessWidget {
  predectionpatientbynursecontainer({required this.predection});
  final predectionpatientbynursemodel predection;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        onTap: () {
          Navigator.pushNamed(
              context, predectionpatientbynursedata.predectionpatientdataid,
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

class predectionpatientbynursedata extends StatelessWidget {
  static String predectionpatientdataid = 'predectionpatientbynursedata';

  predectionpatientbynursedata({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as predectionpatientbynursemodel;

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
            Dvider(),
            ListTile(
                title: textstyle(text: 'bloodsugar'.tr()),
                subtitle: Text(args.BloodSugar!)),
            Dvider(),
            ListTile(
                title: textstyle(
                    text: 'bodytemperature'.tr()),
                subtitle: Text(args.BodyTemperature!)),
            Dvider(),
            ListTile(
                title: textstyle(text: 'heartbeatrate'.tr()),
                subtitle: Text(args.HeartRate!)),
          ],
        ),
      ),
    );
  }
}

class textstyle extends StatelessWidget {
  textstyle({required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: kprimarycolor, fontWeight: FontWeight.bold),
    );
  }
}

class Dvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color.fromARGB(255, 215, 212, 212), //color of divider
      height: 0.5, //height spacing of divider
      thickness: 0.5, //thickness of divier line
      indent: 25, //spacing at the start of divider
      endIndent: 25, //spacing at the end of divider
    );
  }
}
