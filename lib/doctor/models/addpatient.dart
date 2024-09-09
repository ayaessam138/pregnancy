import 'package:cloud_firestore/cloud_firestore.dart';

class addpatient {
  String? patientname;
  String? patientid;
  String? id;

  addpatient(this.patientname, this.patientid, this.id);

  addpatient.fromjson(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    id = json.id;
    patientid = json.data()['Patientid'];
    patientname = json.data()['patientname'];
  }
  // factory addpatient.fromjsoin(jisondata) {
  //   return addpatient(jisondata['patientname'], jisondata['patientid']);
  // }
}
