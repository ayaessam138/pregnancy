import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:pregancy/shared_screen/cache_helper.dart';

part 'login_state.dart';
// var userrole;
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginuser(
      {required String email, required String password}) async {
    emit(Logingloading());
    try {
      var auth = FirebaseAuth.instance;
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
        (user) async {
          emit(GetRoleloading());
          CollectionReference userscollectionReference =
              FirebaseFirestore.instance.collection('users');

          await userscollectionReference.doc(user.user!.uid).get().then(
            (value) {


              print('role');
              print(value.get('type'));
               CacheHelper.saveData(key: 'Userrole', value: value.get('type'));
              CacheHelper.saveData(key: 'uId', value: user.user!.uid);
              CacheHelper.saveData(key: 'email', value: email);
              emit(GetRoleSucess(userrole: value.get('type')));
            },
          );

          emit(LoginSucess());
        },
      );
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(LoginFail(errorMessage: 'user not found'));
      } else if (ex.code == 'wrong-password') {
        emit(LoginFail(errorMessage: 'wrongpassword'));
      }
    } catch (e) {
      emit(LoginFail(errorMessage: e.toString()));
      // TODO
    }
  }
}
