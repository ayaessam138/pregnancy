part of 'predection_patient_cubit.dart';

@immutable
abstract class PredectionPatientState {}

class PredectionPatientInitial extends PredectionPatientState {}

class PredectionPatientloading extends PredectionPatientState {}

class PredectionPatientsubmiited extends PredectionPatientState {
  List<predectionpatient> predectionlist;
  PredectionPatientsubmiited({required this.predectionlist});
}
