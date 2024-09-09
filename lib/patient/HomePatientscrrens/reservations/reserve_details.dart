// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pregancy/patient/HomePatientscrrens/reservations/reservation_cubit.dart';
// import 'package:pregancy/shared_screen/cache_helper.dart';
// import '../../../core/core.dart';
// import '../../constants.dart';
// import '../../../core/globalData.dart';

// class reserveDetails extends StatelessWidget {
//   reserveDetails({Key? key, this.userItem}) : super(key: key);
//   Map<String, dynamic>? userItem;
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Doctor Profile'),
//         backgroundColor: kprimarycolor,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 30),
//             Text(
//               "${userItem!['username']}",
//               style: const TextStyle(
//                   color: kprimarycolor,
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             userItem!['University'] == null &&
//                     userItem!['Graduation Year'] == null &&
//                     userItem!['Clinic Location'] == null &&
//                     userItem!['Ticket Price'] == null
//                 ? const Center(
//                     child: Text(
//                       'No Reservations Added ,yet',
//                       style: TextStyle(color: kprimarycolor),
//                     ),
//                   )
//                 : Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "university: ${userItem!['University']}",
//                         style: TextStyle(
//                           color: Colors.grey[700],
//                           fontSize: 18,
//                         ),
//                       ),
//                       Text(
//                         "Graduation year:${userItem!['Graduation Year']}",
//                         style: TextStyle(
//                           color: Colors.grey[700],
//                           fontSize: 18,
//                         ),
//                       ),
//                       Text(
//                         "clinic location:${userItem!['Clinic Location']}",
//                         style: TextStyle(
//                           color: Colors.grey[700],
//                           fontSize: 18,
//                         ),
//                       ),
//                       Text(
//                         "Ticket Price:${userItem!['Ticket Price']}",
//                         style: TextStyle(
//                           color: Colors.grey[700],
//                           fontSize: 18,
//                         ),
//                       ),
//                     ],
//                   ),
//             const SizedBox(height: 40),
//             if (BlocProvider.of<ReservationCubit>(context).reservationAvailableTimes.isNotEmpty)
//               StreamBuilder<QuerySnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection('doctor_reservations')
//                       .where("doctorid", isEqualTo: userItem!['userid'])
//                       .snapshots(),
//                   builder: (context, snapshot) {
//                     List<DateTime> data = [];
//                     if (snapshot.data != null) {
//                       data = snapshot.data!.docs
//                           .map((e) => DateTime.parse(
//                               (e.data() as Map<String, dynamic>)["time"]
//                                   .toString()))
//                           .toList();
//                     }
//
//                     return Container(
//                       height: 100,
//                       child: ListView.builder(
//                           itemBuilder: (context, index) {
//                             DateTime item = BlocProvider.of<ReservationCubit>(context).reservationAvailableTimes[index];
//                             return InkWell(
//                               onTap: data.contains(item)
//                                   ? null
//                                   : () {
//                                 BlocProvider.of<ReservationCubit>(context).selectedTime = item;
//                                 BlocProvider.of<ReservationCubit>(context).doctoruserid = userItem!['userid']!;
//                                 BlocProvider.of<ReservationCubit>(context). patientid =
//                                           CacheHelper.getData(key: 'uId')
//                                               .toString();
//                                 BlocProvider.of<ReservationCubit>(context). patientName = globalData
//                                           .userData!["username"]
//                                           .toString();
//                                       // setState(() {});
//                                     },
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                     color: data.contains(item)
//                                         ? Colors.grey.shade400
//                                         : BlocProvider.of<ReservationCubit>(context).selectedTime == item &&
//                                                 userItem!["userid"] ==
//                                                     BlocProvider.of<ReservationCubit>(context).doctoruserid
//                                             ? Colors.pink.shade100
//                                             : kprimarycolor,
//                                     borderRadius: BorderRadius.circular(10)),
//                                 padding: const EdgeInsets.all(20),
//                                 margin:
//                                     const EdgeInsets.symmetric(horizontal: 8),
//                                 child: Text(
//                                   dateTimeFormat(item.toString()),
//                                   style: TextStyle(
//                                       color: data.contains(item)
//                                           ? Colors.black
//                                           : Colors.white,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             );
//                           },
//                           itemCount: BlocProvider.of<ReservationCubit>(context).reservationAvailableTimes.length,
//                           scrollDirection: Axis.horizontal),
//                     );
//                   }),
//             const SizedBox(
//               height: 30,
//             ),
//             Center(
//               child: Container(
//                 //alignment: AlignmentDirectional.topEnd,
//                 height: 30,
//                 width: 80,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadiusDirectional.circular(10),
//                   color: BlocProvider.of<ReservationCubit>(context).selectedTime == null
//                       ? Colors.grey.shade300
//                       : kprimarycolor,
//                 ),
//                 child: MaterialButton(
//                   onPressed: BlocProvider.of<ReservationCubit>(context).selectedTime == null
//                       ? null
//                       : () async {
//                           FirebaseFirestore.instance
//                               .collection('doctor_reservations')
//                               .add({
//                             "doctorid": BlocProvider.of<ReservationCubit>(context).doctoruserid,
//                             "time": BlocProvider.of<ReservationCubit>(context).selectedTime.toString(),
//                             "userid": patientid,
//                             "username": patientName
//                           });
//                           showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return const AlertDialog(
//                                   title: Text("Success"),
//                                   content: Text("Saved successfully"),
//                                 );
//                               });
//                           // Future.delayed(Duration(seconds: 2), () {
//                           //   Navigator.pop(context);
//                           // });
//                         },
//                   child: Text(
//                     'Book',
//                     style: TextStyle(
//                         color:
//                             selectedTime == null ? Colors.black : Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/patient/HomePatientscrrens/reservations/reservation_cubit.dart';
import 'package:pregancy/shared_screen/cache_helper.dart';
import '../../../core/core.dart';
import '../../constants.dart';
import '../../../core/globalData.dart';

