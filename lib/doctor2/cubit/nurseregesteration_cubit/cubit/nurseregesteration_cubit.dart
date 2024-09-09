import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pregancy/doctor2/models/nurseregesteration.dart';
import 'package:pregancy/shared_screen/cache_helper.dart';

import '../../../constant.dart';

part 'nurseregesteration_state.dart';

class NurseregesterationCubit extends Cubit<NurseregesterationState> {
  NurseregesterationCubit() : super(NurseregesterationInitial());
  CollectionReference nurseregesteration =
      FirebaseFirestore.instance.collection(knurseregesterationcollection);

  var currentUser = FirebaseAuth.instance;
  void submitNurseform(
      {required String university,
      required String graduationYear,
      required String clinicLocation,
      required String ticketPrice}) {
    nurseregesteration.add({
      'uId': currentUser.currentUser!.uid,
      'university': university,
      'graduationYear': graduationYear,
      'clinicLocation': clinicLocation,
      'ticketPrice ': ticketPrice
    }).catchError((e) {
      print(e.toString());
    }).then(
      (value) => print(value),
    );
  }

  TextEditingController universityController = TextEditingController();
  TextEditingController graduationYearController = TextEditingController();
  TextEditingController clinicLocationController = TextEditingController();
  TextEditingController ticketPriceController = TextEditingController();
  final DocumentReference registrationref = FirebaseFirestore.instance
      .collection("users")
      .doc(CacheHelper.getData(key: 'uId'));

  String dropdownValue = 'Saturday';

  void getnursedata() {
    emit(GetNurseDataloading());
    registrationref.get().then((value) {
      print('bbbbbb');
      try {
        if (value.exists) {
          Map<String, dynamic>? dataMap = value.data() as Map<String, dynamic>?;
          print('dataMap');
          print(dataMap);
          bool universityKeyExists = dataMap!.keys.any((key) => key == "University");
          if (universityKeyExists) {
            print('universityKeyExists');
            print(universityKeyExists);
            print(value['University']);
            universityController.text = (value.data() as Map)["University"];
            graduationYearController.text =
            (value.data() as Map)["Graduation Year"];
            clinicLocationController.text =
            (value.data() as Map)["Clinic Location"];
            ticketPriceController.text = (value.data() as Map)["Ticket Price"];
            print(universityController.text);
            print(graduationYearController.text);
            print(clinicLocationController.text);
            print(ticketPriceController.text);
            emit(GetNurseDataSucess());
          }
        }
       else{
         print('yyyyyyyy');
          emit(GetNurseDataFail(Message: 'e.toString())'));
       }
      } catch (e) {
        print('objectoooo');
        print(  universityController.text );
        print(  graduationYearController.text );
        print(  clinicLocationController.text );
        print(  ticketPriceController.text );
        emit(GetNurseDataFail(Message: 'e.toString()'));
        throw e;
      }
    });
  }

  addNurseRegistration() async {
    emit(addNurseRegistrationloading());
    await registrationref.update({
      "University": universityController.text,
      "Graduation Year": graduationYearController.text,
      "Clinic Location": clinicLocationController.text,
      "Ticket Price": ticketPriceController.text,
    }).then((value) {
      emit(addNurseRegistrationSucess());
    }).catchError((e) {
      emit(addNurseRegistrationFail(Message: e.toString()));
    });

  }
}
