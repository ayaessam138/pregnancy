// import 'package:pdf/widgets.dart' as pw;
// import 'package:pregancy/doctor/models/pregnancyform.dart';

// pw.Document generatePdf(pregancyformmodel pregancy) {
//   final pdf = pw.Document();

//   pdf.addPage(
//     pw.Page(
//       build: (pw.Context context) {
//         return pw.Center(
//           child: pw.Text(pregancy.name!),
//         );
//       },
//     ),
//   );

//   return pdf;
// }
// Create a function to generate the PDF document

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';

Future<void> saveandLanchfile(List<int> bytes, String filename) async {
  final directory = await getExternalStorageDirectory();

  // Verify if the directory is not null and print/log the path
  if (directory != null) {
    final path = directory.path;
    print('External storage directory path: $path');

    // Use the path for file creation or other operations
    final file = File('$path/$filename');
    await file.writeAsBytes(bytes, flush: true);

    // Launch the file or perform further operations
    OpenFile.open(file.path);
  } else {
    print('Error: Could not retrieve external storage directory.');
  }
}
