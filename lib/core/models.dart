// import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';
//
// void model(){
//   FirebaseModelDownloader.instance
//       .getModel(
//       "MaternalRisk",
//       FirebaseModelDownloadType.localModel,
//       FirebaseModelDownloadConditions(
//         iosAllowsCellularAccess: true,
//         iosAllowsBackgroundDownloading: false,
//         androidChargingRequired: false,
//         androidWifiRequired: false,
//         androidDeviceIdleRequired: false,
//       )
//   )
//       .then((customModel) {
//     // Download complete. Depending on your app, you could enable the ML
//     // feature, or switch from the local model to the remote model, etc.
//
//     // The CustomModel object contains the local path of the model file,
//     // which you can use to instantiate a TensorFlow Lite interpreter.
//     final localModelPath = customModel.file;
//
//     // ...
//   });
// }

// import 'dart:io';
// import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';
//
// void model() {
//   FirebaseModelDownloader.instance
//       .getModel(
//     "MaternalRisk",
//     FirebaseModelDownloadType.localModel,
//     FirebaseModelDownloadConditions(
//       iosAllowsCellularAccess: true,
//       iosAllowsBackgroundDownloading: false,
//       androidChargingRequired: false,
//       androidWifiRequired: false,
//       androidDeviceIdleRequired: false,
//     ),
//   )
//       .then((customModel) {
//     // Download complete. Depending on your app, you could enable the ML
//     // feature, or switch from the local model to the remote model, etc.
//
//     // The CustomModel object contains the local path of the model file,
//     // which you can use to instantiate a TensorFlow Lite interpreter.
//     final  localModelPath = customModel.file;
//
//     // Instantiate a TensorFlow Lite interpreter
//     final Interpreter interpreter = Interpreter.fromFile(localModelPath);
//
//     // Continue your operations with the interpreter...
//   });
// }
// import 'dart:typed_data';
// import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';
//
// void model() {
//   FirebaseModelDownloader.instance
//       .getModel(
//     "MaternalRisk",
//     FirebaseModelDownloadType.localModel,
//     FirebaseModelDownloadConditions(
//       iosAllowsCellularAccess: true,
//       iosAllowsBackgroundDownloading: false,
//       androidChargingRequired: false,
//       androidWifiRequired: false,
//       androidDeviceIdleRequired: false,
//     ),
//   )
//       .then((customModel) {
//     // Download complete. Depending on your app, you could enable the ML
//     // feature, or switch from the local model to the remote model, etc.
//
//     // The CustomModel object contains the local path of the model file,
//     // which you can use to instantiate a TensorFlow Lite interpreter.
//     final localModelPath = customModel.file;
//
//     // Instantiate a TensorFlow Lite interpreter
//     final Interpreter interpreter = Interpreter.fromFile(localModelPath);
//
//     // Example input data (replace it with your actual input data)
//     final inputData = // Provide your input data here in a suitable format;
//
//     // Perform inference
//     interpreter.allocateTensors();
//     interpreter.getInputTensor(0).data = inputData;
//     interpreter.invoke();
//
//     // Get output tensor data
//     final outputData = interpreter.getOutputTensor(0).data;
//
//     // Process the output data (interpret the predictions)
//     processOutput(outputData);
//
//     // Continue your operations with the interpreter...
//   });
// }
//
// void processOutput(Float32List outputData) {
//   // Process the output data received from the model
//   // This could involve decoding the predictions, post-processing, etc.
// }
//
//
// // Function to collect user input and perform prediction
// void performPrediction() {
//   // Example: Gather user input from form fields
//   double userMeasurement1 = 5.6;
//   double userMeasurement2 = 7.8;
//   String userDescription = "Some description provided by the user";
//
//
//   final inputData = Float32List.fromList([
//     userMeasurement1,
//     userMeasurement2,
//     // Add more input values as needed
//   ]);
//
//   // Call the function to use the model with the input data
//   useModel(inputData);
// }
//
// // Function to use the TensorFlow Lite model with input data
// void useModel(Float32List inputData) {
//   // Instantiate TensorFlow Lite interpreter and perform inference as shown in previous examples
//   // ...
// }

