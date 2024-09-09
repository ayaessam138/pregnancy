import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pregancy/patient/HomePatientscrrens/HomePatient.dart';

import 'package:pregancy/patient/NavgationPatientscreens/calander.dart';

import 'package:pregancy/patient/NavgationPatientscreens/PredictionPatient.dart';

import 'package:pregancy/patient/NavgationPatientscreens/profilepatient.dart';

// import '../../../../doctor//pregancyform.dart';
import '../../../constants.dart';
import '../../../NavgationPatientscreens/emergency.dart';

part 'navgation_state.dart';

class NavgationCubitPatient extends Cubit<NavgationPatientState> {
  NavgationCubitPatient() : super(NavgationInitial());

  int currentindex = 0;

  List<BottomNavigationBarItem> ITEMS = [
    BottomNavigationBarItem(
        label: 'home'.tr(), icon: const Icon(Icons.home, color: kprimarycolor)),
    BottomNavigationBarItem(
      label: 'calender'.tr(),
      icon: const Icon(Icons.calendar_view_day_rounded, color: kprimarycolor),
      backgroundColor: Colors.black,
    ),
    BottomNavigationBarItem(
      label: 'predection'.tr(),
      icon: const Icon(Icons.warning, color: kprimarycolor),
    ),
    BottomNavigationBarItem(
      label: 'emergency'.tr(),
      icon: const Icon(Icons.recommend, color: kprimarycolor),
    ),
    BottomNavigationBarItem(
      label: 'profile'.tr(),
      icon: const Icon(Icons.person, color: kprimarycolor),
    ),
  ];
  List<Widget> Screens = [
    HomePatient(),
    const calendar(),
    PredectionPatient(),
    emergency(),
    profilepatient(),
  ];
  List<String> apppartitle = [
    'home'.tr(),
    'calender'.tr(),
    'predection'.tr(),
    'emergency'.tr(),
    'profile'.tr(),
  ];
  void pagenavgation(int index) {
    currentindex = index;
    emit(NavgationInitial());
  }

  void changeStatePatient() {
    emit(patientlangInitial());
  }
}
