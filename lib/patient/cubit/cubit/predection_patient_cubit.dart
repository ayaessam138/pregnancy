import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:pregancy/doctor/constants.dart';
import 'package:pregancy/patient/constants.dart';
import 'package:pregancy/core/globalData.dart';
import 'package:pregancy/patient/models/predectionpatient.dart';
import 'package:intl/intl.dart';
import 'package:pregancy/shared_screen/cache_helper.dart';
part 'predection_patient_state.dart';

class PredectionPatientCubit extends Cubit<PredectionPatientState> {
  PredectionPatientCubit() : super(PredectionPatientInitial());

  CollectionReference predictionPatient =
      FirebaseFirestore.instance.collection(kpredictionPatientcollection);
  var currentuser = FirebaseAuth.instance;
  DateTime now = DateTime.now();

  Future<void> predictionform(
      {required String? Age,
      required String? SysBp,
      required String? DiaBp,
      required String? BloodSugar,
      required String? BodyTemperature,
      required String? HeartRate}) async {
    await predictionPatient.add({
      'email': CacheHelper.getData(
        key: 'email',
      ),
      // 'email': email,
      'Age': Age,
      'SysBp': SysBp,
      'DiaBp': DiaBp,
      'BloodSugar': BloodSugar,
      'BodyTemperature': BodyTemperature,
      'HeartRate': HeartRate,
      'uId': currentuser.currentUser!.uid,
      'time': now
    }).then((value) => getprectiondpatient(
          email: CacheHelper.getData(
            key: 'email',
          ),
        ));
  }

  var predectiion;
  var predectionvalue;
  List<predectionpatient> predectionlist = [];
  Future<void> getprectiondpatient({required String email}) async {
    emit((PredectionPatientloading()));
    print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
    predictionPatient
        .where('email', isEqualTo: email)
        .snapshots()
        .listen((event) async {
      predectionlist = [];
      for (var doc in event.docs) {
        print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
        print(doc.data());
        predectiion = doc.data();
        predectionvalue = predectiion['prediction'].toString();
        print('predectionvalue');
        print((doc.data()! as Map<String, dynamic>)['prediction']);
        predectionlist.add(predectionpatient
            .fromjson((doc as QueryDocumentSnapshot<Map<String, dynamic>>)));

        emit(PredectionPatientsubmiited(predectionlist: predectionlist));
      }
    });
  }
}