class reserveDetails extends StatelessWidget {
  reserveDetails({Key? key, this.userItem}) : super(key: key);
  Map<String, dynamic>? userItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile'.tr()),
        backgroundColor: kprimarycolor,
      ),
      body: BlocBuilder<ReservationCubit, ReservationState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Text(
                  "${userItem!['username']}",
                  style: const TextStyle(
                      color: kprimarycolor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                userItem!['University'] == null &&
                        userItem!['Graduation Year'] == null &&
                        userItem!['Clinic Location'] == null &&
                        userItem!['Ticket Price'] == null
                    ? Center(
                        child: Text(
                          'doctordoesnotsharehisprofileyet'.tr(),
                          style: TextStyle(color: kprimarycolor),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "university: ${userItem!['University']}",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Graduation year:${userItem!['Graduation Year']}",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "clinic location:${userItem!['Clinic Location']}",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Ticket Price:${userItem!['Ticket Price']}",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                const SizedBox(height: 40),
                BlocProvider.of<ReservationCubit>(context)
                        .reservationAvailableTimes
                        .isNotEmpty
                    ? Container(
                        height: 100,
                        child: ListView.builder(
                            itemBuilder: (context, index) {
                              DateTime item =
                                  BlocProvider.of<ReservationCubit>(context)
                                      .reservationAvailableTimes[index];
                              return InkWell(
                                onTap: () {
                                  print('reserve');
                                  BlocProvider.of<ReservationCubit>(context)
                                          .TimesreservedList
                                          .contains(item)
                                      ? showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('Ok'))
                                              ],
                                              content: Text("Time Reserved"),
                                            );
                                          })
                                      : BlocProvider.of<ReservationCubit>(
                                              context)
                                          .selectedTime = item;
                                  BlocProvider.of<ReservationCubit>(context)
                                      .doctoruserid = userItem!['userid']!;
                                  BlocProvider.of<ReservationCubit>(context)
                                          .patientid =
                                      CacheHelper.getData(key: 'uId')
                                          .toString();
                                  BlocProvider.of<ReservationCubit>(context)
                                          .patientName =
                                      CacheHelper.getData(key: 'myusername');

                                  // setState(() {});
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: BlocProvider.of<ReservationCubit>(
                                                  context)
                                              .TimesreservedList
                                              .contains(BlocProvider
                                                          .of<ReservationCubit>(
                                                              context)
                                                      .reservationAvailableTimes[
                                                  index])
                                          ? Colors.grey
                                          : kprimarycolor,
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: const EdgeInsets.all(20),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    dateTimeFormat(item.toString()),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              );
                            },
                            itemCount:
                                BlocProvider.of<ReservationCubit>(context)
                                    .reservationAvailableTimes
                                    .length,
                            scrollDirection: Axis.horizontal),
                      )
                    : Center(
                        child: Text(
                        'Notimesdeterminedbydoctoryet'.tr(),
                        style: TextStyle(color: kprimarycolor),
                      )),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    //alignment: AlignmentDirectional.topEnd,
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(10),
                      color:  BlocProvider.of<ReservationCubit>(context)
                          .TimesreservedList
                          .contains(
                          BlocProvider.of<ReservationCubit>(context)
                              .selectedTime)?Colors.grey:kprimarycolor,
                    ),
                    child: MaterialButton(
                      onPressed: () async {
                        BlocProvider.of<ReservationCubit>(context)
                                .TimesreservedList
                                .contains(
                                    BlocProvider.of<ReservationCubit>(context)
                                        .selectedTime)
                            ? showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('ok'.tr()))
                                    ],
                                    content: Text("timereserved".tr()),
                                  );
                                })
                            : FirebaseFirestore.instance
                                .collection('doctor_reservations')
                                .add({
                                "doctorid":
                                    BlocProvider.of<ReservationCubit>(context)
                                        .doctoruserid,
                                "time":
                                    BlocProvider.of<ReservationCubit>(context)
                                        .selectedTime
                                        .toString(),
                                "userid":
                                    BlocProvider.of<ReservationCubit>(context)
                                        .patientid,
                                "username":
                                    BlocProvider.of<ReservationCubit>(context)
                                        .patientName
                              }).then((value) => showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Text("savedsuccessfully".tr()),
                                      );
                                    }));

                        print('done');
                        // Future.delayed(Duration(seconds: 2), () {
                        //   Navigator.pop(context);
                        // });
                      },
                      child: Text(
                        'book'.tr(),
                        style: TextStyle(
                            color: BlocProvider.of<ReservationCubit>(context)
                                        .selectedTime ==
                                    null
                                ? Colors.black
                                : Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
// FirebaseFirestore.instance
//     .collection('doctor_reservations')
// .where("doctorid", isEqualTo: userItem!['userid'])
//     .snapshots(),
// builder: (context, snapshot) {
// List<DateTime> data = [];
// if (snapshot.data != null) {
// data = snapshot.data!.docs
//     .map((e) => DateTime.parse(
// (e.data() as Map<String, dynamic>)["time"]
//     .toString()))
//     .toList();
// }
