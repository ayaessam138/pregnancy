// import 'dart:convert';
//
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pregancy/core/globalData.dart';
// import 'package:pregancy/doctor/cubit/pregancyform_cubit/pregancyform_cubit.dart';
// import 'package:pregancy/doctor/screens/DoctorLayout.dart';
// import 'package:pregancy/doctor/weidgetes/Dropdownbutton.dart';
// import 'package:pregancy/doctor/weidgetes/custom_button.dart';
// import 'package:pregancy/doctor2/navigationscreen/LayoutNurse.dart';
// import 'package:pregancy/doctor2/screens/homenurse.dart';
// import 'package:pregancy/patient/screens/DoctorLayout.dart';
// import 'package:pregancy/storage/storage_keys.dart';
// import 'package:pregancy/storage/storage_repo_impl.dart';
// import '../core/core.dart';
// import '../doctor/constants.dart';
// import '../doctor/weidgetes/alert.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'cache_helper.dart';
//
// class SignUp extends StatefulWidget {
//   SignUp({Key? key}) : super(key: key);
//
//   @override
//   _SignUpState createState() => _SignUpState();
// }
//
// class _SignUpState extends State<SignUp> {
//   @override
//   void initState() {
//     BlocProvider.of<PregancyformCubit>(context).fetchNurses();
//     super.initState();
//   }
//
//   TextEditingController lastPeriod = TextEditingController();
//   DateTime date = DateTime.now();
//   late DateTime newDate = DateTime.now();
//   DateTime lastPerioddate = DateTime.now();
//   late DateTime lastPeriodnewDate = DateTime.now();
//   var myusername, mypassword, myemail, Age;
//   String type = "patient";
//
//   GlobalKey<FormState> formstate = new GlobalKey<FormState>();
//   userAge(DateTime curruntDate, DateTime UsersBirthDate) {
//     Duration parse = curruntDate.difference(UsersBirthDate).abs();
//     return "${parse.inDays ~/ 360} Years ${((parse.inDays % 360) ~/ 30)} Month ${(parse.inDays % 360) % 30} Days";
//   }
//
//   TextEditingController age = TextEditingController();
//
//   signUp() async {
//     var formdata = formstate.currentState;
//     if (formdata!.validate()) {
//       formdata.save();
//
//       try {
//         showLoading(context);
//         UserCredential userCredential = await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(
//                 email: myemail, password: mypassword);
//         return userCredential;
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'weak-password') {
//           Navigator.of(context).pop();
//           AwesomeDialog(
//               context: context,
//               title: "Error",
//               body: const Text("Password is to weak"))
//             ..show();
//         } else if (e.code == 'email-already-in-use') {
//           Navigator.of(context).pop();
//           AwesomeDialog(
//               context: context,
//               title: "Error",
//               body: const Text("The account already exists for that email"))
//             ..show();
//         }
//       } catch (e) {
//         print(e);
//       }
//     } else {}
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sign UP'),
//         backgroundColor: kprimarycolor,
//       ),
//       body: ListView(
//         children: [
//           TextButton(
//               onPressed: () {
//                 setState(() {
//                   type = "doctor";
//                 });
//               },
//               child: Container(
//                 color: type == "doctor" ? Colors.pink.shade100 : null,
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//                   child: Text(
//                     'Nurse',
//                     style: TextStyle(
//                       color: type == "doctor" ? Colors.white : null,
//                     ),
//                   ),
//                 ),
//               )),
//           TextButton(
//               onPressed: () {
//                 setState(() {
//                   type = "nurse";
//                 });
//               },
//               child: Container(
//                 color: type == "nurse" ? Colors.pink.shade100 : null,
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//                   child: Text(
//                     'Doctor',
//                     style: TextStyle(
//                       color: type == "nurse" ? Colors.white : null,
//                     ),
//                   ),
//                 ),
//               )),
//           TextButton(
//               onPressed: () {
//                 setState(() {
//                   type = "patient";
//                 });
//               },
//               child: Container(
//                 color: type == "patient" ? Colors.pink.shade100 : null,
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//                   child: Text(
//                     'patient',
//                     style: TextStyle(
//                       color: type == "patient" ? Colors.white : null,
//                     ),
//                   ),
//                 ),
//               )),
//           const SizedBox(height: 20),
//           Container(
//             padding: const EdgeInsets.all(20),
//             child: Form(
//                 key: formstate,
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       onSaved: (val) {
//                         myusername = val;
//                       },
//                       validator: (val) {
//                         if (val!.length > 100) {
//                           return "username can't to be larger than 100 letter";
//                         }
//                         if (val.length < 2) {
//                           return "username can't to be less than 2 letter";
//                         }
//                         return null;
//                       },
//                       decoration: const InputDecoration(
//                           prefixIcon: Icon(Icons.person),
//                           hintText: "username",
//                           border: OutlineInputBorder(
//                               borderSide: BorderSide(width: 1))),
//                     ),
//                     const SizedBox(height: 20),
//                     TextFormField(
//                       controller: age,
//                       //initialValue: dateTimee(newDate!),
//                       readOnly: true,
//                       onTap: () async {
//                         newDate = (await showDatePicker(
//                           context: context,
//                           initialDate: date,
//                           firstDate: DateTime(1980),
//                           lastDate: DateTime(21000),
//                         ))!;
//                         if (newDate == null) {
//                           return;
//                         }
//
//                         setState(() {
//                           date = newDate;
//                           //age = AgeCalculator.age(age as DateTime)
//                           //as TextEditingController;
//                           age.value =
//                               TextEditingValue(text: dateTimee(newDate));
//                         });
//                         //duration = AgeCalculator.age(age as DateTime);
//                       },
//                       // onSaved: (val) {
//                       //   age.text = val!;
//                       // },
//                       validator: (val) {
//                         if (val == null || val.isEmpty) {
//                           return "Birthdate is required";
//                         }
//                         // if (val!.length > 100) {
//                         //   return "username can't to be larger than 100 letter";
//                         // }
//                         // if (val.length < 2) {
//                         //   return "username can't to be less than 2 letter";
//                         // }
//                         return null;
//                       },
//                       decoration: const InputDecoration(
//                           prefixIcon: Icon(Icons.person),
//                           hintText: "Birth Date",
//                           border: OutlineInputBorder(
//                               borderSide: BorderSide(width: 1))),
//                     ),
//                     const SizedBox(height: 20),
//                     TextFormField(
//                       onSaved: (val) {
//                         myemail = val;
//                       },
//                       validator: (val) {
//                         if (val!.length > 100) {
//                           return "Email can't to be larger than 100 letter";
//                         }
//                         if (val.length < 2) {
//                           return "Email can't to be less than 2 letter";
//                         }
//                         return null;
//                       },
//                       decoration: const InputDecoration(
//                           prefixIcon: Icon(Icons.person),
//                           hintText: "email",
//                           border: OutlineInputBorder(
//                               borderSide: BorderSide(width: 1))),
//                     ),
//                     const SizedBox(height: 20),
//                     TextFormField(
//                       onSaved: (val) {
//                         mypassword = val;
//                       },
//                       validator: (val) {
//                         if (val!.length > 100) {
//                           return "Password can't to be larger than 100 letter";
//                         }
//                         if (val.length < 4) {
//                           return "Password can't to be less than 4 letter";
//                         }
//                         return null;
//                       },
//                       obscureText: true,
//                       decoration: const InputDecoration(
//                           prefixIcon: Icon(Icons.person),
//                           hintText: "password",
//                           border: OutlineInputBorder(
//                               borderSide: BorderSide(width: 1))),
//                     ),
//                     const SizedBox(height: 20),
//                     if (type == "patient")
//                       TextFormField(
//                         controller: lastPeriod,
//                         readOnly: true,
//                         onTap: () async {
//                           lastPeriodnewDate = (await showDatePicker(
//                             context: context,
//                             initialDate: date,
//                             firstDate: DateTime(1980),
//                             lastDate: DateTime(21000),
//                           ))!;
//                           if (lastPeriodnewDate == null) {
//                             return;
//                           }
//
//                           setState(() {
//                             lastPerioddate = lastPeriodnewDate;
//                             lastPeriod.value = TextEditingValue(
//                                 text: dateTimee(lastPeriodnewDate));
//                           });
//                         },
//                         //obscureText: true,
//                         decoration: const InputDecoration(
//                             prefixIcon: Icon(Icons.person),
//                             hintText: "Last Period",
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(width: 1))),
//                       ),
//                     if (type == 'nurse')
//                       Dropdownbuttonformfield4(
//                           text: 'Nurse',
//                           onchanged: (value) {
//                             setState(() {
//                               user = value;
//                             });
//                           }),
//                     custoumbutton(
//                       text: 'tab',
//                       onTap: (() {
//                         BlocProvider.of<PregancyformCubit>(context)
//                             .fetchNurses();
//                       }),
//                     ),
//                     Container(
//                         margin: const EdgeInsets.all(10),
//                         child: Row(
//                           children: [
//                             const Text("if you have Account "),
//                             InkWell(
//                               onTap: () {
//                                 Navigator.of(context).pushNamed("log");
//                               },
//                               child: const Text(
//                                 "Click Here",
//                                 style: TextStyle(color: Colors.blue),
//                               ),
//                             )
//                           ],
//                         )),
//                     Container(
//                         child: MaterialButton(
//                       onPressed: () async {
//                         UserCredential response = await signUp();
//
//                         print("===================");
//                         if (response != null) {
//                           var patientData = {
//                             "username": myusername,
//                             "email": myemail,
//                             "age": age.text.toString(),
//                             "type": type,
//                             "last pariod": lastPeriod.text.toString(),
//                             "Delvier Time": calculateDeliverTime(
//                                 lastPerioddate.year,
//                                 lastPerioddate.month,
//                                 lastPerioddate.day),
//                             // "userid": FirebaseAuth.instance.currentUser?.uid,
//                             "userid": response.user!.uid,
//                           };
//                           var doctorData = {
//                             "username": myusername,
//                             "email": myemail,
//                             "age": age.text.toString(),
//                             "type":
//                                 type, // "userid": FirebaseAuth.instance.currentUser?.uid,
//                             "userid": response.user!.uid,
//                           };
//                           var nurseData = {
//                             "username": myusername,
//                             "email": myemail,
//                             "age": age.text.toString(),
//                             "type":
//                                 type, // "userid": FirebaseAuth.instance.currentUser?.uid,
//                             "userid": response.user!.uid,
//                           };
//
//                           // await FirebaseFirestore.instance
//                           //     .collection("users")
//                           //     .add(type == "doctor" ? doctorData : patientData)
//                           //     .then((value) {
//                           //   //value.update({"userid": value.id});
//                           // });
//                           await FirebaseFirestore.instance
//                               .collection("users")
//                               .doc('${response.user!.uid}')
//                               .set(type == "doctor"
//                                   ? doctorData
//                                   : type == 'nurse'
//                                       ? nurseData
//                                       : patientData)
//                               .then((value) async {
//                             await FirebaseFirestore.instance
//                                 .collection('users')
//                                 .doc('${response.user!.uid}')
//                                 .get()
//                                 .then((value) {
//                               email = value.get('email');
//                             });
//                           });
//                           // value.update({"userid": value.id});
//
//                           if (type == "doctor") {
//                             // doctorData["userid"] = value.id;
//                             CacheHelper.saveData(
//                                 key: 'uId', value: response.user!.uid);
//
//                             doctorData["userid"] = response.user!.uid;
//                             StorageRepoImpl().write(
//                                 key: StorageKeys.userdata,
//                                 value: json.encode(doctorData));
//                             globalData.userData = doctorData;
//
//                             Navigator.of(context).pushNamedAndRemoveUntil(
//                                 homepage.homeid, (route) => false);
//                           } else if (type == 'nurse') {
//                             CacheHelper.saveData(
//                                 key: 'uId', value: response.user!.uid);
//                             nurseData["userid"] = response.user!.uid;
//                             StorageRepoImpl().write(
//                                 key: StorageKeys.userdata,
//                                 value: json.encode(nurseData));
//                             globalData.userData = nurseData;
//                             await FirebaseFirestore.instance
//                                 .collection('users')
//                                 .doc(user!['userid'])
//                                 .update({'nurseid': response.user!.uid});
//                             Navigator.of(context).pushNamedAndRemoveUntil(
//                                 homepagenurse.homenursepageid,
//                                 (route) => false);
//                           } else {
//                             //  patientData["userid"] = value.id;
//                             CacheHelper.saveData(
//                                 key: 'uId', value: response.user!.uid);
//                             patientData["userid"] = response.user!.uid;
//                             StorageRepoImpl().write(
//                                 key: StorageKeys.userdata,
//                                 value: json.encode(patientData));
//                             globalData.userData = patientData;
//
//                             Navigator.of(context).pushNamedAndRemoveUntil(
//                                 homePatient.homeid, (route) => false);
//                           }
//
//                           print("===================");
//                         } else {
//                           print("Sign Up Faild");
//                         }
//                       },
//                       color: kprimarycolor,
//                       child: Text(
//                         "Sign Up",
//                         style: Theme.of(context).textTheme.headline6,
//                       ),
//                     ))
//                   ],
//                 )),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// String calculateDeliverTime(year, month, day) {
//   DateTime initialDate = DateTime(year, month, day);
//   int numberOfDays = 252;
//
//   DateTime resultDate = initialDate.add(Duration(days: numberOfDays));
//
//   String formattedDate = DateFormat('MM/dd/yyyy').format(resultDate);
//   return formattedDate;
// }
