import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:pregancy/doctor/constants.dart';
import 'package:pregancy/doctor2/models/predectionpatientbynurse.dart';

import '../../constant.dart';
import 'package:pregancy/core/globalData.dart';

part 'predectionpatientbynurse_state.dart';

class PredectionpatientbynurseCubit
    extends Cubit<PredectionpatientbynurseState> {
  PredectionpatientbynurseCubit() : super(PredectionpatientbynurseInitial());

  CollectionReference predictionPatientbynurse = FirebaseFirestore.instance
      .collection(kpredictionPatientbynursecollection);
  var curentuser = FirebaseAuth.instance;
  DateTime now = DateTime.now();
  void predictionform(
      {required String? Age,
      required String? SysBp,
      required String? DiaBp,
      required String? BloodSugar,
      required String? BodyTemperature,
      required String? HeartRate,
      required String? name,
      required String? email}) {
    predictionPatientbynurse.add({
      'email': email,
      'Age': Age,
      'SysBp': SysBp,
      'DiaBp': DiaBp,
      'BloodSugar': BloodSugar,
      'BodyTemperature': BodyTemperature,
      'HeartRate': HeartRate,
      'uId': curentuser.currentUser!.uid,
      'time': now,
      'name': name
    });
  }
  var predectiion;
  var predectionvalue;
  List<predectionpatientbynursemodel> predectionlist = [];
  Future<void> predictform() async {
    emit(Predectionpatientbynurseloading());
    print (  'predectionlistttttttt');

    predictionPatientbynurse.snapshots().listen((event) {
      predectionlist = [];
      print (  'predectionlist');
      for (var doc in event.docs) {
        print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
        print(doc.data());
        predectiion = doc.data();
        predectionvalue = predectiion['prediction'].toString();
        print('predectionvalue');
        print((doc.data()! as Map<String, dynamic>)['prediction']);
        if ((doc.data()! as Map<String, dynamic>)['uId'] ==
            curentuser.currentUser!.uid) {
          predectionlist.add(predectionpatientbynursemodel
              .fromjson((doc as QueryDocumentSnapshot<Map<String, dynamic>>)));
        }
      }
   print (  predectionlist);
      emit(Predectionpatientbynursesubmitted(predectionlist: predectionlist));
    }).onError((e) {
      print(e.toString());
    });
  }
}
