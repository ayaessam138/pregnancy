import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:pregancy/core/core.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit() : super(ReservationInitial());
  List users = [];

  CollectionReference userref = FirebaseFirestore.instance.collection('users');

  // Map<String, dynamic>? userItem = {};
  List<DateTime> reservationAvailableTimes = [];
  int countAvailableTimes = 0;
  int detectionTime = 30;

  DateTime? selectedTime;
  String? doctoruserid;
  String? patientid;
  String? patientName;
  var responsebody;

  getReservationNames({required String Role}) async {
    try {
      emit(ReservationNamesLoading());
      responsebody = await userref.get();
      print('Nurses');

      users.clear();
      responsebody.docs.forEach((element) {
        if (element["type"] == Role) {
          users.add(element.data());
        }
      });
      emit(ReservationNamesSucess());

      print(users);
    } on Exception catch (e) {
      print(e.toString());
      emit(ReservationNamesFail());
    }
  }

  DateTime? startTime;
  DateTime? endTime;
  // DetectRservationsofDoctor({ required String StartTime ,required String endtime}) {
  //   print('startTime');
  //
  //
  //     print('startTime');
  //     startTime = DateTime.parse(StartTime);
  //     endTime = DateTime.parse(endtime);
  //    // endTime = DateTime.parse(responsebody.docs!["${getToDayName()} to"]);
  //     print('startTimettttttttttt');
  //     print(startTime);
  //
  //   if (startTime != null && endTime != null) {
  //     print('object');
  //     calcTime(startTime!, endTime!);
  //   }
  //   else{
  //     print('calcTime');
  //   }
  // }
  DetectRservationsofDoctor({
    required String StartTime,
    required String endtime,
  }) {
    print('startTime');

    try {
      // Check if the strings are not empty before parsing
      if (StartTime.toString().isNotEmpty && endtime.toString().isNotEmpty) {
        startTime = DateTime.parse(StartTime);
        endTime = DateTime.parse(endtime);
        print('pasred');
        print(startTime);
        print(endtime);

        if (startTime != null && endTime != null) {
          print('calcTimedDone');
          calcTime(startTime!, endTime!);
        } else {
          print('calcTime');
        }
      } else {
        print('Empty start time or end time');
      }
    } catch (e) {
      print('Error parsing date: $e');
    }
  }

  calcTime(DateTime startDate, DateTime endDate) {
     reservationAvailableTimes.clear();
    print("fsdfvdfghg" + startDate.toString() + " " + endDate.toString());
    int hours = endDate.hour - startDate.hour;
    print('hours');
    print(hours);
    double timeInHour = 60 / detectionTime;
    int totalSessions = timeInHour.round() * hours;
    print('totalSessions');
    print(totalSessions);
    for (int i = 0; i < totalSessions; i++) {
      DateTime sessionTime =
          startDate.add(Duration(minutes: detectionTime * i));
      if (sessionTime.isBefore(endDate)) {
        reservationAvailableTimes.add(sessionTime);
        print('reservcationAvailableTimes');
        print(reservationAvailableTimes);
      }
    }

    reservationAvailableTimes.forEach((e) {
      print(e.toString());
    });
  }
List TimesreservedList=[];

  TimesReserved({required String Doctorid}) async {
    var ref = FirebaseFirestore.instance
        .collection('doctor_reservations')
        .where("doctorid", isEqualTo: Doctorid);

    TimesreservedList = [];

    var responsebody = await ref.get();

    responsebody.docs.forEach((element) {
      TimesreservedList = responsebody!.docs
          .map((e) =>
          DateTime.parse(
              (e.data() as Map<String, dynamic>)["time"]
                  .toString()))
          .toList();
    });
    print('TimesOfbooking');
    print(TimesreservedList);
  }
// //nurse
// // FirebaseFirestore.instance
// //     .collection('doctor_reservations')
// // .where("doctorid", isEqualTo: userItem!['userid'])
// //     .snapshots(),
// // builder: (context, snapshot) {
// // List<DateTime> data = [];
// // if (snapshot.data != null) {
// // data = snapshot.data!.docs
// //     .map((e) => DateTime.parse(
// // (e.data() as Map<String, dynamic>)["time"]
// //     .toString()))
// //     .toList();
// // }}
//   }}
}
