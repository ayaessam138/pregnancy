part of 'pregancyform_cubit.dart';

@immutable
abstract class PregancyformState {}

class PregancyformInitial extends PregancyformState {}

class Pregancyformloading extends PregancyformState {}

class pregancyformsubitted extends PregancyformState {
  List<pregancyformmodel> pregnancyformlist;
  pregancyformsubitted({required this.pregnancyformlist});
}

class pregnacyformsearch extends PregancyformState {
  List<pregancyformmodel>? pregnancy;
  pregnacyformsearch({required this.pregnancy});
}

// class pregancyformpredction extends PregancyformState {
//   predectionpatient predection;
//   pregancyformpredction({required this.predection});
// }
