import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';

import '../../../shared_screen/models/getimage.dart';

part 'getimages_state.dart';

class GetimagesCubit extends Cubit<GetimagesState> {
  GetimagesCubit() : super(GetimagesInitial());
  CollectionReference getimages =
      FirebaseFirestore.instance.collection('upload_image');

  List<getimage> imagelist = [];
  Future<void> Getimages({required String email}) async {
    emit((Getimagesloading()));
    print('GetImages');
    getimages
        .where('email', isEqualTo: email)
        .snapshots()
        .listen((event) async {
      imagelist = [];
      for (var doc in event.docs) {
        print('kkkkkkkkkkkkggggggggggggggggggggkkkkk');
        print(doc.data());
        imagelist.add(getimage
            .fromjson((doc as QueryDocumentSnapshot<Map<String, dynamic>>)));


      }
      emit(Getimagesstored(imageslist: imagelist));
    });
  }
}
