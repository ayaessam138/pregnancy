import '../../models/kickcount.dart';

abstract class kickcounterstate {}

class kickcounterone extends kickcounterstate {}

class kickcountloading extends kickcounterstate {}

class kickcountreset extends kickcounterstate {}

class kickcountsubmitted extends kickcounterstate {
  List<kickcounts>? kickcountlist;
  kickcountsubmitted({required this.kickcountlist});
}
