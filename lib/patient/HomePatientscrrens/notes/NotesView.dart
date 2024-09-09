// import 'dart:convert';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:pregancy/core/globalData.dart';
// import 'package:pregancy/core/globalData.dart';
// import 'package:pregancy/doctor/constants.dart';
// import 'package:pregancy/doctor/screens/DoctorLayout.dart';
// import 'package:pregancy/doctor2/navigationscreen/LayoutNurse.dart';
// import 'package:pregancy/shared_screen/login_cubit/login_cubit.dart';
//
// //import 'package:pregancydoctor/screens/note/AddNotes.dart';
//
//
// import '../../../unuses/storage/storage_repo_impl.dart';
// import '../../NavgationPatientscreens/LayoutPatient.dart';
// import 'AddNotes.dart';
// import 'package:pregancy/patient/HomePatientscrrens/notes/EditNotes.dart';
//
// class mainnote extends StatefulWidget {
//   static String mainnoteid = 'mainnote';
//   const mainnote({Key? key}) : super(key: key);
//
//   @override
//   State<mainnote> createState() => _mainnoteState();
// }
//
// class _mainnoteState extends State<mainnote> {
//   CollectionReference notesref = FirebaseFirestore.instance.collection("notes");
//   CollectionReference usersref = FirebaseFirestore.instance.collection("users");
//   // getUser() {
//   //   var user = FirebaseAuth.instance.currentUser;
//   //   print(user?.email);
//   // }
//
//   getRequest() async {}
//
//   @override
//   Widget build(BuildContext context) {
//     print('user Role');
//     print(userrole);
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//             child: Icon(Icons.arrow_back_ios),
//             onTap: () {
//               if (userrole == "patient") {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => LayoutPatient()));
//               } else if (userrole == "doctor") {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => DoctorLayout()));
//               }
//               //Navigator.push(context, MaterialPageRoute());
//               else if (userrole == "nurse") {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => LayOutNurse()));
//               }
//             }),
//         backgroundColor: kprimarycolor,
//         title: Text('Notes'),
//       ),
//       floatingActionButton: FloatingActionButton(
//           backgroundColor: kprimarycolor,
//           child: const Icon(
//             Icons.add,
//             size: 35,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => AddNotes()));
//           }),
//       body: Container(
//         child: FutureBuilder(
//             future: usersref
//                 .doc(FirebaseAuth.instance.currentUser?.uid)
//                 .get()
//                 .then(((DocumentSnapshot documentSnapshot) async {
//               Map<String, dynamic> model =
//                   documentSnapshot.data() as Map<String, dynamic>;
//
//               print(model);
//               QuerySnapshot notes = await notesref.where(
//                 "userid",
//                 whereIn: [
//                   model['nurseid'],
//                   FirebaseAuth.instance.currentUser!.uid
//                 ],
//               ).get();
//               print('mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
//               print(notes.docs.first.data());
//               return notes;
//             })),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return ListView.builder(
//                     itemCount: snapshot.data?.docs.length,
//                     itemBuilder: (context, i) {
//                       return Dismissible(
//                           onDismissed: (diretion) async {
//                             await notesref
//                                 .doc(snapshot.data?.docs[i].id)
//                                 .delete()
//                                 .then((value) {
//                               print("=================================");
//                               print("Delete");
//                             });
//                           },
//                           key: UniqueKey(),
//                           child: ListNotes(
//                             notes: snapshot.data?.docs[i],
//                             docid: snapshot.data?.docs[i].id,
//                           ));
//                     });
//               }
//               return Center(child: CircularProgressIndicator());
//             }),
//       ),
//     );
//   }
// }
//
// class ListNotes extends StatelessWidget {
//   final notes;
//   final docid;
//   ListNotes({this.notes, this.docid});
//   @override
//   Widget build(BuildContext context) {
//     child:
//     return Card(
//       child: Row(
//         children: [
//           Expanded(
//             flex: 3,
//             child: ListTile(
//               title: Text("${notes['title']}"),
//               subtitle: Text(
//                 "${notes['note']}",
//                 style: TextStyle(fontSize: 14),
//               ),
//               trailing: IconButton(
//                 onPressed: () {
//                   Navigator.of(context)
//                       .push(MaterialPageRoute(builder: (context) {
//                     return EditNotes(docid: docid, list: notes);
//                   }));
//                 },
//                 icon: Icon(Icons.edit),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
// // onTap: () {
// //             if (globalData.userData!["type"] == "patient") {
// //               Navigator.push(context,
// //                   MaterialPageRoute(builder: (context) => homePatient()));
// //             } else if (globalData.userData!["type"] == "doctor") {
// //               Navigator.push(context,
// //                   MaterialPageRoute(builder: (context) => homepage()));
// //             }
// //             //Navigator.push(context, MaterialPageRoute());
// //             else {
// //               Navigator.push(context,
// //                   MaterialPageRoute(builder: (context) => homepage()));
// //             }
// //           }
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/core/globalData.dart';
import 'package:pregancy/core/globalData.dart';
import 'package:pregancy/doctor/constants.dart';
import 'package:pregancy/doctor/screens/DoctorLayout.dart';
import 'package:pregancy/doctor2/navigationscreen/LayoutNurse.dart';
import 'package:pregancy/shared_screen/cache_helper.dart';
import 'package:pregancy/shared_screen/login_cubit/login_cubit.dart';
import 'package:pregancy/shared_screen/notes_cubit/NoteModel.dart';
import 'package:pregancy/shared_screen/notes_cubit/notes_cubit.dart';

