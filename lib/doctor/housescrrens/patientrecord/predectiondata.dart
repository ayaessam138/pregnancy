import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pregancy/core/pdf.dart';

import 'package:pregancy/patient/NavgationPatientscreens/PredictionPatient.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../../../patient/models/predectionpatient.dart';
import '../../constants.dart';
import '../../models/predectiondoctor.dart';
import 'package:intl/intl.dart';

class predectiondoctordata extends StatelessWidget {
  static String predectiondoctordataid = 'predectiondoctordata';
  predectiondoctordata({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as predectiondoctor;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: kprimarycolor,
          label: Row(
            children: [Icon(Icons.save), Text('Save as Pdf')],
          ),
          onPressed: () async {
            PdfDocument pdf = PdfDocument();
            final pdfPage = pdf.pages.add();
            // pdfPage.graphics.drawString(
            //     'Assesment',
            //     PdfStandardFont(PdfFontFamily.timesRoman, 20,
            //         style: PdfFontStyle.italic));

            PdfOrderedList(
                    items: PdfListItemCollection(<String>[
                      'Age:' + args.Age!,
                      'Family History:' + args.FamHisto!,
                      'Systolic Blood Pressure;' + args.SysBp!,
                      'Diastolic blood pressure:' + args.DiaBp!,
                      'ChronicHtn:' + args.ChronicHtn!,
                      'BMI:' + args.BMI!,
                      'Hemoglbin:' + args.Hb!,
                      'Hematocrit:' + args.Hematocrit!,
                      'MCH:' + args.MCH!,
                      'MCHC:' + args.MCHC!,
                      'MCV:' + args.MCV!,
                      'Platelet:' + args.Platelet!,
                      'SerumCreatinine:' + args.SerumCreatinine!,
                      'HDL:' + args.HDL!,
                    ]),
                    font: PdfStandardFont(PdfFontFamily.timesRoman, 20,
                        style: PdfFontStyle.italic),
                    indent: 20,
                    format: PdfStringFormat(lineSpacing: 30))
                .draw(
              page: pdfPage,
            );
            List<int> bytes = await pdf.save();
            pdf.dispose();
            await saveandLanchfile(bytes, 'Predection.pdf');
          }),
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
            ListTile(title: textstyle(text: 'BMi'.tr()), subtitle: Text(args.BMI!)),
            Dvider(),
            ListTile(
                title: textstyle(text: 'systolicbloodpressure'.tr()),
                subtitle: Text(args.SysBp!)),
            Dvider(),
            ListTile(
                title: textstyle(text: 'diastolicbloodpressure'.tr()),
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
            ListTile(
                title: textstyle(text: 'MCHc'.tr()), subtitle: Text(args.MCHC!)),
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

class predectiondoctorcontainer extends StatelessWidget {
  predectiondoctorcontainer({required this.predection});
  final predectiondoctor predection;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        onTap: () {
          Navigator.pushNamed(
              context, predectiondoctordata.predectiondoctordataid,
              arguments: predection);
        },
        leading: Image.asset('assets/images/patientassesment.png'),
        title: Text(
          '${DateFormat('yyyy-MM-dd – kk:mm').format(predection.time!)}',
          style: TextStyle(color: kprimarycolor, fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}

class predectionpatientdata extends StatelessWidget {
  static String predectionpatientdataid = 'predectionpatientdata';

  predectionpatientdata({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as predectionpatient;

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: kprimarycolor,
          label: Row(
            children: [const Icon(Icons.save), Text('Save as Pdf')],
          ),
          onPressed: () async {
            PdfDocument pdf = PdfDocument();
            final pdfPage = pdf.pages.add();
            // pdfPage.graphics.drawString(
            //     'Assesment',
            //     PdfStandardFont(PdfFontFamily.timesRoman, 20,
            //         style: PdfFontStyle.italic));

            PdfOrderedList(
                    items: PdfListItemCollection(<String>[
                      'Age:' + args.Age!,
                      'Systolic Blood Pressure:' + args.SysBp!,
                      'Diastolic blood pressure:' + args.DiaBp!,
                      'BloodSugar:' + args.BloodSugar!,
                      'BodyTemperature;' + args.BodyTemperature!,
                      'HeartRate:' + args.HeartRate!
                    ]),
                    font: PdfStandardFont(PdfFontFamily.timesRoman, 20,
                        style: PdfFontStyle.italic),
                    indent: 20,
                    format: PdfStringFormat(lineSpacing: 30))
                .draw(
              page: pdfPage,
            );
            List<int> bytes = await pdf.save();
            pdf.dispose();
            await saveandLanchfile(bytes, 'Predection.pdf');
          }),
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

class predectionpatientcontainer extends StatelessWidget {
  predectionpatientcontainer({required this.predection});
  final predectionpatient predection;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        onTap: () {
          Navigator.pushNamed(
              context, predectionpatientdata.predectionpatientdataid,
              arguments: predection);
        },
        leading: Image.asset('assets/images/patientassesment.png'),
        title: Text(
          '${DateFormat('yyyy-MM-dd – kk:mm').format(predection.time!)}',
          style: TextStyle(color: kprimarycolor, fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}

class textstyle extends StatelessWidget {
  textstyle({required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: kprimarycolor, fontWeight: FontWeight.bold),
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
