import 'package:cloud_firestore/cloud_firestore.dart';

class appointments {
  DateTime? time;
  String? id;

  appointments(this.time, this.id);
  appointments.fromjson(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    id = json.id;
    time = json.data()['time'];
  }
}
