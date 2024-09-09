import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../models/appointment.dart';

part 'appiotments_state.dart';

class AppiotmentsCubit extends Cubit<AppiotmentsState> {
  AppiotmentsCubit() : super(AppiotmentsInitial());
  CollectionReference reservations =
      FirebaseFirestore.instance.collection('doctor reservation');
}
