import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pregancy/doctor2/navigationscreen/LayoutNurse.dart';
import 'package:pregancy/doctor2/screens/homenurse.dart';

import 'package:pregancy/shared_screen/cache_helper.dart';
import '../../core/globalData.dart';
import '../../doctor/core/core.dart';
import '../constant.dart';

class nurseappoitments extends StatefulWidget {
  static String nurseappoitmentsid = 'nurseappoitments';

  @override
  State<nurseappoitments> createState() => _nurseappoitmentsState();
}

class _nurseappoitmentsState extends State<nurseappoitments> {
  final DocumentReference drappointmentssref = FirebaseFirestore.instance
      .collection("users")
      .doc(CacheHelper.getData(key: 'uId'));
  TimeOfDay Time = TimeOfDay.now();
  TimeOfDay Times = TimeOfDay.now();
  TimeOfDay Timess = TimeOfDay.now();
  TimeOfDay Timesss = TimeOfDay.now();
  TimeOfDay Timessss = TimeOfDay.now();
  TimeOfDay Timesssss = TimeOfDay.now();
  TimeOfDay Timessssss = TimeOfDay.now();
  TimeOfDay Timesssssss = TimeOfDay.now();
  TimeOfDay Timessssssss = TimeOfDay.now();
  TimeOfDay Timesssssssss = TimeOfDay.now();
  TimeOfDay Timessssssssss = TimeOfDay.now();
  TimeOfDay Timesssssssssss = TimeOfDay.now();
  TimeOfDay Timessssssssssss = TimeOfDay.now();
  TimeOfDay Timesssssssssssss = TimeOfDay.now();

  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: Time.hour, minute: Time.minute));
  bool firstPress = true;

  @override
  // void initState() {
  //   super.initState();
  //   try {
  //     drappointmentssref.get().then((value) {
  //       print('value');
  //       print(value.data());
  //       DateTime t = DateTime.parse((value.data() as Map)["saturday from"]);
  //       Time = TimeOfDay(hour: t.hour, minute: t.minute);
  //       DateTime tt = DateTime.parse((value.data() as Map)["saturday to"]);
  //       Times = TimeOfDay(hour: tt.hour, minute: tt.minute);
  //       DateTime ttt = DateTime.parse((value.data() as Map)["sunday from"]);
  //       Timess = TimeOfDay(hour: ttt.hour, minute: ttt.minute);
  //       DateTime tttt = DateTime.parse((value.data() as Map)["sunday to"]);
  //       Timesss = TimeOfDay(hour: tttt.hour, minute: tttt.minute);
  //       DateTime ttttt = DateTime.parse((value.data() as Map)["monday from"]);
  //       Timessss = TimeOfDay(hour: ttttt.hour, minute: ttttt.minute);
  //       DateTime tttttt = DateTime.parse((value.data() as Map)["monday to"]);
  //       Timesssss = TimeOfDay(hour: tttttt.hour, minute: tttttt.minute);
  //       DateTime ttttttt =
  //           DateTime.parse((value.data() as Map)["tuesday from"]);
  //       Timessssss = TimeOfDay(hour: ttttttt.hour, minute: ttttttt.minute);
  //       DateTime tttttttt = DateTime.parse((value.data() as Map)["tuesday to"]);
  //       Timesssssss = TimeOfDay(hour: tttttttt.hour, minute: tttttttt.minute);
  //       DateTime ttttttttt =
  //           DateTime.parse((value.data() as Map)["wednesday from"]);
  //       Timessssssss =
  //           TimeOfDay(hour: ttttttttt.hour, minute: ttttttttt.minute);
  //       DateTime tttttttttt =
  //           DateTime.parse((value.data() as Map)["wednesday to"]);
  //       Timesssssssss =
  //           TimeOfDay(hour: tttttttttt.hour, minute: tttttttttt.minute);
  //       DateTime ttttttttttt =
  //           DateTime.parse((value.data() as Map)["thursday from"]);
  //       Timessssssssss =
  //           TimeOfDay(hour: ttttttttttt.hour, minute: ttttttttttt.minute);
  //       DateTime tttttttttttt =
  //           DateTime.parse((value.data() as Map)["thursday to"]);
  //       Timesssssssssss =
  //           TimeOfDay(hour: tttttttttttt.hour, minute: tttttttttttt.minute);
  //       DateTime ttttttttttttt =
  //           DateTime.parse((value.data() as Map)["friday from"]);
  //       Timessssssssssss =
  //           TimeOfDay(hour: ttttttttttttt.hour, minute: ttttttttttttt.minute);
  //       DateTime tttttttttttttt =
  //           DateTime.parse((value.data() as Map)["friday to"]);
  //       Timesssssssssssss =
  //           TimeOfDay(hour: tttttttttttttt.hour, minute: tttttttttttttt.minute);
  //       setState(() {});
  //     });
  //   } catch (e) {}
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appoitments'.tr()),
        backgroundColor: kprimarycolor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 40,
                child: Row(
                  children: [
                     Text(
                      'saturday'.tr(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var time = await pickTime();
                        if (time == null) return;
                        setState(() {
                          Time = time;
                        });
                      },
                      // child: Text(
                      //     '${dateTime.year}/${dateTime.month}/${dateTime.day}${dateTime.day}/${dateTime.hour}'))
                      child: Text(dateTimeFormat(DateTime.now()
                          .copyWith(hour: Time.hour, minute: Time.minute)
                          .toString())),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                     Text(
                      'to'.tr(),
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var times = await pickTime();
                        if (times == null) return;
                        setState(() {
                          Times = times;
                        });
                      },
                      // child: Text(
                      //     '${dateTime.year}/${dateTime.month}/${dateTime.day}${dateTime.day}/${dateTime.hour}'))
                      child: Text(
                        dateTimeFormat(DateTime.now()
                            .copyWith(hour: Times.hour, minute: Times.minute)
                            .toString()),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 40,
                child: Row(
                  children: [
                     Text(
                      'sunday'.tr(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var timess = await pickTime();
                        if (timess == null) return;
                        setState(() {
                          Timess = timess;
                        });
                      },
                      // child: Text(
                      //     '${dateTime.year}/${dateTime.month}/${dateTime.day}${dateTime.day}/${dateTime.hour}'))
                      child: Text(
                        dateTimeFormat(DateTime.now()
                            .copyWith(hour: Timess.hour, minute: Timess.minute)
                            .toString()),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                     Text(
                      'to'.tr(),
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var timesss = await pickTime();
                        if (timesss == null) return;
                        setState(() {
                          Timesss = timesss;
                        });
                      },
                      // child: Text(
                      //     '${dateTime.year}/${dateTime.month}/${dateTime.day}${dateTime.day}/${dateTime.hour}'))
                      child: Text(
                        dateTimeFormat(DateTime.now()
                            .copyWith(
                                hour: Timesss.hour, minute: Timesss.minute)
                            .toString()),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 40,
                child: Row(
                  children: [
                     Text(
                      'monday'.tr(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 55,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var timessss = await pickTime();
                        if (timessss == null) return;
                        setState(() {
                          Timessss = timessss;
                        });
                      },
                      // child: Text(
                      //     '${dateTime.year}/${dateTime.month}/${dateTime.day}${dateTime.day}/${dateTime.hour}'))
                      child: Text(dateTimeFormat(DateTime.now()
                          .copyWith(
                              hour: Timessss.hour, minute: Timessss.minute)
                          .toString())),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                     Text(
                      'to'.tr(),
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var timesssss = await pickTime();
                        if (timesssss == null) return;
                        setState(() {
                          Timesssss = timesssss;
                        });
                      },
                      // child: Text(
                      //     '${dateTime.year}/${dateTime.month}/${dateTime.day}${dateTime.day}/${dateTime.hour}'))
                      child: Text(dateTimeFormat(DateTime.now()
                          .copyWith(
                              hour: Timesssss.hour, minute: Timesssss.minute)
                          .toString())),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 40,
                child: Row(
                  children: [
                     Text(
                      'tuesday'.tr(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 55,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var timessssss = await pickTime();
                        if (timessssss == null) return;
                        setState(() {
                          Timessssss = timessssss;
                        });
                      },
                      // child: Text(
                      //     '${dateTime.year}/${dateTime.month}/${dateTime.day}${dateTime.day}/${dateTime.hour}'))
                      child: Text(dateTimeFormat(DateTime.now()
                          .copyWith(
                              hour: Timessssss.hour, minute: Timessssss.minute)
                          .toString())),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                     Text(
                      'to'.tr(),
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var timesssssss = await pickTime();
                        if (timesssssss == null) return;
                        setState(() {
                          Timesssssss = timesssssss;
                        });
                      },
                      // child: Text(
                      //     '${dateTime.year}/${dateTime.month}/${dateTime.day}${dateTime.day}/${dateTime.hour}'))
                      child: Text(dateTimeFormat(DateTime.now()
                          .copyWith(
                              hour: Timesssssss.hour,
                              minute: Timesssssss.minute)
                          .toString())),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 40,
                child: Row(
                  children: [
                     Text(
                      'wednesday'.tr(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          var timessssssss = await pickTime();
                          if (timessssssss == null) return;
                          setState(() {
                            Timessssssss = timessssssss;
                          });
                        },
                        // child: Text(
                        //     '${dateTime.year}/${dateTime.month}/${dateTime.day}${dateTime.day}/${dateTime.hour}'))
                        child: Text(
                          dateTimeFormat(DateTime.now()
                              .copyWith(
                                  hour: Timessssssss.hour,
                                  minute: Timessssssss.minute)
                              .toString()),
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                     Text(
                      'to'.tr(),
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var timesssssssss = await pickTime();
                        if (timesssssssss == null) return;
                        setState(() {
                          Timesssssssss = timesssssssss;
                        });
                      },
                      // child: Text(
                      //     '${dateTime.year}/${dateTime.month}/${dateTime.day}${dateTime.day}/${dateTime.hour}'))
                      child: Text(dateTimeFormat(DateTime.now()
                          .copyWith(
                              hour: Timesssssssss.hour,
                              minute: Timesssssssss.minute)
                          .toString())),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 40,
                child: Row(
                  children: [
                     Text(
                      'thursday'.tr(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var timessssssssss = await pickTime();
                        if (timessssssssss == null) return;
                        setState(() {
                          Timessssssssss = timessssssssss;
                        });
                      },
                      // child: Text(
                      child: Text(dateTimeFormat(DateTime.now()
                          .copyWith(
                              hour: Timessssssssss.hour,
                              minute: Timessssssssss.minute)
                          .toString())),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                     Text(
                      'to'.tr(),
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var timesssssssssss = await pickTime();
                        if (timesssssssssss == null) return;
                        setState(() {
                          Timesssssssssss = timesssssssssss;
                        });
                      },
                      // child: Text(
                      //     '${dateTime.year}/${dateTime.month}/${dateTime.day}${dateTime.day}/${dateTime.hour}'))
                      child: Text(dateTimeFormat(DateTime.now()
                          .copyWith(
                              hour: Timesssssssssss.hour,
                              minute: Timesssssssssss.minute)
                          .toString())),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 40,
                child: Row(
                  children: [
                     Text(
                      'friday'.tr(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var timessssssssssss = await pickTime();
                        if (timessssssssssss == null) return;
                        setState(() {
                          Timessssssssssss = timessssssssssss;
                        });
                      },
                      // child: Text(
                      //     '${dateTime.year}/${dateTime.month}/${dateTime.day}${dateTime.day}/${dateTime.hour}'))
                      child: Text(dateTimeFormat(DateTime.now()
                          .copyWith(
                              hour: Timessssssssssss.hour,
                              minute: Timessssssssssss.minute)
                          .toString())),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                     Text(
                      'to'.tr(),
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var timesssssssssssss = await pickTime();
                        if (timesssssssssssss == null) return;
                        setState(() {
                          Timesssssssssssss = timesssssssssssss;
                        });
                      },
                      // child: Text(
                      //     '${dateTime.year}/${dateTime.month}/${dateTime.day}${dateTime.day}/${dateTime.hour}'))
                      child: Text(dateTimeFormat(DateTime.now()
                          .copyWith(
                              hour: Timesssssssssssss.hour,
                              minute: Timesssssssssssss.minute)
                          .toString())),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,
                alignment: AlignmentDirectional.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                        child:  Text('submit'.tr()),
                        textColor: Colors.white,
                        color: kprimarycolor,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const AlertDialog(
                                  title: Text("Success"),
                                  content: Text("Saved successfully"),
                                );
                              });

                          updateDrAppointments(context);
                          Future.delayed(const Duration(seconds: 2), () {
                            Navigator.pushNamed(
                                context, LayOutNurse.homenursepageid);
                          });
                        }
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>doctor_appointments()));
                        ),
                    const SizedBox(
                      width: 20,
                    ),
                    // Opacity(
                    //   opacity: firstPress? 1.0 : 0.2,
                    //   child: MaterialButton(
                    //       child: Text('Submit'),
                    //       textColor: Colors.white,
                    //       color: kprimarycolor,
                    //       onPressed:(){
                    //         if(firstPress){
                    //           buttonFunction();
                    //           addDrAppointments(context);
                    //         }
                    //         showDialog(
                    //             context: context,
                    //             builder: (BuildContext context) {
                    //               return AlertDialog(
                    //                 title: Text("Success"),
                    //                 content: Text("Saved successfully"),
                    //               );
                    //             });
                    //       }
                    //
                    //     // firstPress?(){
                    //     //   setState(() =>
                    //     //     firstPress=false);
                    //     // }
                    //
                    //
                    //     //addDrAppointments(context);
                    //
                    //
                    //     //addDrAppointments(context);
                    //
                    //
                    //     //Navigator.push(context, MaterialPageRoute(builder: (context)=>doctor_appointments()));
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  addDrAppointments(context) async {
    await drappointmentssref.update({
      "saturday from": DateTime.now()
          .copyWith(hour: Time.hour, minute: Time.minute)
          .toString(),
      "saturday to": DateTime.now()
          .copyWith(hour: Times.hour, minute: Times.minute)
          .toString(),
      "sunday from": DateTime.now()
          .copyWith(hour: Timess.hour, minute: Timess.minute)
          .toString(),
      "sunday to": DateTime.now()
          .copyWith(hour: Timesss.hour, minute: Timesss.minute)
          .toString(),
      "monday from": DateTime.now()
          .copyWith(hour: Timessss.hour, minute: Timessss.minute)
          .toString(),
      "monday to": DateTime.now()
          .copyWith(hour: Timesssss.hour, minute: Timesssss.minute)
          .toString(),
      "tuesday from": DateTime.now()
          .copyWith(hour: Timessssss.hour, minute: Timessssss.minute)
          .toString(),
      "tuesday to": DateTime.now()
          .copyWith(hour: Timesssssss.hour, minute: Timesssssss.minute)
          .toString(),
      "wednesday from": DateTime.now()
          .copyWith(hour: Timessssssss.hour, minute: Timessssssss.minute)
          .toString(),
      "wednesday to": DateTime.now()
          .copyWith(hour: Timesssssssss.hour, minute: Timesssssssss.minute)
          .toString(),
      "thursday from": DateTime.now()
          .copyWith(hour: Timessssssssss.hour, minute: Timessssssssss.minute)
          .toString(),
      "thursday to": DateTime.now()
          .copyWith(hour: Timesssssssssss.hour, minute: Timesssssssssss.minute)
          .toString(),
      "friday from": DateTime.now()
          .copyWith(
              hour: Timessssssssssss.hour, minute: Timessssssssssss.minute)
          .toString(),
      "friday to": DateTime.now()
          .copyWith(
              hour: Timesssssssssssss.hour, minute: Timesssssssssssss.minute)
          .toString(),
    });
  }

  updateDrAppointments(context) async {
    await drappointmentssref.update({
      "saturday from": DateTime.now()
          .copyWith(hour: Time.hour, minute: Time.minute)
          .toString(),
      "saturday to": DateTime.now()
          .copyWith(hour: Times.hour, minute: Times.minute)
          .toString(),
      "sunday from": DateTime.now()
          .copyWith(hour: Timess.hour, minute: Timess.minute)
          .toString(),
      "sunday to": DateTime.now()
          .copyWith(hour: Timesss.hour, minute: Timesss.minute)
          .toString(),
      "monday from": DateTime.now()
          .copyWith(hour: Timessss.hour, minute: Timessss.minute)
          .toString(),
      "monday to": DateTime.now()
          .copyWith(hour: Timesssss.hour, minute: Timesssss.minute)
          .toString(),
      "tuesday from": DateTime.now()
          .copyWith(hour: Timessssss.hour, minute: Timessssss.minute)
          .toString(),
      "tuesday to": DateTime.now()
          .copyWith(hour: Timesssssss.hour, minute: Timesssssss.minute)
          .toString(),
      "wednesday from": DateTime.now()
          .copyWith(hour: Timessssssss.hour, minute: Timessssssss.minute)
          .toString(),
      "wednesday to": DateTime.now()
          .copyWith(hour: Timesssssssss.hour, minute: Timesssssssss.minute)
          .toString(),
      "thursday from": DateTime.now()
          .copyWith(hour: Timessssssssss.hour, minute: Timessssssssss.minute)
          .toString(),
      "thursday to": DateTime.now()
          .copyWith(hour: Timesssssssssss.hour, minute: Timesssssssssss.minute)
          .toString(),
      "friday from": DateTime.now()
          .copyWith(
              hour: Timessssssssssss.hour, minute: Timessssssssssss.minute)
          .toString(),
      "friday to": DateTime.now()
          .copyWith(
              hour: Timesssssssssssss.hour, minute: Timesssssssssssss.minute)
          .toString(),
    });
  }

  void buttonFunction() {
    setState(() {
      firstPress = false;
      print('clicked once');
    });
  }
}
