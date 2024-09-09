// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:pregancy/shared_screen/cache_helper.dart';
//
// import '../constant.dart';
// import '../../core/globalData.dart';
//
// class appoitmentsrecordnurse extends StatelessWidget {
//   static String appoitmentsrecordnurseid = 'appoitmentsrecordnurse';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Clinic Reservation'),
//         backgroundColor: kprimarycolor,
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance
//               .collection('doctor_reservations')
//               .where("doctorid", isEqualTo: CacheHelper.getData(key: 'uId'))
//               .snapshots(),
//           builder: (context, snapshot) {
//             List<Map<String, dynamic>> data = [];
//             if (snapshot.data != null) {
//               data = snapshot.data!.docs
//                   .map((e) => e.data() as Map<String, dynamic>)
//                   .toList();
//             }
//             return ListView.builder(
//               itemBuilder: (ctx, index) {
//                 final item = data[index];
//                 return ListTile(
//                   leading: Image.asset('assets/images/patients.jpeg'),
//                   title: Text(
//                     item["username"],
//                     style: TextStyle(color: kprimarycolor),
//                   ),
//                   subtitle: Text(item["time"]),
//                 );
//               },
//               itemCount: data.length,
//             );
//           }),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/core/core.dart';
import 'package:pregancy/doctor2/cubit/Appoitments_Cubit/appoitments_cubit.dart';
import 'package:pregancy/shared_screen/cache_helper.dart';

import '../constant.dart';
import '../../core/globalData.dart';

class appoitmentsrecordnurse extends StatelessWidget {
  ClinReservations? clinReservations;
  static String appoitmentsrecordnurseid = 'appoitmentsrecordnurse';

  appoitmentsrecordnurse({super.key, this.clinReservations});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppoitmentsCubit()..getAppointments(),
      child: Scaffold(
          appBar: AppBar(
            title: Text('ClinicReservations'.tr()),
            backgroundColor: kprimarycolor,
          ),
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
