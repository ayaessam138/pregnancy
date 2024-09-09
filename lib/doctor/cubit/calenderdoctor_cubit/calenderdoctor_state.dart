part of 'calenderdoctor_cubit.dart';

@immutable
abstract class CalenderdoctorState {}

class CalenderdoctorInitial extends CalenderdoctorState {}

class Calenderloading extends CalenderdoctorState {}

class Calendersubitted extends CalenderdoctorState {
  MyEvents? eventlist;
  Calendersubitted({required this.eventlist});
}
