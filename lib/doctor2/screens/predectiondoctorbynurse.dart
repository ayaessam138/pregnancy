import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/doctor2/navigationscreen/LayoutNurse.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import '../../doctor/weidgetes/custom_button.dart';
import '../../doctor/weidgetes/predectiondoctor.dart';
import '../constant.dart';
import '../cubit/predectiondoctorbynurse_cubit/predectiondoctorbynurse_cubit.dart';

class predectiondoctorbynurse extends StatefulWidget {
  static String predectiondoctorbynurseid = 'predectiondoctorbynurse';
  @override
  State<predectiondoctorbynurse> createState() =>
      _predectiondoctorbynurseState();
}

class _predectiondoctorbynurseState extends State<predectiondoctorbynurse> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController Age = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController FamHisto = TextEditingController();
  TextEditingController ChronicHtn = TextEditingController();
  TextEditingController ChronicDiabetes = TextEditingController();
  TextEditingController BMI = TextEditingController();
  TextEditingController SysBp = TextEditingController();
  TextEditingController DiaBp = TextEditingController();
  TextEditingController Hb = TextEditingController();
  TextEditingController Hematocrit = TextEditingController();
  TextEditingController MCH = TextEditingController();
  TextEditingController MCHC = TextEditingController();
  TextEditingController MCV = TextEditingController();
  TextEditingController Platelet = TextEditingController();
  TextEditingController SerumCreatinine = TextEditingController();
  TextEditingController HDL = TextEditingController();

  TextEditingController BloodSugar = TextEditingController();
  TextEditingController BodyTemperature = TextEditingController();
  TextEditingController HeartRate = TextEditingController();
  FocusNode age = FocusNode();
  FocusNode Email = FocusNode();
  FocusNode famHisto = FocusNode();
  FocusNode chronicHtn = FocusNode();
  FocusNode chronicDiabetes = FocusNode();
  FocusNode bMI = FocusNode();
  FocusNode sysBp = FocusNode();
  FocusNode diaBp = FocusNode();
  FocusNode hb = FocusNode();
  FocusNode hematocrit = FocusNode();
  FocusNode mCH = FocusNode();
  FocusNode mCHC = FocusNode();
  FocusNode mCV = FocusNode();
  FocusNode platelet = FocusNode();
  FocusNode serumCreatinine = FocusNode();
  FocusNode hDL = FocusNode();

  FocusNode bloodSugar = FocusNode();
  FocusNode bodyTemperature = FocusNode();
  FocusNode heartRate = FocusNode();
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
            child: Column(
              children: [
                predectiondoctorweidget(
                    Age: Age,
                    email: email,
                    FamHisto: FamHisto,
                    ChronicHtn: ChronicHtn,
                    ChronicDiabetes: ChronicDiabetes,
                    BMI: BMI,
                    SysBp: SysBp,
                    DiaBp: DiaBp,
                    Hb: Hb,
                    Hematocrit: Hematocrit,
                    MCH: MCH,
                    MCHC: MCHC,
                    MCV: MCV,
                    Platelet: Platelet,
                    SerumCreatinine: SerumCreatinine,
                    HDL: HDL,

                    age: age,
                    Email: Email,
                    famHisto: famHisto,
                    chronicHtn: chronicHtn,
                    chronicDiabetes: chronicDiabetes,
                    bMI: bMI,
                    sysBp: sysBp,
                    diaBp: diaBp,
                    hb: hb,
                    hematocrit: hematocrit,
                    mCH: mCH,
                    mCHC: mCHC,
                    mCV: mCV,
                    platelet: platelet,
                    serumCreatinine: serumCreatinine,
                    hDL: hDL,
              ),
                custoumbutton(
                    onTap: () {
                      Text('Patient At low risk for anemia');

                      if (formkey.currentState!.validate()) {
                        BlocProvider.of<PredectiondoctorbynurseCubit>(context)
                            .predictionform(
                                Age: Age.text,
                                FamHisto: FamHisto.text,
                                ChronicHtn: ChronicHtn.text,
                                ChronicDiabetes: ChronicDiabetes.text,
                                BMI: BMI.text,
                                SysBp: SysBp.text,
                                DiaBp: DiaBp.text,
                                Hb: Hb.text,
                                Hematocrit: Hematocrit.text,
                                MCH: MCH.text,
                                MCHC: MCHC.text,
                                MCV: MCV.text,
                                Platelet: Platelet.text,
                                SerumCreatinine: SerumCreatinine.text,
                                HDL: HDL.text,
                                email: email.text);
                        performPrediction();
                        Future.delayed(Duration(seconds: 2), () {
                          Navigator.pushNamed(
                              context, LayOutNurse.homenursepageid);
                        });
                      } else {
                        if (Age.text.isEmpty) {
                          age.requestFocus();
                        } else if (FamHisto.text.isEmpty) {
                          famHisto.requestFocus();
                        } else if (ChronicHtn.text.isEmpty) {
                          chronicHtn.requestFocus();
                        } else if (ChronicDiabetes.text.isEmpty) {
                          chronicDiabetes.requestFocus();
                        } else if (BMI.text.isEmpty) {
                          bMI.requestFocus();
                        } else if (SysBp.text.isEmpty) {
                          sysBp.requestFocus();
                        } else if (DiaBp.text.isEmpty) {
                          diaBp.requestFocus();
                        } else if (Hematocrit.text.isEmpty) {
                          hematocrit.requestFocus();
                        } else if (MCH.text.isEmpty) {
                          mCH.requestFocus();
                        } else if (MCHC.text.isEmpty) {
                          mCHC.requestFocus();
                        } else if (MCV.text.isEmpty) {
                          mCV.requestFocus();
                        } else if (Platelet.text.isEmpty) {
                          platelet.requestFocus();
                        } else if (SerumCreatinine.text.isEmpty) {
                          serumCreatinine.requestFocus();
                        } else if (HDL.text.isEmpty) {
                          hDL.requestFocus();
                        } else if (email.text.isEmpty) {
                          Email.requestFocus();
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
      double.parse(FamHisto.text),
      double.parse(ChronicHtn.text),
      double.parse(ChronicDiabetes.text),
      double.parse(BMI.text),
      double.parse(SysBp.text),
      double.parse(DiaBp.text),
      double.parse(Hb.text),
      double.parse(Hematocrit.text),
      double.parse(MCH.text),
      double.parse(MCHC.text),
      double.parse(MCV.text),
      double.parse(Platelet.text),
      double.parse(SerumCreatinine.text),
      double.parse(HDL.text),

    ]);

    // Convert Float32List to Uint8List
    final inputUint8List = Uint8List.view(inputData.buffer);

    // Assuming you have initialized the 'interpreter' instance
    interpreter.allocateTensors();
    interpreter.getInputTensor(0).data = inputUint8List;
    interpreter.invoke();

    // Retrieve output tensor data
    final outputData = interpreter.getOutputTensor(0).data;

    // Process the output data
    // For example, display the prediction result
    displayPredictionResult(outputData);
  }



  void displayPredictionResult(Uint8List outputData) {
    // Convert the list of bytes into a list of doubles
    final List<double> probabilities = outputData.map((byte) => byte / 255.0).toList();

    // Assuming you have a list of class labels
    final List<String> classLabels = ['Patient at high risk of Diabetes', 'Patient at high risk of pre-eclampsia' , 'Patient at high risk of anemia','Patient has another risk']; // Replace with your actual class labels

    // Find the index of the class with the highest probability
    final int predictedClassIndex = probabilities.indexOf(probabilities.reduce((curr, next) => curr > next ? curr : next));

    // Get the predicted class label
    final String predictedClassLabel = classLabels[predictedClassIndex];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Prediction Result'),
          content: Text('Prediction: $predictedClassLabel'),
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
      "EarlyDetection",
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
