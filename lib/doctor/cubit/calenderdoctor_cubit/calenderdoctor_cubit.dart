import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:pregancy/doctor/constants.dart';
import 'package:pregancy/doctor/screens/calander.dart';

part 'calenderdoctor_state.dart';

class CalenderdoctorCubit extends Cubit<CalenderdoctorState> {
  CalenderdoctorCubit() : super(CalenderdoctorInitial());
  CollectionReference Calender =
      FirebaseFirestore.instance.collection(kcalenderdoctorcollection);
  var currentUser = FirebaseAuth.instance;
  void addevent(
      {required DateTime eventdate,
      required String eventTitle,
      required String eventDescp}) {
    Calender.add({
      'eventTitle': eventTitle,
      'eventDescp': eventDescp,
      'eventdate': eventdate,
      'uId': currentUser.currentUser!.uid
    });
  }

  Future<void> showevents({required DateTime eventdate}) async {
    MyEvents? events;

    emit(Calenderloading());
    await Calender.where('eventdate', isEqualTo: eventdate).get().then((value) {
      for (var doc in value.docs) {
        if ((doc.data()! as Map<String, dynamic>)['uId'] ==
            currentUser.currentUser!.uid) {
          events = MyEvents.fromjson(doc.data() as Map<String, dynamic>);
          emit(Calendersubitted(eventlist: events));
        }
      }
    }).catchError((onError) {
      print(onError.toString());
    });
  }
}
