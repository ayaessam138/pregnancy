import 'package:cloud_firestore/cloud_firestore.dart';

class getimage {
  String? imagename;
  String? imageurl;
  String? email;

  getimage(this.email, this.imageurl);

  getimage.fromjson(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    imageurl = json.data()['url'];
    email = json.data()['email'];
    imagename = json.data()['name'];
  }
}
