// class reservations extends StatelessWidget {
//   reservations({Key? key}) : super(key: key);
//   static String reservationsid = 'reversations';
//   Map<String, dynamic>? userItem = {};
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Doctors',
//         ),
//         backgroundColor: kprimarycolor,
//       ),
//       body: BlocBuilder<ReservationCubit, ReservationState>(
//         builder: (context, state) {
//           return SafeArea(
//               child: state is ReservationNamesLoading
//                   ? const Center(
//                 child: CircularProgressIndicator(),
//               )
//                   : ListView.builder(
//                   shrinkWrap: true,
//                   scrollDirection: Axis.vertical,
//                   itemCount: BlocProvider.of<ReservationCubit>(context)
//                       .users
//                       .length,
//                   itemBuilder: (context, i) {
//                     userItem =
//                     BlocProvider.of<ReservationCubit>(context).users[i];
//                     print('aya');
//                     log(BlocProvider.of<ReservationCubit>(context)
//                         .users[i]
//                         .toString());
//
//                     return Card(
//                         child: ListTile(
//                           onTap: () async {
//                             // endTime = DateTime.parse(responsebody.docs!["${getToDayName()} to"]);
//                             var s=userItem?["${getToDayName()}"'from'] ?? '';
//                             var e=userItem?["${getToDayName()}"'to'] ?? '';
//                             print(s);
//                             print(e);
//                             // dateTimee(s);
//                             // dateTimee(e);
//                             await BlocProvider.of<ReservationCubit>(context)
//                                 .DetectRservationsofDoctor(
//                                 StartTime: s,
//                                 endtime: e);
//                             print('useritem');
//                             print(userItem);
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (_) => reserveDetails(
//                                     userItem: BlocProvider.of<ReservationCubit>(
//                                         context)
//                                         .users[i])));
//                           },
//                           title: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   width: 55,
//                                   child: Text(
//                                     " ${userItem!['username'][0]}",
//                                     style: const TextStyle(
//                                         color: kprimarycolor,
//                                         fontSize: 25,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     children: [
//                                       if (userItem != null)
//                                         Text(
//                                           "${userItem!['username']}",
//                                           style: const TextStyle(
//                                               color: Colors.grey,
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   width: 32,
//                                   child: const Icon(
//                                     Icons.arrow_forward_ios,
//                                     color: kprimarycolor,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           //subtitle: Text("clinic location:${users[i]['Clinic Location']}"),
//                         ));
//
//                     //subtitle: Text("university: ${users[i]['university']}"),
//                   })
//             //?.toList() ??[]
//           );
//         },
//       ),
//     );
//   }
// }





// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pregancy/patient/HomePatientscrrens/reservations/reservation_cubit.dart';
// import 'package:pregancy/shared_screen/cache_helper.dart';
// import '../../../core/core.dart';
// import '../../constants.dart';
// import '../../../core/globalData.dart';
//
// class reserveDetails extends StatelessWidget {
//   reserveDetails({Key? key, this.userItem}) : super(key: key);
//   Map<String, dynamic>? userItem;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Doctor Profile'),
//         backgroundColor: kprimarycolor,
//       ),
//       body: BlocBuilder<ReservationCubit, ReservationState>(
//         builder: (context, state) {
//           return Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 30),
//                 Text(
//                   "${userItem!['username']}",
//                   style: const TextStyle(
//                       color: kprimarycolor,
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 20),
//                 userItem!['University'] == null &&
//                         userItem!['Graduation Year'] == null &&
//                         userItem!['Clinic Location'] == null &&
//                         userItem!['Ticket Price'] == null
//                     ? const Center(
//                         child: Text(
//                           'No Reservations Added ,yet',
//                           style: TextStyle(color: kprimarycolor),
//                         ),
//                       )
//                     : Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "university: ${userItem!['University']}",
//                             style: TextStyle(
//                               color: Colors.grey[700],
//                               fontSize: 18,
//                             ),
//                           ),
//                           Text(
//                             "Graduation year:${userItem!['Graduation Year']}",
//                             style: TextStyle(
//                               color: Colors.grey[700],
//                               fontSize: 18,
//                             ),
//                           ),
//                           Text(
//                             "clinic location:${userItem!['Clinic Location']}",
//                             style: TextStyle(
//                               color: Colors.grey[700],
//                               fontSize: 18,
//                             ),
//                           ),
//                           Text(
//                             "Ticket Price:${userItem!['Ticket Price']}",
//                             style: TextStyle(
//                               color: Colors.grey[700],
//                               fontSize: 18,
//                             ),
//                           ),
//                         ],
//                       ),
//                 const SizedBox(height: 40),
//                 BlocProvider.of<ReservationCubit>(context)
//                     .reservationAvailableTimes
//                     .isNotEmpty?
//
//
//
//                          Container(
//                           height: 100,
//                           child: ListView.builder(
//                               itemBuilder: (context, index) {
//                                 DateTime item =
//                                     BlocProvider.of<ReservationCubit>(context)
//                                         .reservationAvailableTimes[index];
//                                 return InkWell(
//                                   onTap:
//                                        () {
//                                           BlocProvider.of<ReservationCubit>(
//                                                   context)
//                                               .selectedTime = item;
//                                           BlocProvider.of<ReservationCubit>(
//                                                       context)
//                                                   .doctoruserid =
//                                               userItem!['userid']!;
//                                           BlocProvider.of<ReservationCubit>(
//                                                       context)
//                                                   .patientid =
//                                               CacheHelper.getData(key: 'uId')
//                                                   .toString();
//                                           BlocProvider.of<ReservationCubit>(
//                                                       context)
//                                                   .patientName =
//                                               globalData.userData!["username"]
//                                                   .toString();
//
//                                           // setState(() {});
//                                         },
//                                   child: Container(
//                                     alignment: Alignment.center,
//                                     decoration: BoxDecoration(
//                                         color:
//                                                 kprimarycolor,
//                                         borderRadius:
//                                             BorderRadius.circular(10)),
//                                     padding: const EdgeInsets.all(20),
//                                     margin: const EdgeInsets.symmetric(
//                                         horizontal: 8),
//                                     child: Text(
//                                       dateTimeFormat(item.toString()),
//                                       style: TextStyle(
//                                           color:
//
//                                               Colors.white,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                 );
//                               },
//                               itemCount:
//                                   BlocProvider.of<ReservationCubit>(context)
//                                       .reservationAvailableTimes
//                                       .length,
//                               scrollDirection: Axis.horizontal),
//                         ):Text('No times Determined by Doctor,yet'),
//
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Center(
//                   child: Container(
//                     //alignment: AlignmentDirectional.topEnd,
//                     height: 30,
//                     width: 80,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadiusDirectional.circular(10),
//                       color: BlocProvider.of<ReservationCubit>(context)
//                                   .selectedTime ==
//                               null
//                           ? Colors.grey.shade300
//                           : kprimarycolor,
//                     ),
//                     child: MaterialButton(
//                       onPressed: BlocProvider.of<ReservationCubit>(context)
//                                   .selectedTime ==
//                               null
//                           ? null
//                           : () async {
//                               FirebaseFirestore.instance
//                                   .collection('doctor_reservations')
//                                   .add({
//                                 "doctorid":
//                                     BlocProvider.of<ReservationCubit>(context)
//                                         .doctoruserid,
//                                 "time":
//                                     BlocProvider.of<ReservationCubit>(context)
//                                         .selectedTime
//                                         .toString(),
//                                 "userid":
//                                     BlocProvider.of<ReservationCubit>(context)
//                                         .patientid,
//                                 "username":
//                                     BlocProvider.of<ReservationCubit>(context)
//                                         .patientName
//                               });
//                               showDialog(
//                                   context: context,
//                                   builder: (BuildContext context) {
//                                     return const AlertDialog(
//                                       title: Text("Success"),
//                                       content: Text("Saved successfully"),
//                                     );
//                                   });
//                               // Future.delayed(Duration(seconds: 2), () {
//                               //   Navigator.pop(context);
//                               // });
//                             },
//                       child: Text(
//                         'Book',
//                         style: TextStyle(
//                             color: BlocProvider.of<ReservationCubit>(context)
//                                         .selectedTime ==
//                                     null
//                                 ? Colors.black
//                                 : Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// // FirebaseFirestore.instance
// //     .collection('doctor_reservations')
// // .where("doctorid", isEqualTo: userItem!['userid'])
// //     .snapshots(),
// // builder: (context, snapshot) {
// // List<DateTime> data = [];
// // if (snapshot.data != null) {
// // data = snapshot.data!.docs
// //     .map((e) => DateTime.parse(
// // (e.data() as Map<String, dynamic>)["time"]
// //     .toString()))
// //     .toList();
// // }
