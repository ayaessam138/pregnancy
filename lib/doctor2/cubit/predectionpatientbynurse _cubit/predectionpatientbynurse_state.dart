part of 'predectionpatientbynurse_cubit.dart';

@immutable
abstract class PredectionpatientbynurseState {}

class PredectionpatientbynurseInitial extends PredectionpatientbynurseState {}

class Predectionpatientbynurseloading extends PredectionpatientbynurseState {}

class Predectionpatientbynursesubmitted extends PredectionpatientbynurseState {
  List<predectionpatientbynursemodel>? predectionlist;
  Predectionpatientbynursesubmitted({required this.predectionlist});
}
