import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:pregancy/doctor/constants.dart';
import 'package:pregancy/doctor/models/pewdectionpatientbydoctor.dart';
import 'package:pregancy/core/globalData.dart';
import 'package:pregancy/shared_screen/cache_helper.dart';
part 'predectionpatientbydoctor_state.dart';

class PredectionpatientbydoctorCubit
    extends Cubit<PredectionpatientbydoctorState> {
  PredectionpatientbydoctorCubit() : super(PredectionpatientbydoctorInitial());
  CollectionReference predictionPatientbysdoctor = FirebaseFirestore.instance
      .collection(kpredictionPatientbysdoctorcollection);
  var curentuser = FirebaseAuth.instance;
  DateTime now = DateTime.now();
  void predictionform(
      {required String? Age,
      required String? SysBp,
      required String? DiaBp,
      required String? BloodSugar,
      required String? BodyTemperature,
      required String? HeartRate}) {
    predictionPatientbysdoctor.add({
      'email': CacheHelper.getData(key: 'email'),
      // 'email':email,
      'Age': Age,
      'SysBp': SysBp,
      'DiaBp': DiaBp,
      'BloodSugar': BloodSugar,
      'BodyTemperature': BodyTemperature,
      'HeartRate': HeartRate,
      'uId': curentuser.currentUser!.uid,
      'time': now
    });
  }
  var predectiion;
  var predectionvalue;
  List<predectionpatientbydoctor> predectionlist = [];
  Future<void> showpredectiondoctor({required String email}) async {
    emit(Predictionpatientbydoctorloading());
    predictionPatientbysdoctor
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
        predectionlist.add(predectionpatientbydoctor
            .fromjson((doc as QueryDocumentSnapshot<Map<String, dynamic>>)));
        emit(
            Predictionpatientbydoctorsubmitted(predectionlist: predectionlist));
      }
    });
  }
}
