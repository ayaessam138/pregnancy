// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pregancy/doctor/weidgetes/predectionpatientbydoctor.dart';
// import 'package:pregancy/patient/cubit/cubit/predection_patient_cubit.dart';
//
// import '../../doctor/constants.dart';
// import '../../doctor/core/core.dart';
// import '../../doctor/weidgetes/custom_button.dart';
// import '../../doctor/weidgetes/custombutton.dart';
//
// class predectionPatient extends StatefulWidget {
//   static String predectionPatientid = 'predectionPatient';
//
//   @override
//   State<predectionPatient> createState() => _predectionPatientState();
// }
//
// class _predectionPatientState extends State<predectionPatient> {
//   GlobalKey<FormState> formkey = GlobalKey();
//   TextEditingController Age = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController SysBp = TextEditingController();
//   TextEditingController DiaBp = TextEditingController();
//   TextEditingController BloodSugar = TextEditingController();
//   TextEditingController BodyTemperature = TextEditingController();
//   TextEditingController HeartRate = TextEditingController();
//   FocusNode age = FocusNode();
//   FocusNode Email = FocusNode();
//   FocusNode sysBp = FocusNode();
//   FocusNode diaBp = FocusNode();
//   FocusNode bloodSugar = FocusNode();
//   FocusNode bodyTemperature = FocusNode();
//   FocusNode heartRate = FocusNode();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(40.0),
//           child: Form(
//             key: formkey,
//             child: Column(
//               children: [
//                 predectionpatientbydoctororpatientweidget(
//                     email: email,
//                     Age: Age,
//                     BloodSugar: BloodSugar,
//                     BodyTemperature: BodyTemperature,
//                     DiaBp: DiaBp,
//                     HeartRate: HeartRate,
//                     SysBp: SysBp,
//                     age: age,
//                     sysBp: sysBp,
//                     diaBp: diaBp,
//                     bloodSugar: bloodSugar,
//                     bodyTemperature: bodyTemperature,
//                     heartRate: heartRate),
//                 custoumbutton(
//                     onTap: () async {
//                       if (formkey.currentState!.validate()) {
//                         await BlocProvider.of<PredectionPatientCubit>(context)
//                             .predictionform(
//                                 Age: Age.text,
//                                 SysBp: SysBp.text,
//                                 DiaBp: DiaBp.text,
//                                 BloodSugar: BloodSugar.text,
//                                 BodyTemperature: BodyTemperature.text,
//                                 HeartRate: HeartRate.text)
//                             .then((value) {
//                           // downloadAndSaveModel();
//
//                           showDialog(
//                               context: context,
//                               //     .collection('doctor_reservations')
//                               builder: (BuildContext context) {
//                                 // var prediction = FirebaseFirestore.instance
//                                 //     .where("prediction")
//                                 //     .snapshots();
//                                 return AlertDialog(
//                                   title: Text("Success"),
//                                   content:
//                                          Text('predection at low risk for anemia'),
//
//                                 );
//                               });
//                         });
//                         // Future.delayed(Duration(seconds: 2), () {
//                         //
//                         //
//                         // });
//                         // await   BlocProvider.of<PredectionPatientCubit>(context).getprectiondpatient(email:email.text );
//                       } else {
//                         if (Age.text.isEmpty) {
//                           age.requestFocus();
//                         } else if (SysBp.text.isEmpty) {
//                           sysBp.requestFocus();
//                         } else if (DiaBp.text.isEmpty) {
//                           diaBp.requestFocus();
//                         } else if (BloodSugar.text.isEmpty) {
//                           bloodSugar.requestFocus();
//                         } else if (BodyTemperature.text.isEmpty) {
//                           bodyTemperature.requestFocus();
//                         } else if (HeartRate.text.isEmpty) {
//                           heartRate.requestFocus();
//                         }
//                       }
//                     },
//                     text: 'predict'.tr())
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:typed_data';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/doctor/weidgetes/custom_button.dart';
import 'package:pregancy/doctor/weidgetes/predectionpatientbydoctor.dart';
import 'package:pregancy/patient/cubit/cubit/predection_patient_cubit.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';

class PredectionPatient extends StatefulWidget {
  static String predectionPatientid = 'predectionPatient';

  @override
  State<PredectionPatient> createState() => _PredectionPatientState();
}

