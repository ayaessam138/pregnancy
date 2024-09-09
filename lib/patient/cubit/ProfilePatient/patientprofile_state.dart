part of 'patientprofile_cubit.dart';

@immutable
abstract class PatientprofileState {}

class PatientprofileInitial extends PatientprofileState {}
class GetDeliveytimeLoading extends PatientprofileState {}
class GetDeliveytimeSucess extends PatientprofileState {}
class GetDeliveytimeFail extends PatientprofileState {}
class UpdateProfileLoading extends PatientprofileState {}
class UpdateProfileSucess extends PatientprofileState {}
class UpdateProfileFail extends PatientprofileState {}