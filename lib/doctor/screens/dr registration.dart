// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:pregancy/doctor/constants.dart';
// 
// import 'package:pregancy/shared_screen/cache_helper.dart';
//
// import '../weidgetes/alert.dart';
// import '../weidgetes/subtitleofpregancyform.dart';
// import 'dr_appointments.dart';
// import '../../core/globalData.dart';
//
// class doctor_registration extends StatefulWidget {
//   const doctor_registration({Key? key}) : super(key: key);
//   static String regidd = 'reg';
//
//   @override
//   State<doctor_registration> createState() => _doctor_registrationState();
// }
//
// class _doctor_registrationState extends State<doctor_registration> {
//   GlobalKey<FormState> formkey = GlobalKey();
//   TextEditingController universityController = TextEditingController();
//   TextEditingController graduationYearController = TextEditingController();
//   TextEditingController clinicLocationController = TextEditingController();
//   TextEditingController ticketPriceController = TextEditingController();
//   final DocumentReference registrationref = FirebaseFirestore.instance
//       .collection("users")
//       .doc(CacheHelper.getData(key: 'uId'));
//   String dropdownValue = 'Saturday';
//
//   @override
//   void initState() {
//     super.initState();
//
//     registrationref.get().then((value) {
//       try {
//         universityController.text = (value.data() as Map)["University"];
//         graduationYearController.text = (value.data()
//             as Map)[yearofGraduation];
//         clinicLocationController.text =
//             (value.data() as Map)[locationofclinc];
//         ticketPriceController.text =
//             (value.data() as Map)[ticketprice];
//       } catch (e) {}
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(reservationResgister),
//         backgroundColor: kprimarycolor,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 15),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Form(
//               key: formkey,
//               child: Column(
//                 children: [
//                   Subtitleofpregnacyform(title: 'Personal Information'),
//
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   TextFormField(
//                     controller: universityController,
//                     validator: (val) {
//                       if (val!.isEmpty) {
//                         return 'field required';
//                       }
//
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                         prefixIcon: const Icon(Icons.cast_for_education),
//                         hintText: univercity,
//                         border: const OutlineInputBorder(
//                             borderSide: BorderSide(width: 1))),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   TextFormField(
//                     controller: graduationYearController,
//                     validator: (val) {
//                       if (val!.isEmpty) {
//                         return 'field required';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                         prefixIcon: const Icon(Icons.cast_for_education),
//                         hintText: yearofGraduation,
//                         border: const OutlineInputBorder(
//                             borderSide: BorderSide(width: 1))),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   TextFormField(
//                     controller: clinicLocationController,
//                     validator: (val) {
//                       if (val!.isEmpty) {
//                         return 'field required';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                         prefixIcon: const Icon(Icons.location_city),
//                         hintText: locationofclinc,
//                         border: const OutlineInputBorder(
//                             borderSide: BorderSide(width: 1))),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   TextFormField(
//                     controller: ticketPriceController,
//                     validator: (val) {
//                       if (val!.isEmpty) {
//                         return 'field required';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                         prefixIcon: const Icon(Icons.cast_for_education),
//                         hintText: ticketprice,
//                         border: const OutlineInputBorder(
//                             borderSide: BorderSide(width: 1))),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   //       DropdownButton<String>(
//                   //         isExpanded: true,
//                   //         value: dropdownValue,
//                   //         items:<String> ['Saturday','Sunday','Monday','Tuesday','Wednesday','Thursday','Friday'].map<DropdownMenuItem<String>>(
//                   //             (String value){
//                   //               return DropdownMenuItem<String>(
//                   //                   value: value,
//                   //                   child: Text(
//                   //                     value
//                   //                   ),
//                   //               );
//                   //
//                   //             }).toList(),
//                   //           onChanged: (String? newValue){
//                   //           if(newValue!=dropdownValue|| newValue==dropdownValue){
//                   //             Navigator.push(context, MaterialPageRoute(builder: (context)=>doctor_appointments()));
//                   //           }
//                   //           setState(() {
//                   //             dropdownValue=newValue!;
//                   //           });
//                   // },
//                   //         ),
//                   MaterialButton(
//                       child: Text(submit),
//                       textColor: Colors.white,
//                       color: kprimarycolor,
//                       onPressed: () {
//                         addDrRegistration(context);
//                         //Navigator.push(context, MaterialPageRoute(builder: (context)=>doctor_appointments()));
//                         Navigator.pop(context);
//                       })
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   addDrRegistration(context) async {
//     var formdata = formkey.currentState;
//
//     if (formdata!.validate()) {
//       showLoading(context);
//       formdata.save();
//
//       await registrationref.update({
//         "University": universityController.text,
//         "Graduation Year": graduationYearController.text,
//         "Clinic Location": clinicLocationController.text,
//         "Ticket Price": ticketPriceController.text,
//       }).then((value) {
//         Navigator.pop(context);
//         // Navigator.pushReplacement(context,
//         //     MaterialPageRoute(builder: (context) => doctor_appointments()));
//       }).catchError((e) {
//         print("$e");
//       });
//       ;
//     }
//   }
// }
