import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pregancy/doctor/screens/profiledoctor.dart';
import 'package:pregancy/doctor/screens/reservationrecord.dart';
import 'package:pregancy/doctor2/screens/appointmetrecordnurse.dart';
import 'package:pregancy/doctor2/navigationscreen/calendernuese.dart';
import 'package:pregancy/doctor2/navigationscreen/profienurse.dart';
import 'package:pregancy/doctor2/screens/homenurse.dart';
import 'package:pregancy/patient/NavgationPatientscreens/hospitalis.dart';

import '../../constant.dart';

part 'navigationnurse_state.dart';

class NavigationnurseCubit extends Cubit<NavigationnurseState> {
  NavigationnurseCubit() : super(NavigationnurseInitial());
  int currentindex = 0;

  List<BottomNavigationBarItem> ITEMS = [
    BottomNavigationBarItem(
        label: 'home'.tr(), icon: const Icon(Icons.home, color: kprimarycolor)),
    BottomNavigationBarItem(
      label: 'calender'.tr(),
      icon: const Icon(Icons.calendar_month_outlined, color: kprimarycolor),
      backgroundColor: Colors.black,
    ),
    BottomNavigationBarItem(
      label: 'profile'.tr(),
      icon: const Icon(Icons.person, color: kprimarycolor),
    ),
    // BottomNavigationBarItem(
    //   label: 'Clinic Reservation',
    //   icon: Icon(Icons.event_note_outlined, color: kprimarycolor),
    // ),
  ];
  List<Widget> Screens = [
    homenurse(),
    const calendarnuse(),
    profilenurse(),
  ];
  List<String> apppartitle = [
    'home'.tr(),
    'calender'.tr(),
    'profile'.tr(),
  ];
  void pagenavgation(int index) {
    currentindex = index;
    emit(NavigationnurseInitial());
  }
  void ChangeStateNurse(){
    emit(nurselangInitial());
  }
}
