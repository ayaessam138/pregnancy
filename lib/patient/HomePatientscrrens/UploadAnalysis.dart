// import 'dart:io';
// import 'dart:math';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/foundation.dart';
// import 'package:path/path.dart';
// import 'package:pregancy/core/globalData.dart';
// import 'package:pregancy/doctor/constants.dart';
//
//
// class Uplaodanalysis extends StatefulWidget {
//   static String analysisid = 'analysis';
//
//   @override
//   State<Uplaodanalysis> createState() => _UplaodanalysisState();
// }
//
// class _UplaodanalysisState extends State<Uplaodanalysis> {
//   String ImageTitle = '';
//
//   String imageUrl = '';
//
//   final GlobalKey<FormState> keyy = GlobalKey();
//
//   CollectionReference uploudImage =
//       FirebaseFirestore.instance.collection('uploadImage');
//
//   File? _file;
//
//   Reference? ref;
//
//   var selected;
//
//   Future pickercamera() async {
//     final myfile = await ImagePicker().pickImage(source: ImageSource.camera);
//     _file = File(myfile!.path);
//   }
//
//   SelectImages() async {
//     selected = await ImagePicker().pickImage(source: ImageSource.camera);
//   }
//
//   getImages() async {
//     var ref = await FirebaseStorage.instance.ref().listAll();
//     ref.items.forEach((element) {
//       print("element.name");
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           analysis,
//           style:
//               const TextStyle(fontFamily: 'Lemon', fontWeight: FontWeight.w400),
//         ),
//         backgroundColor: kprimarycolor,
//       ),
//       floatingActionButton: Form(
//         key: keyy,
//         child: FloatingActionButton(
//           heroTag: null,
//           onPressed: () async {
//             await SelectImages();
//             //getImages();
//             showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     title: Text('image name'),
//                     content: TextField(
//                       decoration: InputDecoration(hintText: 'image name '),
//                       onChanged: (String value) {
//                         ImageTitle = value;
//                       },
//                     ),
//                     actions: [
//                       TextButton(
//                           onPressed: () async {
//                             if (selected != null) {
//                               var file = File(selected.path);
//                               var nameimage = basename(selected.path);
//                               var random = Random().nextInt(1000000);
//                               nameimage = "$random$nameimage";
//                               var refstorge =
//                                   FirebaseStorage.instance.ref("$nameimage");
//                               await refstorge.putFile(file);
//                               var url = await refstorge.getDownloadURL();
//                               print("url : $url");
//                               FirebaseFirestore.instance
//                                   .collection('upload_image')
//                                   .add({
//                                 "name": ImageTitle,
//                                 "url": url,
//                                 "email": globalData.userData!['email']
//                               });
//                             } else {
//                               print("choose image");
//                             }
//
//                             Navigator.of(context).pop();
//                           },
//                           child: Text(
//                             'ADD',
//                             style: TextStyle(color: kprimarycolor),
//                           ))
//                     ],
//                   );
//                 });
//           },
//           backgroundColor: kprimarycolor,
//           child: Icon(Icons.upload),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(5),
//         child: StreamBuilder(
//             stream: FirebaseFirestore.instance
//                 .collection("upload_image")
//                 .where("userid",
//                     isEqualTo: FirebaseAuth.instance.currentUser?.uid)
//                 .get()
//                 .asStream(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState != ConnectionState.done) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               var listData = snapshot.data!.docs;
//               return ListView.builder(
//                 itemCount: listData.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final item = listData[index];
//                   return Dismissible(
//                       key: Key(item.id),
//                       onDismissed: (v) {},
//                       child: InkWell(
//                         onTap: () {
//                           showDialog(
//                               context: context,
//                               builder: (context) => Dialog(
//                                     child: Image.network(item.data()["url"]),
//                                   ));
//                         },
//                         child: Card(
//                           elevation: 4,
//                           margin: EdgeInsets.all(8),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: ListTile(
//                             title: Text(
//                               item.data()["name"],
//                               style: TextStyle(color: Colors.black),
//                             ),
//                             leading: Image.network(item.data()["url"]),
//                             trailing: IconButton(
//                               icon: Icon(
//                                 Icons.delete,
//                                 color: kprimarycolor,
//                               ),
//                               onPressed: () {
//                                 FirebaseFirestore.instance
//                                     .collection("upload_image")
//                                     .doc(item.id)
//                                     .delete();
//                               },
//                             ),
//                           ),
//                         ),
//                       ));
//                 },
//               );
//             }),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';

import 'package:pregancy/core/globalData.dart';
import 'package:pregancy/doctor/constants.dart';

import 'package:pregancy/patient/cubit/UpoladAnalysis/upolad_analysis_cubit.dart';
import 'package:pregancy/shared_screen/cache_helper.dart';
import 'package:pregancy/shared_screen/models/getimage.dart';

class Uplaodanalysis extends StatelessWidget {
  static String analysisid = 'analysis';

  final GlobalKey<FormState> keyy = GlobalKey();

  @override
  Widget build(BuildContext context) {


    // Cubit.GetUploadedAanalysisByPatient(email: CacheHelper.getData(key: 'email'));
    return BlocProvider(
      create: (context) => UpoladAnalysisCubit()
        ..GetUploadedAanalysisByPatient(
            email: CacheHelper.getData(key: 'email')),
      child: BlocConsumer<UpoladAnalysisCubit, UpoladAnalysisState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var Cubit = BlocProvider.of<UpoladAnalysisCubit>(context);
          return Scaffold(

              appBar: AppBar(
                title: Text(
                  'analysis'.tr(),
                  style: const TextStyle(
                      fontFamily: 'Lemon', fontWeight: FontWeight.w400),
                ),
                backgroundColor: kprimarycolor,
              ),
              floatingActionButton: Form(
                key: keyy,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () async {
                    Cubit.SelectImages();
                    //getImages();
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('analysisname'.tr()),
                            content: TextField(
                              controller: Cubit.ImageTitle,
                              decoration: InputDecoration(
                                  hintText: 'analysisname'.tr()),
                              onChanged: (String value) {
                                Cubit.ImageTitle.text = value;
                              },
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () async {
                                    await Cubit.Uopoladimage().then(
                                        (value) => Navigator.of(context).pop());
                                  },
                                  child: Text(
                                    'add'.tr(),
                                    style: const TextStyle(color: kprimarycolor),
                                  ))
                            ],
                          );
                        });
                  },
                  backgroundColor: kprimarycolor,
                  child: const Icon(Icons.upload),
                ),
              ),
              body: Padding(
                  padding: const EdgeInsets.all(5),
                  child: state is GetUpoladAnalysisLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Cubit.imagelist.isNotEmpty
                          ? ListView.builder(
                              itemCount: Cubit.imagelist.length,
                              itemBuilder: (BuildContext context, int index) {
                                return AnalysisWidght(
                                  Getimage: Cubit.imagelist[index],
                                );
                              },
                            )
                          : Center(
                              child:
                                  Text('youdonotuploadanyanalysisyet'.tr()))));
        },
      ),
    );
  }
}

class AnalysisWidght extends StatelessWidget {
  AnalysisWidght({super.key, required this.Getimage});
  getimage Getimage;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => Dialog(
                  child: Image.network(Getimage.imageurl!),
                ));
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(
            Getimage.imagename!,
            style: const TextStyle(color: Colors.black),
          ),
          leading: Image.network(Getimage.imageurl!),
        ),
      ),
    );
  }
}
