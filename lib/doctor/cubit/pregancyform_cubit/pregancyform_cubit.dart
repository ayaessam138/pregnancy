import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:pregancy/core/globalData.dart';
import 'package:pregancy/doctor/models/pregnancyform.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pregancy/patient/models/predectionpatient.dart';

import '../../constants.dart';

part 'pregancyform_state.dart';

class PregancyformCubit extends Cubit<PregancyformState> {
  PregancyformCubit() : super(PregancyformInitial());
  CollectionReference pregancyform =
      FirebaseFirestore.instance.collection(kpregancyformcollection);
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  var currentUser = FirebaseAuth.instance;
  // String? doctorid = globalData.userData!["userid"];

  void submitform({
    required String name,
    required String patientid,
    required String email,
    required String Age,
    required String Ageatmarriage,
    required String adress,
    required String husbandage,
    required String LevelOfEducation,
    required String Ocuppation,
    required String Habit,
    required String HusbandHabit,
    required String HusbandOcuppation,
    required String AgeofMenarche,
    required String DurationofMenses,
    required String IntervalofCycle,
    required String FallTermPregancy,
    required String Pretermpregancy,
    required String Abortion,
    required String LiveBabies,
    required String BloodGroup,
    required String RhFactor,
    required String TORCH,
    required String Sugar,
    required String Ketone,
    required String uss,
    required String Height,
    required String Weight,
    required String PrePregancyBodyMassIndex,
    required String BloodPressure,
    required String Pluse,
    required String HeadNeckdropdown,
    required String headneckspecify,
    required String BreastsNipplesdropDwonValue,
    required String BreastsNipplesspeficy,
    required String ChestdropDwonValue,
    required String Chestspecify,
    required String TeethGumsdropDwonValue,
    required String TeethGumsspecify,
    required String HeartdropDwonValue,
    required String Heartspecify,
    required String AbdomendropDwonValue,
    required String Abdomenspecify,
    required String BackbonedropDwonValue,
    required String Backbonespecify,
    required String varicositiesExtremitiesValue,
    required String varicositiesExtremitiesspecify,
    required String EdemadropDwonValue,
    required String Edemaspecify,
    required String? nausea,
    required String? vomiting,
    required String? Urinaryfrequency,
    required String? fatigue,
    required String? breasttndrness,
    required String? Vignaldiscarge,
    required String? headache,
    required String? heartburn,
    required String? faitness,
    required String? constipation,
    required String? flatulence,
    required String? varicoseviens,
    required String? dyspena,
    required String? backache,
    required String? ankleedma,
    required String? legCramps,
    required String? hemorrhiods,
  }) {
    pregancyform.add({
      'uId': currentUser.currentUser!.uid,
      'name': name,
      'patientid': patientid,
      'email': email,
      'Age': Age,
      'Ageatmarriage': Ageatmarriage,
      'adress': adress,
      'husbandage': husbandage,
      'LevelOfEducation': LevelOfEducation,
      'Ocuppation': Ocuppation,
      'Habit': Habit,
      'HusbandHabit': HusbandHabit,
      'HusbandOcuppation': HusbandOcuppation,
      'AgeofMenarche': AgeofMenarche,
      'DurationofMenses': DurationofMenses,
      'IntervalofCycle': IntervalofCycle,
      'FallTermPregancy': FallTermPregancy,
      'Pretermpregancy': Pretermpregancy,
      'Abortion': Abortion,
      'LiveBabies': LiveBabies,
      'BloodGroup': BloodGroup,
      'RhFactor': RhFactor,
      'TORCH': TORCH,
      'Sugar': Sugar,
      'Ketone': Ketone,
      'uss': uss,
      'Height': Height,
      'Weight': Weight,
      'PrePregancyBodyMassIndex': PrePregancyBodyMassIndex,
      'BloodPressure': BloodPressure,
      'Pluse': Pluse,
      'HeadNeckdropdown': HeadNeckdropdown,
      'headneckspecify': headneckspecify,
      'BreastsNipplesdropDwonValue': BreastsNipplesdropDwonValue,
      'BreastsNipplesspeficy': BreastsNipplesspeficy,
      'ChestdropDwonValue': ChestdropDwonValue,
      'Chestspecify': Chestspecify,
      'TeethGumsdropDwonValue': TeethGumsdropDwonValue,
      'HeartdropDwonValue': HeartdropDwonValue,
      'Heartspecify': Heartspecify,
      'AbdomendropDwonValue': AbdomendropDwonValue,
      'Abdomenspecify': Abdomenspecify,
      'BackbonedropDwonValue': BackbonedropDwonValue,
      'Backbonespecify': Backbonespecify,
      'varicositiesExtremitiesValue': varicositiesExtremitiesValue,
      'varicositiesExtremitiesspecify': varicositiesExtremitiesspecify,
      'EdemadropDwonValue': EdemadropDwonValue,
      'Edemaspecify': Edemaspecify,
      'nausea': nausea,
      'vomiting': vomiting,
      'Urinaryfrequency': Urinaryfrequency,
      'fatigue': fatigue,
      'breasttndrness': breasttndrness,
      'Vignaldiscarge': Vignaldiscarge,
      'headache': headache,
      'heartburn': heartburn,
      'faitness': faitness,
      'constipation': constipation,
      'flatulence': flatulence,
      'varicoseviens': varicoseviens,
      'dyspena': dyspena,
      'backache': backache,
      'ankleedma': ankleedma,
      'legCramps': legCramps,
      'hemorrhiods': hemorrhiods,
    }).catchError((e) {
      print(e.toString());
    }).then(
      (value) => print(value),
    );
  }

