import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/core/core.dart';
import 'package:pregancy/patient/HomePatientscrrens/reservations/reservation_cubit.dart';
import 'package:pregancy/patient/HomePatientscrrens/reservations/reserve_details.dart';

import '../../../doctor/constants.dart';

class reservations extends StatelessWidget {
  reservations({Key? key}) : super(key: key);
  static String reservationsid = 'reversations';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'doctor'.tr(),
        ),
        backgroundColor: kprimarycolor,
      ),
      body: BlocBuilder<ReservationCubit, ReservationState>(
        builder: (context, state) {
          return SafeArea(
              child: state is ReservationNamesLoading
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : BlocProvider.of<ReservationCubit>(context)
                  .users.isEmpty?Center(child: Text('nodoctorregistredyet'.tr()),): ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: BlocProvider.of<ReservationCubit>(context)
                      .users
                      .length,
                  itemBuilder: (context, i) {
                    Map<String, dynamic>? userItem  =
                    BlocProvider.of<ReservationCubit>(context).users[i];
                     print('wwwqq');
                     print(userItem);
                    //  log(BlocProvider.of<ReservationCubit>(context)
                    //     .users[i]
                    //     .toString());

                    return Card(
                        child: ListTile(
                          onTap: () async {
                            // endTime = DateTime.parse(responsebody.docs!["${getToDayName()} to"]);
                            var s=userItem?["${getToDayName()} from"] ?? '';
                            var e=userItem?["${getToDayName()} to"] ?? '';
                            print(s);
                            print(e);
                            // dateTimee(s);
                            // dateTimee(e);
                            await BlocProvider.of<ReservationCubit>(context)
                                .DetectRservationsofDoctor(
                                StartTime: s,
                                endtime: e);
                            await BlocProvider.of<ReservationCubit>(context).TimesReserved(Doctorid: userItem!['userid']);
                            print('useritemmmmmm');
                            log(userItem!.toString());
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => reserveDetails(
                                    userItem: BlocProvider.of<ReservationCubit>(
                                        context)
                                        .users[i])));
                          },
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Container(
                                //   width: 55,
                                //   child: Text(
                                //     " ${userItem!['username']}",
                                //     style: const TextStyle(
                                //         color: kprimarycolor,
                                //         fontSize: 25,
                                //         fontWeight: FontWeight.bold),
                                //   ),
                                // ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      if (userItem != null)
                                        Text(
                                          "${userItem!['username']}",
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 32,
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: kprimarycolor,
                                  ),
                                )
                              ],
                            ),
                          ),
                          //subtitle: Text("clinic location:${users[i]['Clinic Location']}"),
                        ));

                    //subtitle: Text("university: ${users[i]['university']}"),
                  })
            //?.toList() ??[]
          );
        },
      ),
    );
  }
}



//Text(  "university: ${users[i]['University']},Graduation year:${users[i]['Graduation Year']},clinic location:${users[i]['Clinic Location']},Ticket Price:${users[i]['Ticket Price']},username:${users[i]['myusername']}")),
//+getToDayName(),
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:pregancy/patient/HomePatientscrrens/reservations/reserve_details.dart';
//
// import '../../../doctor/constants.dart';
//
// class reservations extends StatefulWidget {
//   const reservations({Key? key}) : super(key: key);
//   static String reservationsid = 'reversations';
//
//   @override
//   State<reservations> createState() => _reservationsState();
// }
//
// //object?.something
// class _reservationsState extends State<reservations> {
//   bool isLoading = true;
//   List users = [];
//   List doctor = [];
//   List time = [];
//
//   CollectionReference userref = FirebaseFirestore.instance.collection('users');
//
//   getData() async {
//     var responsebody = await userref.get();
//
//     responsebody.docs.forEach((element) {
//       setState(() {
//         doctor.add(element.data());
//       });
//     });
//
//     print(doctor);
//   }
//
//   getTime() async {
//     var responsebody = await userref.get();
//
//     responsebody.docs.forEach((element) {
//       setState(() {
//         time.add(element.data());
//       });
//     });
//
//     print(time);
//   }
//
//   getUser() async {
//     var responsebody = await userref.get();
//
//     responsebody.docs.forEach((element) {
//       if (element["type"] == "nurse") {
//         setState(() {
//           users.add(element.data());
//         });
//       }
//     });
//
//     print(users);
//   }
//
//   @override
//   void initState() {
//     init();
//
//     super.initState();
//   }
//
//   init() async {
//     setState(() {
//       isLoading = true;
//     });
//     await getUser();
//     await getData();
//     await getTime();
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Doctors',
//         ),
//         backgroundColor: kprimarycolor,
//       ),
//       body: isLoading
//           ? Center(
//         child: CircularProgressIndicator(),
//       )
//           : SafeArea(
//           child: ListView.builder(
//               shrinkWrap: true,
//               scrollDirection: Axis.vertical,
//               itemCount: users.length,
//               itemBuilder: (context, i) {
//                 Map<String, dynamic>? userItem = users[i];
//
//                 return Card(
//                     child: ListTile(
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (_) =>
//                                 reserveDetails(userItem: userItem)));
//                       },
//                       title: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               width: 55,
//                               child: Text(
//                                 " ${userItem!['username'][0]}",
//                                 style: TextStyle(
//                                     color: kprimarycolor,
//                                     fontSize: 25,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             Expanded(
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   if (userItem != null)
//                                     Text(
//                                       "${userItem['username']}",
//                                       style: TextStyle(
//                                           color: Colors.grey,
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               width: 32,
//                               child: Icon(
//                                 Icons.arrow_forward_ios,
//                                 color: kprimarycolor,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       //subtitle: Text("clinic location:${users[i]['Clinic Location']}"),
//                     ));
//
//                 //subtitle: Text("university: ${users[i]['university']}"),
//               })
//         //?.toList() ??[]
//       ),
//     );
//   }
// // Widget getList() {
// //   List<String> list = getListItems();
// //   ListView myList = new ListView.builder(
// //       itemCount: list.length,
// //       itemBuilder: (context, index) {
// //         return new ListTile(
// //           title: new Text(list[index]),
// //         );
// //       });
// //   return myList;
// // }
// }
// //Text(  "university: ${users[i]['University']},Graduation year:${users[i]['Graduation Year']},clinic location:${users[i]['Clinic Location']},Ticket Price:${users[i]['Ticket Price']},username:${users[i]['myusername']}")),
// //+getToDayName(),
