import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pregancy/doctor/screens/dr_appointments.dart';
import 'package:pregancy/doctor/screens/reservationrecord.dart';

import '../../../constants.dart';
import '../../../housescrrens/housedoctor.dart';
import '../../../screens/calander.dart';
import '../../../screens/prediction.dart';
import '../../../screens/pregancyform.dart';
import '../../../screens/profiledoctor.dart';

part 'navgation_state.dart';

class NavgationCubitDoctor extends Cubit<NavgationDoctorState> {
  NavgationCubitDoctor() : super(NavgationInitial());

  int currentindex = 0;

  List<BottomNavigationBarItem> ITEMS = [
    BottomNavigationBarItem(
        label:     'home'.tr(), icon: const Icon(Icons.home, color: kprimarycolor)),
    BottomNavigationBarItem(
      label:     'calender'.tr(),
      icon: const Icon(Icons.calendar_month_outlined, color: kprimarycolor),
      backgroundColor: Colors.black,
    ),
    // BottomNavigationBarItem(
    //   label: 'Predection',
    //   icon: Icon(Icons.warning, color: kprimarycolor),
    // ),
    BottomNavigationBarItem(
      label:     'profile'.tr(),
      icon: const Icon(Icons.person, color: kprimarycolor),
    ),
    BottomNavigationBarItem(
      label:    'ClinicReservations'.tr(),
      icon: const Icon(Icons.event_note_outlined, color: kprimarycolor),
    ),
    // BottomNavigationBarItem(
    //   label: 'Appointments',
    //   icon: Icon(Icons.add, color: kprimarycolor),
    // )
  ];
  List<Widget> Screens = [
    housedoctor(),
    const calendar(),
    // predection(),
    profileDoctor(),
    appointmentrecord(),
    // doctor_appointments()
  ];
  List<String> apppartitle = [
    'home'.tr(),
    'calender'.tr(),
    // 'Predection',
    'profile'.tr(),
    'ClinicReservations'.tr()
    // 'Appoitments'
  ];
  void pagenavgation(int index) {
    currentindex = index;
    emit(NavgationInitial());
  }
  void changeStateDoctotr(){
emit(DoctorlangInitial());
}
}