  List<pregancyformmodel> pregnacyformlist = [];
  Future<void> showpregnancyformdata() async {
    emit(Pregancyformloading());
    pregancyform.snapshots().listen((event) {
      pregnacyformlist = [];

      for (var doc in event.docs) {
        if ((doc.data()! as Map<String, dynamic>)['uId'] ==
            currentUser.currentUser!.uid) {
          pregnacyformlist.add(pregancyformmodel
              .fromjson((doc as QueryDocumentSnapshot<Map<String, dynamic>>)));
        }
      }
      print('object');
      emit(pregancyformsubitted(pregnancyformlist: pregnacyformlist));
    }).onError((e) {
      print(e.toString());
    });
  }

  Future<void> deletepatient({required String id}) async {
    pregancyform.doc(id).delete();
  }

  List<pregancyformmodel> pregnacy = [];
  Future<void> searchpatient({required String name}) async {
    emit(Pregancyformloading());
    pregnacy = [];
    await pregancyform.where('name', arrayContains: name).get().then((value) {
      print(value.docs);
      for (var doc in value.docs) {
        pregnacy.add(pregancyformmodel
            .fromjson((doc as QueryDocumentSnapshot<Map<String, dynamic>>)));
        emit(pregnacyformsearch(pregnancy: pregnacy));
      }
    }).catchError((onError) {
      print(onError.toString());
    });
  }

