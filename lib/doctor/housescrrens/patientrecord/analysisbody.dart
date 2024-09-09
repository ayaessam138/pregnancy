import 'package:flutter/material.dart';
import 'package:pregancy/core/pdf.dart';
import 'package:pregancy/shared_screen/models/getimage.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../../constants.dart';

class analysisbody extends StatelessWidget {
  analysisbody({required this.image});
  final getimage image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: FloatingActionButton.extended(
        //     backgroundColor: kprimarycolor,
        //     label: Row(
        //       children: [Icon(Icons.save), Text('Save as Pdf')],
        //     ),
        //     onPressed: () async {
        //       PdfDocument pdf = PdfDocument();
        //       final pdfPage = pdf.pages.add();
        //       // pdfPage.graphics.drawString(
        //       //     'Assesment',
        //       //     PdfStandardFont(PdfFontFamily.timesRoman, 20,
        //       //         style: PdfFontStyle.italic));

        //       PdfOrderedList(
        //               items: PdfListItemCollection(<Image>[

        //               ]),
        //               font: PdfStandardFont(PdfFontFamily.timesRoman, 20,
        //                   style: PdfFontStyle.italic),
        //               indent: 20,
        //               format: PdfStringFormat(lineSpacing: 30))
        //           .draw(
        //         page: pdfPage,
        //       );
        //       List<int> bytes = await pdf.save();
        //       pdf.dispose();
        //       await saveandLanchfile(bytes,   'analysis.pdf');
        //     }),
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                image.imagename!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kprimarycolor,
                    fontSize: 18),
              ),
            ),
            Image.network(image.imageurl!),
            // ListTile(
            //   leading:
            //   title: Row(
            //     children: [
            //       Text(
            //         image.imagename!,
            //         style: TextStyle(
            //             color: kprimarycolor, fontWeight: FontWeight.bold),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    ));
  }
}