//import 'package:pregancydoctor/screens/note/AddNotes.dart';

import '../../../unuses/storage/storage_repo_impl.dart';
import '../../NavgationPatientscreens/LayoutPatient.dart';
import 'AddNotes.dart';
import 'package:pregancy/patient/HomePatientscrrens/notes/EditNotes.dart';

class NotesView extends StatelessWidget {
  static String mainnoteid = 'mainnote';
  NotesView({Key? key}) : super(key: key);

  // CollectionReference notesref = FirebaseFirestore.instance.collection("notes");
  //
  // CollectionReference usersref = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<NotesCubit>(context).GetNotes();
    // BlocProvider.of<NotesCubit>(context).fetchDocuments();
    print('user Role');
    print(CacheHelper.getData(key: 'Userrole'));
    return BlocProvider(
      create: (context) => NotesCubit()
        ..GetNotes()
,
      child: BlocConsumer<NotesCubit, NotesState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<NotesCubit>(context);
          return Scaffold(
              appBar: AppBar(
                leading: GestureDetector(
                    child: Icon(Icons.arrow_back_ios),
                    onTap: () {
                      if (CacheHelper.getData(key: 'Userrole') == "patient") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LayoutPatient()));
                      } else if (CacheHelper.getData(key: 'Userrole') ==
                          "doctor") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoctorLayout()));
                      }
                      //Navigator.push(context, MaterialPageRoute());
                      else if (CacheHelper.getData(key: 'Userrole') ==
                          "nurse") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LayOutNurse()));
                      }
                    }),
                backgroundColor: kprimarycolor,
                title: Text('notes'.tr()),
              ),
              floatingActionButton: FloatingActionButton(
                  backgroundColor: kprimarycolor,
                  child: const Icon(
                    Icons.add,
                    size: 35,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddNotes()));
                  }),
              body: Container(
                  child: BlocProvider.of<NotesCubit>(context)
                          .NotesList
                          .isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: BlocProvider.of<NotesCubit>(context)
                              .NotesList
                              .length,
                          itemBuilder: (context, index) {
                            // print(BlocProvider.of<NotesCubit>(context)
                            //     .documentIds[index]);
                            return Dismissible(
                                onDismissed: (diretion) async {
                                  BlocProvider.of<NotesCubit>(context)
                                      .DeleteNote(
                                          BlocProvider.of<NotesCubit>(context)
                                              .NotesList[index].id);
                                },
                                key: UniqueKey(),
                                child: ListNotes(
                                  notesModel:
                                      BlocProvider.of<NotesCubit>(context)
                                          .NotesList[index],
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return EditNotes(
                                        notesModel: cubit.NotesList[index],
                                        // index: cubit.documentIds[index],
                                      );
                                    }));
                                  },
                                ));
                          })
                      : Center(child: Text('nonotesadded').tr())));
        },
      ),
    );
  }
}

class ListNotes extends StatelessWidget {
  final NotesModel notesModel;
  final void Function()? onPressed;
  const ListNotes(
      {super.key, required this.notesModel, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    child:
    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: ListTile(
              title: Text(notesModel.Titile),
              subtitle: Text(
                notesModel.Content,
                style: TextStyle(fontSize: 14),
              ),
              trailing: IconButton(
                onPressed: onPressed,
                icon: Icon(Icons.edit),
              ),
            ),
          )
        ],
      ),
    );
  }
}
// onTap: () {
//             if (globalData.userData!["type"] == "patient") {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => homePatient()));
//             } else if (globalData.userData!["type"] == "doctor") {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => homepage()));
//             }
//             //Navigator.push(context, MaterialPageRoute());
//             else {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => homepage()));
//             }
//           }