class _PredectionPatientState extends State<PredectionPatient> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController Age = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController SysBp = TextEditingController();
  TextEditingController DiaBp = TextEditingController();
  TextEditingController BloodSugar = TextEditingController();
  TextEditingController BodyTemperature = TextEditingController();
  TextEditingController HeartRate = TextEditingController();
  FocusNode age = FocusNode();
  FocusNode Email = FocusNode();
  FocusNode sysBp = FocusNode();
  FocusNode diaBp = FocusNode();
  FocusNode bloodSugar = FocusNode();
  FocusNode bodyTemperature = FocusNode();
  FocusNode heartRate = FocusNode();


  // Initialize interpreter globally
  late Interpreter interpreter;

  @override
  void initState() {
    super.initState();
    // Call the model function to download and initialize the TensorFlow Lite model
    model();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                predectionpatientbydoctororpatientweidget(
                    email: email,
                    Age: Age,
                    BloodSugar: BloodSugar,
                    BodyTemperature: BodyTemperature,
                    DiaBp: DiaBp,
                    HeartRate: HeartRate,
                    SysBp: SysBp,
                    age: age,
                    sysBp: sysBp,
                    diaBp: diaBp,
                    bloodSugar: bloodSugar,
                    bodyTemperature: bodyTemperature,
                    heartRate: heartRate),
                custoumbutton(
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        await BlocProvider.of<PredectionPatientCubit>(context)
                            .predictionform(
                            Age: Age.text,
                            SysBp: SysBp.text,
                            DiaBp: DiaBp.text,
                            BloodSugar: BloodSugar.text,
                            BodyTemperature: BodyTemperature.text,
                            HeartRate: HeartRate.text)
                            .then((value) {
                          // downloadAndSaveModel();
                          performPrediction();
                          // showDialog(
                          //     context: context,
                          //     //     .collection('doctor_reservations')
                          //     builder: (BuildContext context) {
                          //       // var prediction = FirebaseFirestore.instance
                          //       //     .where("prediction")
                          //       //     .snapshots();
                          //       return AlertDialog(
                          //         title: Text("Success"),
                          //         content:
                          //         Text('predection at low risk for anemia'),
                          //
                          //       );
                          //     });
                        });
                        // Future.delayed(Duration(seconds: 2), () {
                        //
                        //
                        // });
                        // await   BlocProvider.of<PredectionPatientCubit>(context).getprectiondpatient(email:email.text );
                      } else {
                        if (Age.text.isEmpty) {
                          age.requestFocus();
                        } else if (SysBp.text.isEmpty) {
                          sysBp.requestFocus();
                        } else if (DiaBp.text.isEmpty) {
                          diaBp.requestFocus();
                        } else if (BloodSugar.text.isEmpty) {
                          bloodSugar.requestFocus();
                        } else if (BodyTemperature.text.isEmpty) {
                          bodyTemperature.requestFocus();
                        } else if (HeartRate.text.isEmpty) {
                          heartRate.requestFocus();
                        }
                      }
                    },
                    text: 'predict'.tr())
              ],
            ),
          ),
        ),
      ),
    );
  }

  void performPrediction() {
    // Prepare input data for the model
    final inputData = Float32List.fromList([
      double.parse(Age.text),
      double.parse(SysBp.text),
      double.parse(DiaBp.text),
      double.parse(BloodSugar.text),
      double.parse(BodyTemperature.text),
      double.parse(HeartRate.text),
    ]);

    // Convert Float32List to Uint8List
    final inputUint8List = Uint8List.view(inputData.buffer);

    // Perform inference
    interpreter.allocateTensors();
    interpreter.getInputTensor(0).data = inputUint8List;
    interpreter.invoke();

    // Retrieve output tensor data
    final outputData = interpreter.getOutputTensor(0).data;

    // Process the output data
    // For example, display the prediction result
    print('output');
    print(outputData);

    displayPredictionResult(outputData);
  }

  //
  // void displayPredictionResult(Uint8List outputData) {
  //   // Example: Display prediction result in an AlertDialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Prediction Result'),
  //         content: Text('Prediction: $outputData'), // Replace with actual result
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('OK'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // Function to download and initialize TensorFlow Lite model
  // void displayPredictionResult(Uint8List outputData) {
  //   // Assuming the output is a list of class probabilities (e.g., softmax output)
  //   // Convert the Uint8List to List<double>
  //   final List<double> probabilities = outputData.map((e) => e / 255.0).toList();
  //
  //   // Get the index of the class with the highest probability
  //   final int predictedClassIndex = probabilities.indexOf(probabilities.reduce((curr, next) => curr > next ? curr : next));
  //
  //   // Assuming you have a list of class labels
  //   final List<String> classLabels = ['high', 'low', 'medium']; // Replace with actual class labels
  //
  //   // Get the predicted class label
  //   final String predictedClassLabel = classLabels[predictedClassIndex];
  //
  //   // Display prediction result in an AlertDialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Prediction Result'),
  //         content: Text('Predicted Class: $predictedClassLabel'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('OK'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
//   void displayPredictionResult(Uint8List outputData) {
//     // Convert the list of bytes into a string
//
//     final String predictionResult = String.fromCharCodes(outputData);
// print('predictionResult');
// print(predictionResult);
//
//     // Display prediction result in an AlertDialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Prediction Result'),
//           content: Text('Prediction: $predictionResult'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
  void displayPredictionResult(Uint8List outputData) {
    // Convert the list of bytes into a list of doubles
    final List<double> probabilities = outputData.map((byte) => byte / 255.0).toList();

    // Assuming you have a list of class labels
    final List<String> classLabels = ['Patient at low risk', 'Patient at medium risk', 'Patient at high risk']; // Replace with your actual class labels

    // Find the index of the class with the highest probability
    final int predictedClassIndex = probabilities.indexOf(probabilities.reduce((curr, next) => curr > next ? curr : next));

    // Get the predicted class label
    final String predictedClassLabel = classLabels[predictedClassIndex];

    // Display prediction result in an AlertDialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Prediction Result'),
          content: Text('Predicted Class: $predictedClassLabel'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void model() {
    FirebaseModelDownloader.instance
        .getModel(
      "MaternalRisk",
      FirebaseModelDownloadType.localModel,
      FirebaseModelDownloadConditions(
        iosAllowsCellularAccess: true,
        iosAllowsBackgroundDownloading: false,
        androidChargingRequired: false,
        androidWifiRequired: false,
        androidDeviceIdleRequired: false,
      ),
    )
        .then((customModel) {
      // Download complete. Depending on your app, you could enable the ML
      // feature, or switch from the local model to the remote model, etc.

      // The CustomModel object contains the local path of the model file,
      // which you can use to instantiate a TensorFlow Lite interpreter.
      final localModelPath = customModel.file;

      // Instantiate a TensorFlow Lite interpreter
      interpreter = Interpreter.fromFile(localModelPath);
    });
  }
}
