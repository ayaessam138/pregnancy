part of 'upolad_analysis_cubit.dart';

@immutable
abstract class UpoladAnalysisState {}

class UpoladAnalysisInitial extends UpoladAnalysisState {}
class ImageSelectedSucess extends UpoladAnalysisState {}
class UploadImageSucess extends UpoladAnalysisState {}
class GetUpoladAnalysisLoading extends UpoladAnalysisState {}
class GetUpoladAnalysisSucess extends UpoladAnalysisState {}
class GetUpoladAnalysisFail extends UpoladAnalysisState {
 final String Message;

  GetUpoladAnalysisFail({required this.Message});
}
