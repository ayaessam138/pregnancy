import 'package:cloud_firestore/cloud_firestore.dart';

class predectionpatient {
  String? Age;
  DateTime? time;
  String? SysBp;
  String? DiaBp;
  String? BloodSugar;
  String? BodyTemperature;
  String? HeartRate;
  String? uid;
  String? email;
  String? predction;
  predectionpatient({
    this.uid,
    this.email,
    this.time,
    this.Age,
    this.SysBp,
    this.DiaBp,
    this.BloodSugar,
    this.BodyTemperature,
    this.HeartRate,
    this.predction
  });
  predectionpatient.fromjson(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    time = json.data()['time'].toDate();
    email = json.data()['email'];
    uid = json.data()['uId'];
    Age = json.data()['Age'];
    SysBp = json.data()['SysBp'];
    DiaBp = json.data()['DiaBp'];
    BloodSugar = json.data()['BloodSugar'];
    BodyTemperature = json.data()['BodyTemperature'];
    HeartRate = json.data()['HeartRate'];
    predction = json.data()['prediction'];
  }
}
