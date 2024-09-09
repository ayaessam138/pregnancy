import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';


import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';

// Future<void> downloadAndSaveModel() async {
//   print('object1');
//   FirebaseModelDownloader downloader = FirebaseModelDownloader.instance;
//   FirebaseApp secondaryApp = Firebase.app('SecondaryApp');
//   FirebaseModelDownloader downloader = FirebaseModelDownloader.instanceFor(app: secondaryApp);
// }

String dateTimeFormat(String date) {
  final f = new DateFormat('hh:mm');
  return f.format(DateTime.parse(date));
}




Future<void> downloadModel() async {
  try {
    final FirebaseStorage storage = FirebaseStorage.instance;
    print('object1');
    final String modelPath = 'models/my_model.h5';
    final Reference ref = storage.ref(modelPath);
    print('object2');
    final String downloadUrl = await ref.getDownloadURL();
print(downloadUrl);
    // Use the downloadUrl to download the model file>
    // e.g., using http package or dio package
  } catch (e) {
    print('Error downloading model: $e');
  }
}

Future<void> downloadModel2() async {
  try {
    final FirebaseStorage storage = FirebaseStorage.instance;
    print('object1');
    final String modelPath = 'models/risk.h5';
    final Reference ref = storage.ref(modelPath);
    print('object2');
    final String downloadUrl = await ref.getDownloadURL();
    print(downloadUrl);
    // Use the downloadUrl to download the model file
    // e.g., using http package or dio package
  } catch (e) {
    print('Error downloading model: $e');
  }
}


//
// Future<void> loadModel() async {
//   await Tflite.loadModel(
//     model: 'assets/your_model.tflite',
//     labels: 'assets/labels.txt',
//   );
// }
// Future<void> makePrediction() async {
//   // Provide input data for prediction
//   // For example, you might have some input data stored in a list
//   List<double> inputData = [/* Your input data */];
//
//   // Perform inference
//   final List? result = await Tflite.runModelOnBinary(
//     binary: inputData,
//   );
//
//   // Process the result
//   // The result will depend on your model's output format
//   // You may need to map the output to meaningful labels or values
//   print('Prediction result: $result');
// }
