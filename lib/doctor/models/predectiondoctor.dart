import 'package:cloud_firestore/cloud_firestore.dart';

class predectiondoctor {
  String? docid;
  DateTime? time;
  String? email;
  String? Age;
  String? FamHisto;
  String? ChronicHtn;
  String? ChronicDiabetes;
  String? BMI;
  String? SysBp;
  String? DiaBp;
  String? Hb;
  String? Hematocrit;
  String? MCH;
  String? MCHC;
  String? MCV;
  String? Platelet;
  String? SerumCreatinine;
  String? HDL;

  // String? BloodSugar;
  // String? BodyTemperature;
  // String? HeartRate;

  predectiondoctor(
    this.docid,
    this.time,
    this.email,
    this.Age,
    this.FamHisto,
    this.ChronicHtn,
    this.ChronicDiabetes,
    this.BMI,
    this.SysBp,
    this.DiaBp,
    this.Hb,
    this.Hematocrit,
    this.MCH,
    this.MCHC,
    this.MCV,
    this.Platelet,
    this.SerumCreatinine,
    this.HDL,

    // this.BloodSugar,
    // this.BodyTemperature,
    // this.HeartRate,
  );
  predectiondoctor.fromjson(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    docid = json.id;
    time = json.data()['time'].toDate();
    email = json.data()['email'];
    Age = json.data()['Age'];
    FamHisto = json.data()['FamHisto'];
    ChronicHtn = json.data()['ChronicHtn'];
    ChronicDiabetes = json.data()['ChronicDiabetes'];
    BMI = json.data()['BMI'];
    SysBp = json.data()['SysBp'];
    DiaBp = json.data()['DiaBp'];
    Hb = json.data()['Hb'];
    Hematocrit = json.data()['Hematocrit'];
    MCH = json.data()['MCH'];
    MCHC = json.data()['MCHC'];
    MCV = json.data()['MCV'];
    Platelet = json.data()['Platelet'];
    SerumCreatinine = json.data()['SerumCreatinine'];
    HDL = json.data()['HDL'];

    // BloodSugar = json.data()['BloodSugar'];
    // BodyTemperature = json.data()['BodyTemperature'];
    // HeartRate = json.data()['HeartRate'];
  }
}
