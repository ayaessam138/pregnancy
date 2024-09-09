import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/patient/cubit/kickcounter_cubit/kickcouter_state.dart';

import '../../constants.dart';
import '../../models/kickcount.dart';

class kickcouter extends Cubit<kickcounterstate> {
  kickcouter() : super(kickcounterone());

  CollectionReference kickcounter =
      FirebaseFirestore.instance.collection(kickcountercollection);
  var currentUser = FirebaseAuth.instance;

  void addkick({required String kickcount, required DateTime kicktime}) {
    kickcounter.add({
      'kickcount': kickcount,
      'kicktime': kicktime,
      'uId': currentUser.currentUser!.uid
    });
  }

  List<kickcounts> kickcounstlist = [];
  Future<void> showkicks() async {
    emit(kickcountloading());
    kickcounter
      ..snapshots().listen((event) {
        kickcounstlist = [];
        for (var doc in event.docs) {
          if ((doc.data()! as Map<String, dynamic>)['uId'] ==
              currentUser.currentUser!.uid) {
            kickcounstlist.add(kickcounts
                .fromjson(doc as QueryDocumentSnapshot<Map<String, dynamic>>));
            emit(kickcountsubmitted(kickcountlist: kickcounstlist));
          }
        }
      });
  }

  int kickcounters = 0;

  void increment({required int points}) {
    kickcounters += points;
    emit(kickcounterone());
  }

  void reset() {
    kickcounters = 0;
    emit(kickcountreset());
  }
}
