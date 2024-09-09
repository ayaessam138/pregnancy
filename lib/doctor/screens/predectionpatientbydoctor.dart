import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/doctor/cubit/cubit/predictionDoctor_cubit.dart';
import 'package:pregancy/doctor/cubit/peedectionpatientbydoctor_cubit/predectionpatientbydoctor_cubit.dart';
import 'package:pregancy/doctor/screens/prediction.dart';
import 'package:pregancy/doctor/weidgetes/predectionpatientbydoctor.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';
import '../weidgetes/custom_button.dart';
import '../../patient/constants.dart';

class predectionpatientbydoctor extends StatefulWidget {
  static String predectionpatientbydoctorid = 'predecpredectionpatientbydoctor';

  @override
  State<predectionpatientbydoctor> createState() =>
      _predectionpatientbydoctorState();
}

class _predectionpatientbydoctorState extends State<predectionpatientbydoctor> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController Age = TextEditingController();
  TextEditingController SysBp = TextEditingController();
  TextEditingController DiaBp = TextEditingController();
  TextEditingController BloodSugar = TextEditingController();
  TextEditingController BodyTemperature = TextEditingController();
  TextEditingController HeartRate = TextEditingController();
  FocusNode age = FocusNode();
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
      appBar: AppBar(
        title: Text('predection'.tr()),
        backgroundColor: kprimarycolor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
              key: formkey,
              child: Column(children: [
                predectionpatientbydoctororpatientweidget(
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
                    onTap: () {
                      Text('Patient at low risk');
                      if (formkey.currentState!.validate()) {
                        BlocProvider.of<PredectionpatientbydoctorCubit>(context)
                            .predictionform(
                                Age: Age.text,
                                SysBp: SysBp.text,
                                DiaBp: DiaBp.text,
                                BloodSugar: BloodSugar.text,
                                BodyTemperature: BodyTemperature.text,
                                HeartRate: HeartRate.text);


                        performPrediction();
                        Future.delayed(Duration(seconds: 2), () {
                          Navigator.pushNamed(context, predection.predectionid);
                        });
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
                    text: 'predict'.tr()),
              ])),
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
