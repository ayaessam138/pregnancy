part of 'appiotments_cubit.dart';

@immutable
abstract class AppiotmentsState {}

class AppiotmentsInitial extends AppiotmentsState {}

class Appiotmentsreserved extends AppiotmentsState {
  List<appointments> appointmentslist;
  Appiotmentsreserved({required this.appointmentslist});
}
