part of 'predictionDoctor_cubit.dart';

@immutable
abstract class PredictionDoctorState {}

class PredictionDoctorInitial extends PredictionDoctorState {}

class PredictionDoctorloading extends PredictionDoctorState {}

class PredictionDoctorsubmitted extends PredictionDoctorState {
  List<predectiondoctor>? predectionlist;
  PredictionDoctorsubmitted({required this.predectionlist});
}
