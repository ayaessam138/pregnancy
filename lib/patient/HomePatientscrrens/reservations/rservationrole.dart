import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/patient/HomePatientscrrens/reservations/reservation_cubit.dart';


import 'package:pregancy/patient/HomePatientscrrens/reservations/reservations.dart';
import 'package:pregancy/patient/HomePatientscrrens/reservations/rservationsnurse.dart';

import '../../../doctor2/houseweidgets/cusstom_card.dart';
import '../../constants.dart';

class reservarionrole extends StatelessWidget {
  static String reservarionroleid = 'reservarionrole';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('reservations'.tr()),
          backgroundColor: kprimarycolor,
        ),
        body: Column(
          children: [
            custtomcard(
                onTap: ()async {
               await  BlocProvider.of<ReservationCubit>(context).getReservationNames(Role: 'nurse');
                  Navigator.pushNamed(context, reservations.reservationsid);
                },
                cardimage: 'assets/images/roole doc.jpg',
                text: 'doctor'.tr()),
            custtomcard(
                onTap: ()async {
                  await BlocProvider.of<ReservationCubit>(context).getReservationNames(Role: 'doctor');
                  Navigator.pushNamed(
                      context, reservationsnurse.reservationsnurseid);
                },
                cardimage: 'assets/images/role nurse.jpg',
                text: 'nurse'.tr())
          ],
        ));
  }
}
