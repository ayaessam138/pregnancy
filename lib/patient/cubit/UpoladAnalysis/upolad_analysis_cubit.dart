import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:pregancy/shared_screen/cache_helper.dart';
import 'package:pregancy/shared_screen/models/getimage.dart';
import 'package:path/path.dart';
part 'upolad_analysis_state.dart';

class UpoladAnalysisCubit extends Cubit<UpoladAnalysisState> {
  UpoladAnalysisCubit() : super(UpoladAnalysisInitial());
  CollectionReference getimages =
      FirebaseFirestore.instance.collection('upload_image');
  var currentUser = FirebaseAuth.instance;
  List<getimage> imagelist = [];
  Future<void> GetUploadedAanalysisByPatient({required String email}) async {
    try {
      emit((GetUpoladAnalysisLoading()));
      print('GetUploadedAanalysisByPatient');
      getimages.snapshots().listen((event) async {
        imagelist = [];
        imagelist.clear();
        for (var doc in event.docs) {
          if ((doc.data()! as Map<String, dynamic>)['uId'] ==
              currentUser.currentUser!.uid) {
            imagelist.add(getimage.fromjson(
                (doc as QueryDocumentSnapshot<Map<String, dynamic>>)));
          }
          print('imagelist');
          print(imagelist);
          emit(GetUpoladAnalysisSucess());
        }
      });
    } catch (e) {
      print(e.toString());
      emit(GetUpoladAnalysisFail(Message: e.toString()));
    }
  }

  TextEditingController ImageTitle = TextEditingController();

  var selectedImage;

  Future pickercamera() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.camera);
    File _file = File(myfile!.path);
  }

  SelectImages() async {
    selectedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    emit(ImageSelectedSucess());
  }

  Uopoladimage() async {
    print('Uopoladimage');
    if (selectedImage != null) {
      var file = File(selectedImage.path);
      var nameimage = basename(selectedImage.path);
      var random = Random().nextInt(1000000);
      nameimage = "$random$nameimage";
      var refstorge = FirebaseStorage.instance.ref("$nameimage");
      await refstorge.putFile(file);
      var url = await refstorge.getDownloadURL();
      print("url : $url");
      FirebaseFirestore.instance.collection('upload_image').add({
        "name": ImageTitle.text,
        "url": url,
        "uId":currentUser.currentUser!.uid,
        "email": CacheHelper.getData(key: 'email')
      });

    }
    emit(UploadImageSucess());
  }

}
