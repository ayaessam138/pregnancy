import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/core/globalData.dart';
import 'package:pregancy/shared_screen/cache_helper.dart';
import '../../unuses/storage/storage_repo_impl.dart';
import '../constants.dart';
import '../cubit/navgation_cubit/navgation_cubit/navgation_cubit.dart';
import '../../shared_screen/loginScreen.dart';
import '../weidgetes/bottom_navigation_bar.dart';

class DoctorLayout extends StatefulWidget {
  static String homeid = 'homedoctor';

  @override
  State<DoctorLayout> createState() => _DoctorLayoutState();
}

class _DoctorLayoutState extends State<DoctorLayout> {
  getUser() {
    var user = FirebaseAuth.instance.currentUser;
    print(user?.email);
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  signOut() async {
    await auth.signOut();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Login.logid, (route) => false);
    CacheHelper.removeData(key: 'Userrole');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => NavgationCubitDoctor(),
  child: BlocConsumer<NavgationCubitDoctor, NavgationDoctorState>(
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
                    onPressed: () async {
                      // await FirebaseAuth.instance.signOut();
                      CacheHelper.removeData(key: 'Userrole');
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil(Login.logid, (route) => false);

                    }),
                IconButton(
                    onPressed: () {
                      if (context.locale.languageCode == 'ar') {
                        context.setLocale(Locale('en'));
                      } else {
                        context.setLocale(Locale('ar'));
                      }
                      BlocProvider.of<NavgationCubitDoctor>(context)
                          .changeStateDoctotr();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorLayout(),
                          ));
                    },
                    icon: Icon(Icons.language))
              ],
              backgroundColor: kprimarycolor,
              title: Text(
                ' ${BlocProvider.of<NavgationCubitDoctor>(context).apppartitle[BlocProvider.of<NavgationCubitDoctor>(context).currentindex]}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            body: BlocProvider.of<NavgationCubitDoctor>(context).Screens[
                BlocProvider.of<NavgationCubitDoctor>(context).currentindex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex:
                  BlocProvider.of<NavgationCubitDoctor>(context).currentindex,
              items: BlocProvider.of<NavgationCubitDoctor>(context).ITEMS,
              onTap: (index) {
                BlocProvider.of<NavgationCubitDoctor>(context)
                    .pagenavgation(index);
              },
            ));
      },
    ),
);
  }
}
