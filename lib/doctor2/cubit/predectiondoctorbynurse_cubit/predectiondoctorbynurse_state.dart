part of 'predectiondoctorbynurse_cubit.dart';

@immutable
abstract class PredectiondoctorbynurseState {}

class PredectiondoctorbynurseInitial extends PredectiondoctorbynurseState {}

class Predectiondoctorbynurseloading extends PredectiondoctorbynurseState {}

class Predectiondoctorbynursesubmitted extends PredectiondoctorbynurseState {
  List<predectiondoctorbynursemodel>? predectionlist;
  Predectiondoctorbynursesubmitted({required this.predectionlist});
}
