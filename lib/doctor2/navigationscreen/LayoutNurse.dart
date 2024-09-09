import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/core/globalData.dart';
import 'package:pregancy/doctor2/cubit/navigation_nurse_cuibt/navigationnurse_cubit.dart';
import 'package:pregancy/shared_screen/cache_helper.dart';
import '../../shared_screen/loginScreen.dart';
import '../../unuses/storage/storage_repo_impl.dart';
import '../constant.dart';

class LayOutNurse extends StatefulWidget {
  static String homenursepageid = 'hhomepagenurse';

  @override
  State<LayOutNurse> createState() => _LayOutNurseState();
}

class _LayOutNurseState extends State<LayOutNurse> {
  getUser() {
    var user = FirebaseAuth.instance.currentUser;
    print(user?.email);
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  signOut() async {
    await auth.signOut();
    CacheHelper.removeData(key: 'Userrole');
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Login.logid, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => NavigationnurseCubit(),
  child: BlocConsumer<NavigationnurseCubit, NavigationnurseState>(
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
                      CacheHelper.removeData(key: 'Userrole');
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          Login.logid, (route) => false);
                      // StorageRepoImpl().deleteAll();
                      // globalData.userData = null;
                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (context) => Login()));
                      // CacheHelper.removeData(key: 'type');
                    })
                ,IconButton(
                    onPressed: () {
                      if (context.locale.languageCode == 'ar') {
                        context.setLocale(Locale('en'));
                      } else {
                        context.setLocale(Locale('ar'));
                      }
                      BlocProvider.of<NavigationnurseCubit>(context)
                          .ChangeStateNurse();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LayOutNurse(),
                          ));
                    },
                    icon: Icon(Icons.language))
              ],
              backgroundColor: kprimarycolor,
              title: Text(
                ' ${BlocProvider.of<NavigationnurseCubit>(context).apppartitle[BlocProvider.of<NavigationnurseCubit>(context).currentindex]}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            body: BlocProvider.of<NavigationnurseCubit>(context).Screens[
                BlocProvider.of<NavigationnurseCubit>(context).currentindex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex:
                  BlocProvider.of<NavigationnurseCubit>(context).currentindex,
              items: BlocProvider.of<NavigationnurseCubit>(context).ITEMS,
              onTap: (index) {
                BlocProvider.of<NavigationnurseCubit>(context)
                    .pagenavgation(index);
              },
            ));
      },
    ),
);
  }
}
