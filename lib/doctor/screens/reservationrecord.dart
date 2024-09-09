import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pregancy/doctor/constants.dart';
import 'package:pregancy/doctor2/cubit/Appoitments_Cubit/appoitments_cubit.dart';
import 'package:pregancy/shared_screen/cache_helper.dart';
import '../../core/globalData.dart';
import '../../doctor2/core/core.dart';

class appointmentrecord extends StatelessWidget {
  static String appointmentrecordid = 'reservationrecord';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppoitmentsCubit()..getAppointments(),
      child: Scaffold(

          body: BlocBuilder<AppoitmentsCubit, AppoitmentsState>(
            builder: (context, state) {
              if (state is AppoitmentsSucess) {
                return BlocProvider.of<AppoitmentsCubit>(context)
                    .AppointmentsList
                    .isNotEmpty
                    ? ListView.builder(
                  itemBuilder: (ctx, index) {
                    var time = BlocProvider.of<AppoitmentsCubit>(context)
                        .AppointmentsList[index]
                        ?.time ??
                        '';

                    var formateddate= dateTimeFormat(time);
                    return ListTile(
                      leading: Image.asset('assets/images/patients.jpeg'),
                      title: Text(
                        BlocProvider.of<AppoitmentsCubit>(context)
                            .AppointmentsList[index]
                            ?.username ??
                            '',
                        style: const TextStyle(color: kprimarycolor),
                      ),
                      subtitle: Text(
                          formateddate.toString()
                      ),
                    );
                  },
                  itemCount: BlocProvider.of<AppoitmentsCubit>(context)
                      .AppointmentsList
                      .length,
                )
                    : Center(child: Text('NoReservationsyet'.tr()));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }
}

// class appoitmentweidget extends StatelessWidget {
//   final appointments appoitmenttime;

//   appoitmentweidget({super.key, required this.appoitmenttime});
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ListTile(
//           leading: Image.asset('assets/images/patientassesment.png'),
//           // title: Text(
//           //   '${DateFormat('yyyy-MM-dd – kk:mm').format(appoitmenttime.time!)}',
//           //   style:
//           //       TextStyle(color: kprimarycolor, fontWeight: FontWeight.bold),
//           // )
//         )
//       ],
//     );
//   }
// }
