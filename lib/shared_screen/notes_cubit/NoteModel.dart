import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class NotesModel {
  final String Titile;
  final String Content;
  final String Userid;
  final String id;

  NotesModel({required this.Titile, required this.Content, required this.Userid, required this.id});
  factory NotesModel.fromjson(
    DocumentSnapshot<Map<String, dynamic>> json,
  ) {
    return NotesModel(Titile: json.data()!['Ttitle'], Content:json .data()!['Content'], Userid: json.data()!['uid'], id: json.id);
  }
  Map<String, dynamic> toJson() {
     Map<String, dynamic> data = new Map<String, dynamic>();
    data  ['Title']=Titile;
    data ['Content']=Content;
    return data;
  }
}
