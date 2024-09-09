import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:pregancy/shared_screen/cache_helper.dart';

part 'appoitments_state.dart';

class AppoitmentsCubit extends Cubit<AppoitmentsState> {
  AppoitmentsCubit() : super(AppoitmentsInitial());
  List<ClinReservations> AppointmentsList = [];
  var curentuser = FirebaseAuth.instance;

  void getAppointments() async {
    try {
      emit(AppoitmentsLoading());

      var Appiontmentsref = await FirebaseFirestore.instance
          .collection('doctor_reservations')
          .where("doctorid", isEqualTo: CacheHelper.getData(key: 'uId'))
          .get();
      print('Appiontmentsref');
      print(Appiontmentsref);

      Appiontmentsref.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data();
        print('data');
        print(data);

        ClinReservations appointment = ClinReservations.fromjson(data);

        AppointmentsList.add(appointment);
      });

      print('c');
      print(AppointmentsList);
      emit(AppoitmentsSucess());
    } on Exception catch (e) {
      emit(AppoitmentsFail(Message: e.toString()));
    }
  }

//   void getAppointments() async {
//     try {
//       emit(AppoitmentsLoading());
//
//       Appiontmentsref = await FirebaseFirestore.instance
//           .collection('doctor_reservations')
//           .where("doctorid", isEqualTo: CacheHelper.getData(key: 'uId'))
//           .get();
//       print('Appiontmentsref');
//       print(Appiontmentsref);
//       AppointmentsList = Appiontmentsref.docs
//           .map((doc) => ClinReservations.fromjson(doc))
//           .toList();
//
//       print('c');
//       print(AppointmentsList);
//       emit(AppoitmentsSucess());
//     } on Exception catch (e) {
//       emit(AppoitmentsFail(Message: e.toString()));
//     }
//   }
// }
// predictionPatientbynurse.snapshots().listen((event) {
// predectionlist = [];
// print (  'predectionlist');
// for (var doc in event.docs) {
// if ((doc.data()! as Map<String, dynamic>)['uId'] ==
// curentuser.currentUser!.uid) {
// predectionlist.add(predectionpatientbynursemodel
//     .fromjson((doc as QueryDocumentSnapshot<Map<String, dynamic>>)));
// }
// }
// print (  predectionlist);
// emit(Predectionpatientbynursesubmitted(predectionlist: predectionlist));
// }).onError((e) {
// print(e.toString());
// });
//
// List AppointmentsList = [];
// var AppiontmentsObj;
// void getAppointments() async {
// try {
// emit(AppoitmentsLoading());

// AppiontmentsObj = await FirebaseFirestore.instance
//     .collection('doctor_reservations')
//     .where("doctorid", isEqualTo: CacheHelper.getData(key: 'uId'))
//     .get();
//
// AppointmentsList = AppiontmentsObj.docs
//     .map((doc) => doc.data() as Map<String, dynamic>)
//     .toList();
//
// print('c');
// print(AppointmentsList);
//
// emit(AppoitmentsSucess());
// } on Exception catch (e) {
// emit(AppoitmentsFail(Message: e.toString()));
// }
// }
//
// }

// class ClinReservations {
//   String? doctorid;
//   String? time;
//   String? userid;
//   String? username;
//   ClinReservations({this.doctorid, this.time, this.userid, this.username});
//
//   ClinReservations.fromjson(QueryDocumentSnapshot<Map<String, dynamic>> json) {
//     doctorid = json.data()['doctorid'];
//     time = json.data()['time'];
//     userid = json.data()['userid'];
//     username = json.data()['username'];
//   }
// }
}

class ClinReservations {
  String? doctorid;
  String? time;
  String? userid;
  String? username;

  ClinReservations({this.doctorid, this.time, this.userid, this.username});

  factory ClinReservations.fromjson(Map<String, dynamic> json) {
    return ClinReservations(
      doctorid: json['doctorid'],
      time: json['time'],
      userid: json['userid'],
      username: json['username'],
    );
  }
}
