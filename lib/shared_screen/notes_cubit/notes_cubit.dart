import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pregancy/patient/HomePatientscrrens/notes/EditNotes.dart';
import 'package:pregancy/shared_screen/cache_helper.dart';
import 'package:pregancy/shared_screen/notes_cubit/NoteModel.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  CollectionReference notesref = FirebaseFirestore.instance.collection("notes");
  TextEditingController Title = TextEditingController();
  TextEditingController Content = TextEditingController();


  List<NotesModel> NotesList = [];
  var currentUser = FirebaseAuth.instance;

  Future<void> GetNotes() async {
    try {
      emit(GetNotesLoading());
      await notesref.snapshots().listen((event) {
        NotesList = [];
        NotesList.clear();
        for (var doc in event.docs) {
          if ((doc.data()! as Map<String, dynamic>)['uid'] ==
              currentUser.currentUser!.uid) {
            NotesList.add(NotesModel.fromjson(
                doc as QueryDocumentSnapshot<Map<String, dynamic>>));
            print('NotesList');
            print(NotesList);
            emit(GetNotesSucess());
          }
        }
      });
    } catch (e) {
      print(e.toString());
      emit(GetNotesFail(Message: e.toString()));
    }
  }

  Future<void> addNotes(
      {required String Ttitle,
      required String Content,
      required String uid}) async {
    try {
      emit(AddNotesLoading());

      await notesref.add({"Ttitle": Ttitle, "Content": Content, "uid": uid});
      emit(AddNotesSucess());
    } catch (e) {
      print(e.toString());
      emit(AddNotesFail(Message: e.toString()));
      throw e;
    }
  }

  DeleteNote(docid) async {
    try {
      await notesref.doc(docid).delete().then((Value) {
        print("=================================");
        print("DeleteNotes");
        emit(DeleteNotesSucess());
      });
    } on Exception catch (e) {
      print(e.toString());
      emit(DeleteNotesFail(Message: e.toString()));
    }

    // snapshot.data?.docs[i].id
  }

  EditNotes(
      {required String docid, required String EditNoteTitle, required String EditNoteContent})async{
        try {
      var response=    await notesref.doc(docid).update({
            "Ttitle": EditNoteTitle,
            "Content": EditNoteContent,


          }).then((value) {
                 emit(EditNotesSucess());
          });
      print('response');
      print(response);
        }  catch (e) {
          print(e.toString());
          emit(EditNotesFail(Message: e.toString()));
        }


  }


  // List<String> documentIds = [];
  // void fetchDocuments() async {
  //   QuerySnapshot snapshot =
  //       await FirebaseFirestore.instance.collection('notes').get();
  //
  //   if (snapshot.docs.isNotEmpty) {
  //     documentIds = snapshot.docs.map((doc) => doc.id).toList();
  //     // ... do something with the documentIds list
  //   } else {
  //     print('No documents found');
  //   }
  // }
}


// Future<void> fetchNurses() async {
//   users.snapshots().listen((event) {
//     usersList = [];
//
//     for (var doc in event.docs) {
//       var data = doc.data() as Map<String, dynamic>;
//       // var names = data['username'];
//       var role = data['type'];
//       if (role == 'doctor') {
//         usersList.add(data);
//       }
//     }
//     print(usersList);
//   }).onError((e) {
//     print(e.toString());
//   });
// }
