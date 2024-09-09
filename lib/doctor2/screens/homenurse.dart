import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/doctor/screens/predectionpatientbydoctor.dart';
import 'package:pregancy/doctor2/screens/appointmetrecordnurse.dart';

import 'package:pregancy/doctor2/screens/notesnurse.dart';
import 'package:pregancy/doctor2/screens/nurseappoitment.dart';
import 'package:pregancy/doctor2/screens/nurseregesteration.dart';
import 'package:pregancy/doctor2/screens/patientnurse.dart';
import 'package:pregancy/doctor2/screens/patientnurserecord/patientnurserecord.dart';

import 'package:pregancy/doctor2/houseweidgets/cusstom_card.dart';
import 'package:pregancy/doctor2/screens/patientnurserecord/patientnurserecordwiedght/predectionpatientbynursecontanier.dart';
import 'package:pregancy/doctor2/screens/predectionpatientbynurse.dart';

import 'package:pregancy/patient/HomePatientscrrens/notes/NotesView.dart';

import '../cubit/predectionpatientbynurse _cubit/predectionpatientbynurse_cubit.dart';
import 'package:pregancy/doctor2/models/predectionpatientbynurse.dart';

import '../models/pedectiondoctorbynurse.dart';

class homenurse extends StatelessWidget {
  static String homenurseid = 'homenurse';

  @override
  Widget build(BuildContext context) {
    final predection = ModalRoute.of(context)?.settings.arguments
        as predectionpatientbynursemodel?;
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              custtomcard(
                cardimage: 'assets/images/regesteration pink.jpg',
                text: 'reservationregister'.tr(),
                onTap: () {
                  Navigator.pushNamed(
                      context, nurseregesterations.nurseregesterationsid);
                },
              ),
              custtomcard(
                cardimage: 'assets/images/appoitments22.png',
                text: 'appoitments'.tr(),
                onTap: () {
                  Navigator.pushNamed(
                      context, nurseappoitments.nurseappoitmentsid);
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              custtomcard(
                cardimage: 'assets/images/pink pre.jpg',
                text: 'predection'.tr(),
                onTap: () {
                  Navigator.pushNamed(context,
                      predectionpatientbynurse.predectionpatientbynurseid);
                },
              ),
              custtomcard(
                cardimage: 'assets/images/nootes.jpg',
                text: 'notes'.tr(),
                onTap: () {
                  Navigator.pushNamed(context, NotesView.mainnoteid);
                },
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              custtomcard(
                cardimage: 'assets/images/nootes.jpg',
                text: 'ClinicReservations'.tr(),
                onTap: () {
                  Navigator.pushNamed(
                      context, appoitmentsrecordnurse.appoitmentsrecordnurseid);
                },
              ),
              custtomcard(
                cardimage: 'assets/images/medical record.jpg',
                text: 'PatientsRecord'.tr(),
                onTap: () {
                  BlocProvider.of<PredectionpatientbynurseCubit>(context)
                      .predictform();
                  Navigator.pushNamed(
                      context, patientnurserecord.patientnurserecordid);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
