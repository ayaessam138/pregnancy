import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:intl/intl.dart';
import 'package:pregancy/doctor/weidgetes/alert.dart';
import 'package:pregancy/shared_screen/cache_helper.dart';
part 'patientprofile_state.dart';

class PatientprofileCubit extends Cubit<PatientprofileState> {
  PatientprofileCubit() : super(PatientprofileInitial());
  String? reslut;
  String? birthTime;

  Future<void> GetDeliveryDate() async {
    emit(GetDeliveytimeLoading());
    await FirebaseFirestore.instance
        .collection("users")
        .doc(CacheHelper.getData(key: 'uId'))
        .get()
        .then((value) {
      reslut = value.get('Delvier Time').toString();
    });

    print('====================$reslut');
    DateTime date = DateFormat('M/d/y').parse(reslut!);

    DateTime givenDate = DateTime(date.year, date.month, date.day);
    DateTime currentDate = DateTime.now();

    Duration difference = givenDate.difference(currentDate);
    int differenceInDays = difference.inDays;

    int differenceInMonths = differenceInDays ~/ 30;
    int remainingDays = differenceInDays % 30;

    birthTime =
        'you will deliver your birth in $differenceInMonths/$remainingDays/${date.year}';
    print('====================$birthTime');
    emit(GetDeliveytimeSucess());
    if (birthTime == null || reslut == null) {
      emit(GetDeliveytimeFail());
    }
  }

  DocumentReference profileref = FirebaseFirestore.instance
      .collection("users")
      .doc(CacheHelper.getData(key: 'uId'));
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  updateProfile(context) async {
    emit(UpdateProfileLoading());
    await profileref.update({
      "username": usernameController.text,
      "email": emailController.text,
      "password": passwordController.text,
    }).then((value) async {
      emit(UpdateProfileSucess());
    }).catchError((e) {
      print("$e");

      emit(UpdateProfileFail());
    });
  }

  Future resetEmail(String newEmail) async {
    var message;
    User? firebaseUser = await FirebaseAuth.instance.currentUser;
    firebaseUser!
        .updateEmail(newEmail)
        .then(
          (value) => message = 'Success',
        )
        .catchError((onError) => message = 'error');
    return message;
  }
  getpatientdata(){
    profileref.get().then((value) {
    try {
    usernameController.text = (value.data() as Map)["username"];
    emailController.text = (value.data() as Map)["email"];
  passwordController.text = (value.data() as Map)["password"];
    } catch (e) {}
    });
  }
}
