part of 'reservation_cubit.dart';

@immutable
abstract class ReservationState {}

class ReservationInitial extends ReservationState {}
class ReservationNamesLoading extends ReservationState {}
class ReservationNamesSucess extends ReservationState {}
class ReservationNamesFail extends ReservationState {}
