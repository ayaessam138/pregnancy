import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../constants.dart';
import '../../models/predectiondoctor.dart';

part 'predictionDoctor_state.dart';

class PredictionDoctorCubit extends Cubit<PredictionDoctorState> {
  PredictionDoctorCubit() : super(PredictionDoctorInitial());
  CollectionReference predictionDoctor =
      FirebaseFirestore.instance.collection(kpredictionDoctorcollection);
  var curentuser = FirebaseAuth.instance;
  DateTime now = DateTime.now();
  void predictionform({
    required String? Age,
    required String? email,
    required String? FamHisto,
    required String? ChronicHtn,
    required String? ChronicDiabetes,
    required String? BMI,
    required String? SysBp,
    required String? DiaBp,
    required String? Hb,
    required String? Hematocrit,
    required String? MCH,
    required String? MCHC,
    required String? MCV,
    required String? Platelet,
    required String? SerumCreatinine,
    required String? HDL,

    // required String? BloodSugar,
    // required String? BodyTemperature,
    // required String? HeartRate
  }) {
    predictionDoctor.add({
      'Age': Age,
      'email': email,
      'time': now,
      'FamHist': FamHisto,
      'ChronicHtn': ChronicHtn,
      'ChronicDiabetes': ChronicDiabetes,
      'BMI': BMI,
      'SysBp': SysBp,
      'DiaBp': DiaBp,
      'Hb': Hb,
      'Hematocrit': Hematocrit,
      'MCH': MCH,
      'MCHC': MCHC,
      'MCV': MCV,
      'Platelet': Platelet,
      'SerumCreatinine': SerumCreatinine,
      'HDL': HDL,

      // 'BloodSugar': BloodSugar,
      // 'BodyTemperature': BodyTemperature,
      // 'HeartRate': HeartRate,
      'uId': curentuser.currentUser!.uid
    });
  }

  List<predectiondoctor> predectionlist = [];
  Future<void> showpredectiondoctor({required String email}) async {
    emit(PredictionDoctorloading());
    predictionDoctor
        .where('email', isEqualTo: email)
        .snapshots()
        .listen((event) {
      predectionlist = [];

      for (var doc in event.docs) {
        predectionlist.add(predectiondoctor
            .fromjson((doc as QueryDocumentSnapshot<Map<String, dynamic>>)));
        emit(PredictionDoctorsubmitted(predectionlist: predectionlist));
      }
    });
  }
}
