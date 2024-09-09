part of 'calender_cubit.dart';

@immutable
abstract class CalenderState {}

class CalenderInitial extends CalenderState {}

class Calenderloading extends CalenderState {}

class Calendersubitted extends CalenderState {
  MyEvents? eventlist;
  Calendersubitted({required this.eventlist});
}
