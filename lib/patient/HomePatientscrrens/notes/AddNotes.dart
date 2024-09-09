import 'dart:io';
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/doctor/constants.dart';
import 'package:pregancy/doctor/house_weidghets/addnotes.dart';

import 'package:pregancy/patient/HomePatientscrrens/notes/NotesView.dart';
import 'package:pregancy/shared_screen/cache_helper.dart';
import 'package:pregancy/shared_screen/notes_cubit/NoteModel.dart';
import 'package:pregancy/shared_screen/notes_cubit/notes_cubit.dart';
import '../../weidgetes/alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;

class AddNotes extends StatelessWidget {
  AddNotes({Key? key}) : super(key: key);
  File? file;

  // TextEditingController title = TextEditingController();
  // TextEditingController Content = TextEditingController();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // var Cubit = BlocProvider.of<NotesCubit>(context);
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kprimarycolor,
          title: Text('addNote'.tr()),
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: BlocConsumer<NotesCubit, NotesState>(
          listener: (context, state) {
            if (state is AddNotesFail) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.Message),
                  duration: const Duration(seconds: 3),
                ),
              );
            }
            if (state is AddNotesSucess) {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return NotesView();
                },
              ));
            }
          },
          builder: (context, state) {
            return Container(
                child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                    key: formstate,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: BlocProvider.of<NotesCubit>(context).Title,
                          validator: (val) {
                            if (val!.length < 2) {
                              return "Title can't to be less than 2 letter";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            BlocProvider.of<NotesCubit>(context).Title.text = val!;
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
                              labelText: 'titlenote'.tr(),
                              prefixIcon: const Icon(
                                Icons.note,
                                color: kprimarycolor,
                              )),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: BlocProvider.of<NotesCubit>(context).Content,
                          validator: (val) {
                            if (val!.length < 2) {
                              return "notescannottbelessthanletter".tr();
                            }
                            return null;
                          },
                          onSaved: (val) {
                            BlocProvider.of<NotesCubit>(context).Content.text = val!;
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
                              labelText: 'note'.tr(),
                              prefixIcon: const Icon(
                                Icons.note,
                                color: kprimarycolor,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: state is AddNotesLoading
                              ? Center(child: CircularProgressIndicator())
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: kprimarycolor),
                                  onPressed: () {
                                    // NotesModel notesModel = NotesModel(
                                    //     Titile: Cubittitle.text,
                                    //     Content: CubitContent.text,
                                    //     Userid:
                                    //         CacheHelper.getData(key: 'uid'));
                                    BlocProvider.of<NotesCubit>(context)
                                        .addNotes(
                                            Ttitle: BlocProvider.of<NotesCubit>(context).Title.text,
                                            Content: BlocProvider.of<NotesCubit>(context).Content.text,
                                            uid: FirebaseAuth
                                                .instance.currentUser!.uid);
                                  },
                                  //textColor: Colors.white,
                                  //padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 100, vertical: 10),
                                    child: Text('addNote'.tr(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)
                                        //Theme.of(context).textTheme.headline6,

                                        ),
                                  ),
                                ),
                        )
                      ],
                    )),
              ),
            ]));
          },
        ),
      ),
    );
  }
}
