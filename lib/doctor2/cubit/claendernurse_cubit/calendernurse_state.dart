part of 'calendernurse_cubit.dart';

@immutable
abstract class CalendernurseState {}

class CalendernurseInitial extends CalendernurseState {}

class Calendernurseloading extends CalendernurseState {}

class Calendernursesubitted extends CalendernurseState {
  MyEvents? eventlist;
  Calendernursesubitted({required this.eventlist});
}
