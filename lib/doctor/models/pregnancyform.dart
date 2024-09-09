import 'package:cloud_firestore/cloud_firestore.dart';

class pregancyformmodel {
  String? name;
  String? patientid;
  String? email;
  String? docid;
  String? Age;
  String? Ageatmarriage;
  String? adress;
  String? husbandage;
  String? LevelOfEducation;
  String? Habit;
  String? Ocuppation;
  String? HusbandHabit;
  String? HusbandOcuppation;
  String? AgeofMenarche;
  String? DurationofMenses;
  String? IntervalofCycle;
  String? FallTermPregancy;
  String? Pretermpregancy;
  String? Abortion;
  String? LiveBabies;
  String? BloodGroup;
  String? RhFactor;
  String? TORCH;
  String? Sugar;
  String? Ketone;
  String? uss;
  String? Height;
  String? Weight;
  String? PrePregancyBodyMassIndex;
  String? BloodPressure;
  String? Pluse;

  String? HeadNeckdropdown;
  String? headneckspecify;
  String? BreastsNipplesdropDwonValue;
  String? BreastsNipplesspeficy;
  String? ChestdropDwonValue;
  String? Chestspecify;
  String? TeethGumsdropDwonValue;
  String? TeethGumsspecify;
  String? HeartdropDwonValue;
  String? Heartspecify;
  String? AbdomendropDwonValue;
  String? Abdomenspecify;
  String? BackbonedropDwonValue;
  String? Backbonespecify;
  String? varicositiesExtremitiesValue;
  String? varicositiesExtremitiesspecify;
  String? EdemadropDwonValue;
  String? Edemaspecify;

  String? nausea;
  String? vomiting;
  String? Urinaryfrequency;
  String? fatigue;
  String? breasttndrness;
  String? Vignaldiscarge;
  String? headache;

  String? heartburn;
  String? faitness;
  String? constipation;
  String? flatulence;
  String? varicoseviens;

  String? dyspena;
  String? backache;
  String? ankleedma;
  String? legCramps;
  String? hemorrhiods;

