import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class kickcounts {
  String? kickcount;
  String? id;
  DateTime? kicktime;
  kickcounts({this.id, this.kickcount, this.kicktime});
  kickcounts.fromjson(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    id = json.id;
    kickcount = json.data()['kickcount'];
    kicktime = json.data()['kicktime'].toDate();
    DateFormat('yyyy-MM-dd – kk:mm').format(kicktime!);
    // DateTime.fromMillisecondsSinceEpoch((kicktime! * 1000));
  }
}
