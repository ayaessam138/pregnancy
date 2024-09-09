part of 'appoitments_cubit.dart';

@immutable
abstract class AppoitmentsState {}

class AppoitmentsInitial extends AppoitmentsState {}
class AppoitmentsLoading extends AppoitmentsState {}
class AppoitmentsSucess extends AppoitmentsState {}
class AppoitmentsFail extends AppoitmentsState {
 final String Message;

  AppoitmentsFail({required this.Message});
}