  Future<void> updatepregancyform({
    required String docid,
    required String name,
    required String patientid,
    required String email,
    required String Age,
    required String Ageatmarriage,
    required String adress,
    required String husbandage,
    required String LevelOfEducation,
    required String Ocuppation,
    required String Habit,
    required String HusbandHabit,
    required String HusbandOcuppation,
    required String AgeofMenarche,
    required String DurationofMenses,
    required String IntervalofCycle,
    required String FallTermPregancy,
    required String Pretermpregancy,
    required String Abortion,
    required String LiveBabies,
    required String BloodGroup,
    required String RhFactor,
    required String TORCH,
    required String Sugar,
    required String Ketone,
    required String uss,
    required String Height,
    required String Weight,
    required String PrePregancyBodyMassIndex,
    required String BloodPressure,
    required String Pluse,
    required String HeadNeckdropdown,
    required String headneckspecify,
    required String BreastsNipplesdropDwonValue,
    required String BreastsNipplesspeficy,
    required String ChestdropDwonValue,
    required String Chestspecify,
    required String TeethGumsdropDwonValue,
    required String TeethGumsspecify,
    required String HeartdropDwonValue,
    required String Heartspecify,
    required String AbdomendropDwonValue,
    required String Abdomenspecify,
    required String BackbonedropDwonValue,
    required String Backbonespecify,
    required String varicositiesExtremitiesValue,
    required String varicositiesExtremitiesspecify,
    required String EdemadropDwonValue,
    required String Edemaspecify,
    required String nausea,
    required String vomiting,
    required String Urinaryfrequency,
    required String fatigue,
    required String breasttndrness,
    required String Vignaldiscarge,
    required String headache,
    required String heartburn,
    required String faitness,
    required String constipation,
    required String flatulence,
    required String varicoseviens,
    required String dyspena,
    required String backache,
    required String ankleedma,
    required String legCramps,
    required String hemorrhiods,
  }) async {
    pregancyform.doc(docid).update({
      'name': name,
      'patientid': patientid,
      'email': email,
      'Age': Age,
      'Ageatmarriage': Ageatmarriage,
      'adress': adress,
      'husbandage': husbandage,
      'LevelOfEducation': LevelOfEducation,
      'Ocuppation': Ocuppation,
      'Habit': Habit,
      'HusbandHabit': HusbandHabit,
      'HusbandOcuppation': HusbandOcuppation,
      'AgeofMenarche': AgeofMenarche,
      'DurationofMenses': DurationofMenses,
      'IntervalofCycle': IntervalofCycle,
      'FallTermPregancy': FallTermPregancy,
      'Pretermpregancy': Pretermpregancy,
      'Abortion': Abortion,
      'LiveBabies': LiveBabies,
      'BloodGroup': BloodGroup,
      'RhFactor': RhFactor,
      'TORCH': TORCH,
      'Sugar': Sugar,
      'Ketone': Ketone,
      'uss': uss,
      'Height': Height,
      'Weight': Weight,
      'PrePregancyBodyMassIndex': PrePregancyBodyMassIndex,
      'BloodPressure': BloodPressure,
      'Pluse': Pluse,
      'HeadNeckdropdown': HeadNeckdropdown,
      'headneckspecify': headneckspecify,
      'BreastsNipplesdropDwonValue': BreastsNipplesdropDwonValue,
      'BreastsNipplesspeficy': BreastsNipplesspeficy,
      'ChestdropDwonValue': ChestdropDwonValue,
      'Chestspecify': Chestspecify,
      'TeethGumsdropDwonValue': TeethGumsdropDwonValue,
      'HeartdropDwonValue': HeartdropDwonValue,
      'Heartspecify': Heartspecify,
      'AbdomendropDwonValue': AbdomendropDwonValue,
      'Abdomenspecify': Abdomenspecify,
      'BackbonedropDwonValue': BackbonedropDwonValue,
      'Backbonespecify': Backbonespecify,
      'varicositiesExtremitiesValue': varicositiesExtremitiesValue,
      'varicositiesExtremitiesspecify': varicositiesExtremitiesspecify,
      'EdemadropDwonValue': EdemadropDwonValue,
      'Edemaspecify': Edemaspecify,
      'nausea': nausea,
      'vomiting': vomiting,
      'Urinaryfrequency': Urinaryfrequency,
      'fatigue': fatigue,
      'breasttndrness': breasttndrness,
      'Vignaldiscarge': Vignaldiscarge,
      'headache': headache,
      'heartburn': heartburn,
      'faitness': faitness,
      'constipation': constipation,
      'flatulence': flatulence,
      'varicoseviens': varicoseviens,
      'dyspena': dyspena,
      'backache': backache,
      'ankleedma': ankleedma,
      'legCramps': legCramps,
      'hemorrhiods': hemorrhiods,
    });
  }

  // List<String> usersList = [];
  List<Map<String, dynamic>> usersList = [];
  Future<void> fetchNurses() async {
    users.snapshots().listen((event) {
      usersList = [];

      for (var doc in event.docs) {
        var data = doc.data() as Map<String, dynamic>;
        // var names = data['username'];
        var role = data['type'];
        if (role == 'doctor') {
          usersList.add(data);
        }
      }
      print(usersList);
    }).onError((e) {
      print(e.toString());
    });
  }
}
