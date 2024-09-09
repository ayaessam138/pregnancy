part of 'nurseregesteration_cubit.dart';

@immutable
abstract class NurseregesterationState {}

class NurseregesterationInitial extends NurseregesterationState {}

class Nurseregesterationloading extends NurseregesterationState {}

class Nurseregesterationsubmitted extends NurseregesterationState {
  List<nurseregesteration> Nurseregesteration;
  Nurseregesterationsubmitted({required this.Nurseregesteration});
}
class GetNurseDataloading extends NurseregesterationState {}
class GetNurseDataSucess extends NurseregesterationState {}
class GetNurseDataFail extends NurseregesterationState {
 final String Message;

  GetNurseDataFail({required this.Message});
}class addNurseRegistrationloading extends NurseregesterationState {}
class addNurseRegistrationSucess extends NurseregesterationState {}
class addNurseRegistrationFail extends NurseregesterationState {
  final String Message;

  addNurseRegistrationFail({required this.Message});
}