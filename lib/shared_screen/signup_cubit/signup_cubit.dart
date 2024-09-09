import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:intl/intl.dart';
import 'package:pregancy/shared_screen/cache_helper.dart';
part 'signup_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  TextEditingController myusername = TextEditingController();
  TextEditingController mypassword = TextEditingController();
  TextEditingController myemail = TextEditingController();

  //  String ?myemail,mypassword;
  TextEditingController Age = TextEditingController();
  TextEditingController lastPeriod = TextEditingController();
  TextEditingController DelvierTime = TextEditingController();
  DateTime date = DateTime.now();
  DateTime newDate = DateTime.now();
  DateTime lastPerioddate = DateTime.now();
  DateTime lastPeriodnewDate = DateTime.now();
  String type = "patient";

  Future<void> createuser(
      {required String email, required String password}) async {
    emit(Registerloading());
    try {
      var auth = FirebaseAuth.instance;
      UserCredential response = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print('response');
      print(response);

      if (response != null) {
        print("===================null");
        var patientData = {
          "username": myusername.text,
          "email": myemail.text,
          "age": Age.text,
          "type": type,
          "last pariod": lastPeriod.text,
          "Delvier Time": calculateDeliverTime(
              lastPerioddate.year, lastPerioddate.month, lastPerioddate.day),
          // "userid": FirebaseAuth.instance.currentUser?.uid,
          "userid": response.user!.uid,
        };
        var doctorData = {
          "username": myusername.text,
          "email": myemail.text,
          // "age": Age.text.toString(),
          "type": type, // "userid": FirebaseAuth.instance.currentUser?.uid,
          "userid": response.user!.uid,
        };
        var nurseData = {
          "username": myusername.text,
          "email": myemail.text,
          // "age": Age.text.toString(),
          "type": type, // "userid": FirebaseAuth.instance.currentUser?.uid,
          "userid": response.user!.uid,
        };
        await FirebaseFirestore.instance
            .collection("users")
            .doc('${response.user!.uid}')
            .set(type == "doctor"
                ? doctorData
                : type == 'nurse'
                    ? nurseData
                    : patientData)
            .then((value) async {
          await FirebaseFirestore.instance
              .collection('users')
              .doc('${response.user!.uid}')
              .get()
              .then((value) {
            email = value.get('email');
          });
        });
        CacheHelper.saveData(key: 'type', value: type);
        CacheHelper.saveData(key: 'uidSignup', value: response.user!.uid);
        CacheHelper.saveData(key: 'email', value: email);
        CacheHelper.saveData(key: 'myusername', value: myusername.text);
        //3shan al analysis lw awl mara y3ml sign up w hyrf3 sora

        // value.update({"userid": value.id});
        //
        // if (type == "doctor") {
        //   // doctorData["userid"] = value.id;
        //   CacheHelper.saveData(
        //       key: 'uId', value: response.user!.uid);
        //
        //   doctorData["userid"] = response.user!.uid;
        //   StorageRepoImpl().write(
        //       key: StorageKeys.userdata,
        //       value: json.encode(doctorData));
        //   globalData.userData = doctorData;
        //
        //   Navigator.of(context).pushNamedAndRemoveUntil(
        //       homepage.homeid, (route) => false);
        // }
        // else if (type == 'nurse') {
        //   CacheHelper.saveData(
        //       key: 'uId', value: response.user!.uid);
        //   nurseData["userid"] = response.user!.uid;
        //   StorageRepoImpl().write(
        //       key: StorageKeys.userdata,
        //       value: json.encode(nurseData));
        //   globalData.userData = nurseData;
        //   await FirebaseFirestore.instance
        //       .collection('users')
        //       .doc(user!['userid'])
        //       .update({'nurseid': response.user!.uid});
        //   Navigator.of(context).pushNamedAndRemoveUntil(
        //       homepagenurse.homenursepageid,
        //       (route) => false);
        // }
        // else {
        //   //  patientData["userid"] = value.id;
        //   CacheHelper.saveData(
        //       key: 'uId', value: response.user!.uid);
        //   patientData["userid"] = response.user!.uid;
        //   StorageRepoImpl().write(
        //       key: StorageKeys.userdata,
        //       value: json.encode(patientData));
        //   globalData.userData = patientData;
        //
        //   Navigator.of(context).pushNamedAndRemoveUntil(
        //       homePatient.homeid, (route) => false);
        // }

        print("===================");
      }
      emit(Registersucess());
      myusername.clear();
      lastPeriod.clear();
      myemail.clear();
      mypassword.clear();
      Age.clear();
      DelvierTime.clear();
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(Registerfail(errorMessage: 'user not found'));
      } else if (ex.code == 'wrong-password') {
        emit(Registerfail(errorMessage: 'wrongpassword'));
      } else if (ex.code == 'email-already-in-use') {
        emit(Registerfail(
            errorMessage:
                'The email address is already in use by another account'));
      }
    } catch (e) {
      emit(Registerfail(errorMessage: e.toString()));
      print(e.toString());
      throw e;
    }
  }

  void ChangeState() {
    emit(SaveUserType());
    print('emit(SaveUserType());');
  }
}

String calculateDeliverTime(year, month, day) {
  DateTime initialDate = DateTime(year, month, day);
  int numberOfDays = 252;

  DateTime resultDate = initialDate.add(Duration(days: numberOfDays));

  String formattedDate = DateFormat('MM/dd/yyyy').format(resultDate);
  return formattedDate;
}
