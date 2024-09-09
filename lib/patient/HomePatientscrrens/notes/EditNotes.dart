import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:pregancy/doctor/constants.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';

import 'package:pregancy/patient/weidgetes/alert.dart';
import 'package:pregancy/shared_screen/notes_cubit/NoteModel.dart';
import 'package:pregancy/shared_screen/notes_cubit/notes_cubit.dart';

class EditNotes extends StatelessWidget {
  // final docid;
  // final list;
  EditNotes({
    Key? key,
    required this.notesModel,
    // required this.index,
  }) : super(key: key);

  CollectionReference notesref = FirebaseFirestore.instance.collection("notes");
  // final String index;
  //Reference? ref;
  File? file;

  final NotesModel notesModel;

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  // editNotes(context) async {
  //   var formdata = formstate.currentState;

  // if (file == null) {
  //   if (formdata!.validate()) {
  //     showLoading(context);
  //     formdata.save();
  //     await notesref.doc(widget.docid).update({
  //       "title": title,
  //       "note": note,
  //     }).then((value) {
  //       Navigator.of(context).pushNamed("homepage");
  //     }).catchError((e) {
  //       print("$e");
  //     });
  //   }
  // } else {
  //   if (formdata!.validate()) {
  //     showLoading(context);
  //     formdata.save();
  //     await ref?.putFile(file!);

  //     await notesref.doc(widget.docid).update({
  //       "title": title,
  //       "note": note,
  //     }).then((value) {
  //       Navigator.of(context).pushNamed("homepage");
  //     }).catchError((e) {
  //       print("$e");
  //     });
  //   }
  // }
  //}

  @override
  Widget build(BuildContext context) {
    TextEditingController EditNoteContent =
        TextEditingController(text: notesModel.Content);
    TextEditingController EditNoteTitle =
        TextEditingController(text: notesModel.Titile);
    // var Cubit = BlocProvider.of<NotesCubit>(context);
    return BlocProvider.value(

      value:NotesCubit() ,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kprimarycolor,
          title: Text('editNote'.tr()),
        ),
        body: BlocConsumer<NotesCubit, NotesState>(
          listener: (context, state) {
            if (state is EditNotesSucess) {
              Navigator.pop(context);
            }
            if (state is EditNotesFail) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.Message),
                duration: const Duration(seconds: 3),
              ));
            }
          },
          builder: (context, state) {
            return Container(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      key: formstate,
                      child: Column(children: [
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: EditNoteTitle,
                          // initialValue: notesModel.Titile,
                          validator: (val) {
                            if (val!.length < 2) {
                              return "notescannottbelessthanletter".tr();
                            }
                            return null;
                          },
                          onSaved: (val) {
                            EditNoteTitle.text = val!;
                          },
                          maxLength: 30,
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 233, 221, 221))),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 233, 216, 216))),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "titlenote".tr(),
                              prefixIcon: const Icon(Icons.note)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: EditNoteContent,
                          // initialValue: notesModel.Content,
                          validator: (val) {
                            if (val!.length < 2) {
                              return "notescannottbelessthanletter".tr();
                            }
                            return null;
                          },
                          onSaved: (val) {
                            EditNoteContent.text = val!;
                          },
                          minLines: 1,
                          maxLines: 3,
                          maxLength: 200,
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 233, 221, 221))),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 233, 216, 216))),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "note".tr(),
                              prefixIcon: const Icon(Icons.note)),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            // await editNotes(context);
                            if (formstate.currentState!.validate() == true) {
                              BlocProvider.of<NotesCubit>(context).EditNotes(
                                  docid: notesModel.id,
                                  EditNoteTitle: EditNoteTitle.text,
                                  EditNoteContent: EditNoteContent.text);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kprimarycolor),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 10),
                            child: Text(
                              style: const TextStyle(color: Colors.white),
                              "editNote".tr(),
                              // style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        )
                      ])),
                )
              ],
            ));
          },
        ),
      ),
    );
  }
}
