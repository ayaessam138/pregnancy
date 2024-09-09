import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/shared_screen/cache_helper.dart';
import 'package:pregancy/unuses/storage/storage_repo.dart';
import 'package:pregancy/unuses/storage/storage_repo_impl.dart';
import '../../core/globalData.dart';
import '../../shared_screen/loginScreen.dart';
import '../constants.dart';
import '../cubit/navgation_cubit/navgation_cubit/navgation_cubit.dart';

class LayoutPatient extends StatefulWidget {
  static String homeid = 'homePatient';

  @override
  State<LayoutPatient> createState() => _LayoutPatientState();
}

class _LayoutPatientState extends State<LayoutPatient> {
  getUser() {
    var user = FirebaseAuth.instance.currentUser;
    print(user?.email);
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  signOut() async {
    await auth.signOut();
    print(CacheHelper.getData(key: 'Userrole'));
    CacheHelper.removeData(key: 'Userrole');

    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return Login();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => NavgationCubitPatient(),
  child: BlocConsumer<NavgationCubitPatient, NavgationPatientState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                    icon: Icon(Icons.logout),
                    onPressed: () {
                      print(CacheHelper.getData(key: 'Userrole'));
                      CacheHelper.removeData(key: 'Userrole');

                      Navigator.of(context).pushNamedAndRemoveUntil(
                          Login.logid, (route) => false);
                      // await FirebaseAuth.instance.signOut();
                      // StorageRepoImpl().deleteAll();
                      // globalData.userData = null;
                    }),
                IconButton(
                    onPressed: () {
                      if (context.locale.languageCode == 'ar') {
                        context.setLocale(Locale('en'));
                      } else {
                        context.setLocale(Locale('ar'));
                      }
                      BlocProvider.of<NavgationCubitPatient>(context)
                          .changeStatePatient();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LayoutPatient(),
                          ));
                    },
                    icon: Icon(Icons.language))
              ],
              backgroundColor: kprimarycolor,
              title: Text(
                ' ${BlocProvider.of<NavgationCubitPatient>(context).apppartitle[BlocProvider.of<NavgationCubitPatient>(context).currentindex]}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            body: BlocProvider.of<NavgationCubitPatient>(context).Screens[
                BlocProvider.of<NavgationCubitPatient>(context).currentindex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex:
                  BlocProvider.of<NavgationCubitPatient>(context).currentindex,
              items: BlocProvider.of<NavgationCubitPatient>(context).ITEMS,
              onTap: (index) {
                BlocProvider.of<NavgationCubitPatient>(context)
                    .pagenavgation(index);
              },
            ));
      },
    ),
);
  }
}
