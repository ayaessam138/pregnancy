part of 'predectionpatientbydoctor_cubit.dart';

@immutable
abstract class PredectionpatientbydoctorState {}

class PredectionpatientbydoctorInitial extends PredectionpatientbydoctorState {}

class Predictionpatientbydoctorloading extends PredectionpatientbydoctorState {}

class Predictionpatientbydoctorsubmitted
    extends PredectionpatientbydoctorState {
  List<predectionpatientbydoctor>? predectionlist;
  Predictionpatientbydoctorsubmitted({required this.predectionlist});
}