  pregancyformmodel(
    this.name,
    this.patientid,
    this.email,
    this.docid,
    this.Age,
    this.Ageatmarriage,
    this.adress,
    this.husbandage,
    this.LevelOfEducation,
    this.Ocuppation,
    this.Habit,
    this.HusbandHabit,
    this.HusbandOcuppation,
    this.AgeofMenarche,
    this.DurationofMenses,
    this.IntervalofCycle,
    this.FallTermPregancy,
    this.Pretermpregancy,
    this.Abortion,
    this.LiveBabies,
    this.BloodGroup,
    this.RhFactor,
    this.TORCH,
    this.Sugar,
    this.Ketone,
    this.uss,
    this.Height,
    this.Weight,
    this.PrePregancyBodyMassIndex,
    this.BloodPressure,
    this.Pluse,
    this.HeadNeckdropdown,
    this.headneckspecify,
    this.BreastsNipplesdropDwonValue,
    this.BreastsNipplesspeficy,
    this.ChestdropDwonValue,
    this.Chestspecify,
    this.TeethGumsdropDwonValue,
    this.TeethGumsspecify,
    this.HeartdropDwonValue,
    this.Heartspecify,
    this.AbdomendropDwonValue,
    this.Abdomenspecify,
    this.BackbonedropDwonValue,
    this.Backbonespecify,
    this.varicositiesExtremitiesValue,
    this.varicositiesExtremitiesspecify,
    this.EdemadropDwonValue,
    this.Edemaspecify,
    this.nausea,
    this.vomiting,
    this.Urinaryfrequency,
    this.fatigue,
    this.breasttndrness,
    this.Vignaldiscarge,
    this.headache,
    this.heartburn,
    this.faitness,
    this.constipation,
    this.flatulence,
    this.varicoseviens,
    this.dyspena,
    this.backache,
    this.ankleedma,
    this.legCramps,
  );
  pregancyformmodel.fromjson(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    docid = json.id;
    name = json.data()['name'] ?? '';

    patientid = json.data()['patientid'] ?? '';
    email = json.data()['email'] ?? '';
    Age = json.data()['Age'] ?? '';
    Ageatmarriage = json.data()['Ageatmarriage'] ?? '';
    adress = json.data()['adress'] ?? '';
    husbandage = json.data()['husbandage'] ?? '';
    LevelOfEducation = json.data()['LevelOfEducation'] ?? '';
    Ocuppation = json.data()['Ocuppation'] ?? '';
    Habit = json.data()['Habit'] ?? '';
    HusbandHabit = json.data()['HusbandHabit'] ?? '';
    HusbandOcuppation = json.data()['HusbandOcuppation'] ?? '';
    AgeofMenarche = json.data()['AgeofMenarche'] ?? '';
    DurationofMenses = json.data()['DurationofMenses'] ?? '';
    IntervalofCycle = json.data()['IntervalofCycle'] ?? '';
    FallTermPregancy = json.data()['FallTermPregancy'] ?? '';
    Pretermpregancy = json.data()['Pretermpregancy'] ?? '';
    Abortion = json.data()['Abortion'] ?? '';
    LiveBabies = json.data()['LiveBabies'] ?? '';
    BloodGroup = json.data()['BloodGroup'] ?? '';
    RhFactor = json.data()['RhFactor'] ?? '';
    TORCH = json.data()['TORCH'] ?? '';
    Sugar = json.data()['Sugar'] ?? '';
    Ketone = json.data()['Ketone'] ?? '';
    uss = json.data()['uss'] ?? '';
    Height = json.data()['Height'] ?? '';
    Weight = json.data()['Weight'] ?? '';
    PrePregancyBodyMassIndex = json.data()['PrePregancyBodyMassIndex'] ?? '';
    BloodPressure = json.data()['BloodPressure'] ?? '';
    Pluse = json.data()['Pluse'] ?? '';
    HeadNeckdropdown = json.data()['HeadNeckdropdown'] ?? '';
    headneckspecify = json.data()['headneckspecify'] ?? '';
    BreastsNipplesdropDwonValue =
        json.data()['BreastsNipplesdropDwonValue'] ?? '';
    BreastsNipplesspeficy = json.data()['BreastsNipplesspeficy'] ?? '';
    ChestdropDwonValue = json.data()['ChestdropDwonValue'] ?? '';
    Chestspecify = json.data()['Chestspecify'] ?? '';
    TeethGumsdropDwonValue = json.data()['TeethGumsdropDwonValue'] ?? '';
    TeethGumsspecify = json.data()['TeethGumsspecify'] ?? '';
    HeartdropDwonValue = json.data()['HeartdropDwonValue'] ?? '';
    Heartspecify = json.data()['Heartspecify'] ?? '';
    AbdomendropDwonValue = json.data()['AbdomendropDwonValue'] ?? '';
    Abdomenspecify = json.data()['Abdomenspecify'] ?? '';
    BackbonedropDwonValue = json.data()['BackbonedropDwonValue'] ?? '';
    Backbonespecify = json.data()['Backbonespecify'] ?? '';
    varicositiesExtremitiesValue =
        json.data()['varicositiesExtremitiesValue'] ?? '';
    varicositiesExtremitiesspecify =
        json.data()['varicositiesExtremitiesspecify'] ?? '';
    EdemadropDwonValue = json.data()['EdemadropDwonValue'] ?? '';
    Edemaspecify = json.data()['Edemaspecify'] ?? '';
    nausea = json.data()['nausea'] ?? '';
    vomiting = json.data()['vomiting'] ?? '';
    Urinaryfrequency = json.data()['Urinaryfrequency'] ?? '';
    fatigue = json.data()['fatigue'] ?? '';
    breasttndrness = json.data()['breasttndrness'] ?? '';
    Vignaldiscarge = json.data()['Vignaldiscargeme'] ?? '';
    headache = json.data()['headache'] ?? '';
    heartburn = json.data()['heartburn'] ?? '';
    faitness = json.data()['faitness'] ?? '';
    constipation = json.data()['constipation'] ?? '';
    flatulence = json.data()['flatulence'] ?? '';
    varicoseviens = json.data()['varicoseviens'] ?? '';
    dyspena = json.data()['dyspena'] ?? '';
    backache = json.data()['backache'] ?? '';
    ankleedma = json.data()['ankleedma'] ?? '';
    legCramps = json.data()['legCramps'];
    hemorrhiods == json.data()['hemorrhiods'] ?? '';
  }
}
