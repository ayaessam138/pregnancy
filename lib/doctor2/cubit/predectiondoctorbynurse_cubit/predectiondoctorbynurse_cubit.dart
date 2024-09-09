import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:pregancy/doctor2/constant.dart';
import 'package:pregancy/doctor2/models/pedectiondoctorbynurse.dart';

part 'predectiondoctorbynurse_state.dart';

class PredectiondoctorbynurseCubit extends Cubit<PredectiondoctorbynurseState> {
  PredectiondoctorbynurseCubit() : super(PredectiondoctorbynurseInitial());
  CollectionReference predictionDoctorbynurse =
      FirebaseFirestore.instance.collection(kpredictionDoctorbynurse);
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
    predictionDoctorbynurse.add({
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
  var predectiion;
  var predectionvalue;
  List<predectiondoctorbynursemodel> predectionlist = [];
  Future<void> showpredectiondoctor({required String email}) async {
    emit(Predectiondoctorbynurseloading());
    predictionDoctorbynurse
        .where('email', isEqualTo: email)
        .snapshots()
        .listen((event) {
      predectionlist = [];

      for (var doc in event.docs) {
        print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
        print(doc.data());
        predectiion = doc.data();
        predectionvalue = predectiion['prediction'].toString();
        print('predectionvalue');
        print((doc.data()! as Map<String, dynamic>)['prediction']);
        predectionlist.add(predectiondoctorbynursemodel
            .fromjson((doc as QueryDocumentSnapshot<Map<String, dynamic>>)));
        emit(Predectiondoctorbynursesubmitted(predectionlist: predectionlist));
      }
    });
  }
}
