




// import 'dart:convert';

// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:pregancy/core/globalData.dart';
// import 'package:pregancy/doctor/constants.dart';
// import 'package:pregancy/doctor/screens/DoctorLayout.dart';
// import 'package:pregancy/patient/screens/DoctorLayout.dart';
// import 'package:pregancy/storage/storage_keys.dart';
// import 'package:pregancy/storage/storage_repo_impl.dart';
// import '../core/core.dart';
// import '../doctor/core/core.dart';
// import '../doctor/weidgetes/alert.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';

// class SignUp extends StatefulWidget {
//   SignUp({Key? key}) : super(key: key);

//   @override
//   _SignUpState createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   DateTime date = DateTime.now();
//   late DateTime newDate = DateTime.now();
//   DateTime lastPerioddate = DateTime.now();
//   late DateTime lastPeriodnewDate = DateTime.now();
//   TextEditingController lastPeriod = TextEditingController();
//   var myusername, mypassword, myemail, Age, Nationnalid;
//   var uuid = Uuid();
//   String type = "patient";
//   GlobalKey<FormState> formstate = new GlobalKey<FormState>();

//   signUp() async {
//     var formdata = formstate.currentState;
//     if (formdata!.validate()) {
//       formdata.save();

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
//               body: Text("Password is to weak"))
//             ..show();
//         } else if (e.code == 'email-already-in-use') {
//           Navigator.of(context).pop();
//           AwesomeDialog(
//               context: context,
//               title: "Error",
//               body: Text("The account already exists for that email"))
//             ..show();
//         }
//       } catch (e) {
//         print(e);
//       }
//     } else {}
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign up'),
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
//                     'doctor',
//                     style: TextStyle(
//                       color: type == "doctor" ? Colors.white : null,
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
//                   color: type == "patient" ? Colors.pink.shade100 : null,
//                   child: Text('patient'))),
//           SizedBox(height: 20),
//           Container(
//             padding: EdgeInsets.all(20),
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
//                       decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.person),
//                           hintText: "username",
//                           border: OutlineInputBorder(
//                               borderSide: BorderSide(width: 1))),
//                     ),
//                     SizedBox(height: 20),
//                     TextFormField(
//                       onSaved: (val) {
//                         Age = val;
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
//                       decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.person),
//                           hintText: "Age",
//                           border: OutlineInputBorder(
//                               borderSide: BorderSide(width: 1))),
//                     ),
//                     SizedBox(height: 20),
//                     TextFormField(
//                       controller: myemail,

//                       keyboardType: TextInputType.emailAddress,
//                       // onSaved: (val) {
//                       //   myemail = val;
//                       // },

//                       validator: (val) {
//                         // if (val == null ||
//                         //     val.isEmpty ||
//                         //     !val.contains('@') ||
//                         //     !val.contains('.')) {
//                         //   return 'Invalid Email';
//                         // }

//                         if (val!.length > 100) {
//                           return "Email can't to be larger than 100 letter";
//                         }
//                         if (val.length < 2) {
//                           return "Email can't to be less than 2 letter";
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.person),
//                           hintText: "Email",
//                           border: OutlineInputBorder(
//                               borderSide: BorderSide(width: 1))),
//                     ),
//                     SizedBox(height: 20),
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
//                       decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.person),
//                           hintText: "password",
//                           border: OutlineInputBorder(
//                               borderSide: BorderSide(width: 1))),
//                     ),
//                     // SizedBox(height: 20),
//                     // if (type == "patient")
//                     //   // TextFormField(
//                     //   //   onSaved: (val) {
//                     //   //     Nationnalid = val;
//                     //   //   },
//                     //   //   // validator: (val) {
//                     //   //   //   if (val!.length > 100) {
//                     //   //   //     return "Password can't to be larger than 100 letter";
//                     //   //   //   }
//                     //   //   //   if (val.length < 4) {
//                     //   //   //     return "Password can't to be less than 4 letter";
//                     //   //   //   }
//                     //   //   //   return null;
//                     //   //   // },

//                     //   //   decoration: InputDecoration(
//                     //   //       prefixIcon: Icon(Icons.person),
//                     //   //       hintText: "National ID",
//                     //   //       border: OutlineInputBorder(
//                     //   //           borderSide: BorderSide(width: 1))),
//                     //   // ),
//                     SizedBox(height: 20),
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

//                           setState(() {
//                             lastPerioddate = lastPeriodnewDate;
//                             //age = AgeCalculator.age(age as DateTime)
//                             //as TextEditingController;
//                             lastPeriod.value = TextEditingValue(
//                                 text: dateTimee(lastPeriodnewDate));
//                           });
//                         },
//                         //obscureText: true,
//                         decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.person),
//                             hintText: "Last Period",
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(width: 1))),
//                       ),
//                     Container(
//                         margin: EdgeInsets.all(10),
//                         child: Row(
//                           children: [
//                             Text("if you have Account "),
//                             InkWell(
//                               onTap: () {
//                                 Navigator.of(context).pushNamed("log");
//                               },
//                               child: Text(
//                                 "Click Here",
//                                 style: TextStyle(color: Colors.blue),
//                               ),
//                             )
//                           ],
//                         )),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                         child: MaterialButton(
//                       onPressed: () async {
//                         UserCredential response = await signUp();

//                         print("===================");
//                         if (response != null) {
//                           var patientData = {
//                             "username": myusername,
//                             "email": myemail,
//                             "last pariod": lastPeriod.text.toString(),
//                             "age": Age,
//                             "type": type,
//                             // "Nationnalid": Nationnalid,
//                             "password": mypassword,
//                             // "userid": uuid.v4(),
//                             "userid": FirebaseAuth.instance.currentUser?.uid,
//                           };
//                           var doctorData = {
//                             "username": myusername,
//                             "email": myemail,
//                             "age": Age,
//                             "type": type,
//                             "password": mypassword,
//                             // "userid": uuid.v4(),
//                             "userid": FirebaseAuth.instance.currentUser?.uid,
//                           };

//                           await FirebaseFirestore.instance
//                               .collection("users")
//                               .doc('${response.user!.uid}')
//                               .set(type == "doctor" ? doctorData : patientData)
//                               .then((value) async {
//                             await FirebaseFirestore.instance
//                                 .collection('users')
//                                 .doc('${response.user!.uid}')
//                                 .get()
//                                 .then((value) {
//                               email = value.get('email');
//                             });
//                           });

//                           // await FirebaseFirestore.instance
//                           //     .collection("users")
//                           //     .add(type == "doctor" ? doctorData : patientData);
//                           if (type == "doctor") {
//                             StorageRepoImpl().write(
//                                 key: StorageKeys.userdata,
//                                 value: json.encode(doctorData));
//                             globalData.userData = doctorData;

//                             Navigator.of(context).pushNamedAndRemoveUntil(
//                                 homepage.homeid, (route) => false);
//                           } else {
//                             StorageRepoImpl().write(
//                                 key: StorageKeys.userdata,
//                                 value: json.encode(patientData));
//                             globalData.userData = patientData;

//                             Navigator.of(context).pushNamedAndRemoveUntil(
//                                 homePatient.homeid, (route) => false);
//                           }
//                         } else {
//                           print("Sign Up Faild");
//                         }
//                         print("===================");
//                       },
//                       color: kprimarycolor,
//                       child: Text(
//                         "Sign up ",
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



//  form fields
  // String? name;

  // String? Age;

  // String? Ageatmarriage;

  // String? adress;

  // String? husbandage;

  // String? LevelOfEducation, Ocuppation, Habit, HusbandHabit, HusbandOcuppation
  // String? AgeofMenarche,
  //     DurationofMenses,
  //     IntervalofCycle,
  //     FallTermPregancy,
  //     Pretermpregancy,
  //     Abortion,
  //     LiveBabies;

  // String? BloodGroup, RhFactor;

  // String? TORCH,
  //     Sugar,
  //     Ketone,
  //     uss,
  //     Height,
  //     Weight,
  //     PrePregancyBodyMassIndex,
  //     BloodPressure,
  //     Pluse;
            // SizedBox(
            //   height: 15,
            // ),
            // customtextformfield(
            //   valuevaldiation: (value) {
            //     if (value!.isEmpty) {
            //       return 'field required';
            //     }
            //   },
            //   labeltext: 'Name',
            //   hinttext: 'Name',
            //   onchanged: (namevalue) {
            //     name = namevalue;
            //   },
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // customtextformfield(
            //   valuevaldiation: (value) {
            //     if (value!.isEmpty) {
            //       return 'field required';
            //     } else if (int.parse(Age!) == 40) {
            //       return 'enter age';
            //     }
            //   },
            //   fieldtype: TextInputType.number,
            //   labeltext: 'Age',
            //   hinttext: 'Age',
            //   onchanged: (dynamic Agevalue) {
            //     Age = Agevalue;
            //   },
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // customtextformfield(
            //     valuevaldiation: (value) {
            //       if (value!.isEmpty) {
            //         return 'field required';
            //       }
            //     },
            //     fieldtype: TextInputType.number,
            //     labeltext: 'Age at Marriage',
            //     hinttext: 'Age at Marriage',
            //     onchanged: (dynamic Ageatmarriagevalue) {
            //       Ageatmarriage = Ageatmarriagevalue;
            //     }),
            // SizedBox(
            //   height: 15,
            // ),
            // customtextformfield(
            //   valuevaldiation: (value) {
            //     if (value!.isEmpty) {
            //       return 'field required';
            //     }
            //   },
            //   labeltext: 'Adress',
            //   hinttext: 'Adress',
            //   onchanged: (dynamic Adressvalue) {
            //     adress = Adressvalue;
            //   },
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // customtextformfield(
            //   valuevaldiation: (value) {
            //     if (value!.isEmpty) {
            //       return 'field required';
            //     }
            //   },
            //   labeltext: 'Level Of Education',
            //   hinttext: 'Level Of Education',
            //   onchanged: (LevelOfEducationvalue) {
            //     LevelOfEducation = LevelOfEducationvalue;
            //   },
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // customtextformfield(
            //   valuevaldiation: (value) {
            //     if (value!.isEmpty) {
            //       return 'field required';
            //     }
            //   },
            //   labeltext: 'Ocuppation',
            //   hinttext: 'Ocuppation',
            //   onchanged: (Ocuppationvalue) {
            //     Ocuppation = Ocuppationvalue;
            //   },
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // customtextformfield(
            //   valuevaldiation: (value) {
            //     if (value!.isEmpty) {
            //       return 'field required';
            //     }
            //   },
            //   labeltext: 'Habit',
            //   hinttext: 'Habit',
            //   onchanged: (Habitvalue) {
            //     Habit = Habitvalue;
            //   },
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // customtextformfield(
            //   valuevaldiation: (value) {
            //     if (value!.isEmpty) {
            //       return 'field required';
            //     }
            //   },
            //   fieldtype: TextInputType.number,
            //   labeltext: 'Husband Age',
            //   hinttext: 'Husband Age',
            //   onchanged: (dynamic husbandagevalue) {
            //     husbandage = husbandagevalue;
            //   },
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // customtextformfield(
            //   valuevaldiation: (value) {
            //     if (value!.isEmpty) {
            //       return 'field required';
            //     }
            //   },
            //   labeltext: 'Husband Habit',
            //   hinttext: 'Husband Habit',
            //   onchanged: (dynamic HusbandHabitvalue) {
            //     HusbandHabit = HusbandHabitvalue;
            //   },
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // customtextformfield(
            //   valuevaldiation: (value) {
            //     if (value!.isEmpty) {
            //       return 'field required';
            //     }
            //   },
            //   labeltext: 'Husband Ocuppation',
            //   hinttext: 'Husband Ocuppation',
            //   onchanged: (dynamic HusbandOcuppationvalue) {
            //     HusbandOcuppation = HusbandOcuppationvalue;
            //   },
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Text(
            //     'Menstrual history',
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         color: kprimarycolor,
            //         fontSize: 24),
            //   ),
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // customtextformfield(
            //   valuevaldiation: (value) {
            //     if (value!.isEmpty) {
            //       return 'field required';
            //     }
            //   },
            //   fieldtype: TextInputType.number,
            //   labeltext: 'Duration of Menses',
            //   hinttext: 'Duration of Menses',
            //   onchanged: (dynamic DurationofMensesvalue) {
            //     DurationofMenses = DurationofMensesvalue;
            //   },
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // customtextformfield(
            //   valuevaldiation: (value) {
            //     if (value!.isEmpty) {
            //       return 'field required';
            //     }
            //   },
            //   fieldtype: TextInputType.number,
            //   labeltext: 'Interval of Cycle',
            //   hinttext: 'Interval of Cycles',
            //   onchanged: (dynamic IntervalofCyclevalue) {
            //     IntervalofCycle = IntervalofCyclevalue;
            //   },
            // ),
            // SizedBox(
            //   height: 15,
            // ), Align(
            //   alignment: Alignment.topLeft,
            //   child: Text(
            //     'Obstetric history',
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         color: kprimarycolor,
            //         fontSize: 24),
            //   ),
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // customtextformfield(
            //   valuevaldiation: (value) {
            //     if (value!.isEmpty) {
            //       return 'field required';
            //     }
            //   },
            //   fieldtype: TextInputType.number,
            //   labeltext: 'Fall Term Pregancy',
            //   hinttext: 'Fall Term Pregancy',
            //   onchanged: (dynamic FallTermPregancyvalue) {
            //     FallTermPregancy = FallTermPregancyvalue;
            //   },
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // customtextformfield(
            //   valuevaldiation: (value) {
            //     if (value!.isEmpty) {
            //       return 'field required';
            //     }
            //   },
            //   fieldtype: TextInputType.number,
            //   labeltext: 'Preterm Pregancy',
            //   hinttext: 'Preterm Pregancy',
            //   onchanged: (dynamic Pretermpregancyvalue) {
            //     Pretermpregancy = Pretermpregancyvalue;
            //   },
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // customtextformfield(
            //   valuevaldiation: (value) {
            //     if (value!.isEmpty) {
            //       return 'field required';
            //     }
            //   },
            //   fieldtype: TextInputType.number,
            //   labeltext: 'Abortion',
            //   hinttext: 'Abortion',
            //   onchanged: (dynamic Abortionvalue) {
            //     Abortion = Abortionvalue;
            //   },
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // customtextformfield(
            //   valuevaldiation: (value) {
            //     if (value!.isEmpty) {
            //       return 'field required';
            //     }
            //   },
            //   fieldtype: TextInputType.number,
            //   labeltext: 'Live Babies',
            //   hinttext: 'Live Babies',
            //   onchanged: (dynamic LiveBabiesvalue) {
            //     LiveBabies = LiveBabiesvalue;
            //   },
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Text(
            //     'Investegations',
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         color: kprimarycolor,
            //         fontSize: 24),
            //   ),
            // ),
            // customtextformfield(
            //   valuevaldiation: (value) {
            //     if (value!.isEmpty) {
            //       return 'field required';
            //     }
            //   },
            //   labeltext: 'Blood Group',
            //   hinttext: 'Blood Group',
            //   onchanged: (BloodGroupvalue) {
            //     BloodGroup = BloodGroupvalue;
            //   },
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // customtextformfield(
            //   valuevaldiation: (value) {
            //     if (value!.isEmpty) {
            //       return 'field required';
            //     }
            //   },
            //   labeltext: 'Rh Factor',
            //   hinttext: 'Rh Factor',
            //   onchanged: (RhFactorvalue) {
            //     RhFactor = RhFactorvalue;
            //   },
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // customtextformfield(
            //   valuevaldiation: (value) {
            //     if (value!.isEmpty) {
            //       return 'field required';
            //     }
            //   },
            //   fieldtype: TextInputType.number,
            //   labeltext: 'TORCH',
            //   hinttext: 'TORCH',
            //   onchanged: (dynamic TORCHvalue) {
            //     TORCH = TORCHvalue;
            //   },
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // customtextformfield(
            //   valuevaldiation: (value) {
            //     if (value!.isEmpty) {
            //       return 'field required';
            //     }
            //   },
            //   fieldtype: TextInputType.number,
            //   labeltext: 'Sugar',
            //   hinttext: 'Sugar',
            //   onchanged: (dynamic Sugarvalue) {
            //     Sugar = Sugarvalue;
            //   },
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // customtextformfield(
            //   valuevaldiation: (value) {
            //     if (value!.isEmpty) {
            //       return 'field required';
            //     }
            //   },
            //   fieldtype: TextInputType.number,
            //   labeltext: 'Ketone',
            //   hinttext: 'Ketone',
            //   onchanged: (dynamic Ketonevalue) {
            //     Ketone = Ketonevalue;
            //   },
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // customtextformfield(
            //   valuevaldiation: (value) {
            //     if (value!.isEmpty) {
            //       return 'field required';
            //     }
            //   },
            //   fieldtype: TextInputType.number,
            //   labeltext: 'U.S.S',
            //   hinttext: 'U.S.S',
            //   onchanged: (dynamic ussvalue) {
            //     uss = ussvalue;
            //   },
            // ),
            // SizedBox(
            //   height: 15,
            // ),
  // Align(
  //             alignment: Alignment.topLeft,
  //             child: Text(
  //               'Pyshical Examination',
  //               style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   color: kprimarycolor,
  //                   fontSize: 24),
  //             ),
  //           ),
  //           SizedBox(
  //             height: 15,
  //           ),
  //           customtextformfield(
  //             valuevaldiation: (value) {
  //               if (value!.isEmpty) {
  //                 return 'field required';
  //               }
  //             },
  //             fieldtype: TextInputType.number,
  //             labeltext: 'Weight',
  //             hinttext: 'Weight',
  //             onchanged: (dynamic Weightvalue) {
  //               Weight = Weightvalue;
  //             },
  //           ),

  //           SizedBox(
  //             height: 15,
  //           ),
  //           customtextformfield(
  //             valuevaldiation: (value) {
  //               if (value!.isEmpty) {
  //                 return 'field required';
  //               }
  //             },
  //             fieldtype: TextInputType.number,
  //             labeltext: 'Pre-Pregancy Body Mass Index',
  //             hinttext: 'Pre-Pregancy Body Mass Index',
  //             onchanged: (dynamic PrePregancyBodyMassIndexvalue) {
  //               PrePregancyBodyMassIndex = PrePregancyBodyMassIndexvalue;
  //             },
  //           ),
  //           SizedBox(
  //             height: 15,
  //           ),
  //           customtextformfield(
  //             valuevaldiation: (value) {
  //               if (value!.isEmpty) {
  //                 return 'field required';
  //               }
  //             },
  //             fieldtype: TextInputType.number,
  //             labeltext: 'Blood Pressure',
  //             hinttext: 'Blood Pressure',
  //             onchanged: (dynamic BloodPressurevalue) {
  //               BloodPressure = BloodPressurevalue;
  //             },
  //           ),
  //           SizedBox(
  //             height: 15,
  //           ),
  //           customtextformfield(
  //             valuevaldiation: (value) {
  //               if (value!.isEmpty) {
  //                 return 'field required';
  //               }
  //             },
  //             fieldtype: TextInputType.number,
  //             labeltext: 'Pluse',
  //             hinttext: 'Pluse',
  //             onchanged: (dynamic Plusevalue) {
  //               Pluse = Plusevalue;
  //             },
  //           ),
  //           SizedBox(
  //             height: 15,
  //           ),
  // Dropdownbuttonformfield(
            //   onchanged: (value) {
            //     setState(() {
            //       HeadNeckdropdown = value;
            //       status = value!;
            //       if (status == 'Normal') {
            //         HeadNeckvisbility = false;
            //       } else if (status == 'AbNormal') {
            //         HeadNeckvisbility = true;
            //       }
            //     });
            //   },
            //   text: 'Head&neck',
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // Visibility(
            //     visible: HeadNeckvisbility,
            //     child: customtextformfield(
            //       valuevaldiation: (value) {
            //         if (value!.isEmpty) {
            //           return 'field required';
            //         }
            //       },
            //       hinttext: 'Specifiy Abnormal',
            //     )),
            // SizedBox(
            //   height: 15,
            // ),
            // Dropdownbuttonformfield(
            //   onchanged: (value) {
            //     setState(() {
            //       dropDwonValue = value;
            //       status = value!;
            //       if (status == 'Normal') {
            //         BreastsNipplesvisbility = false;
            //       } else if (status == 'AbNormal') {
            //         BreastsNipplesvisbility = true;
            //       }
            //     });
            //   },
            //   text: 'Breasts&Nipples',
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // Visibility(
            //     visible: BreastsNipplesvisbility,
            //     child: customtextformfield(
            //       valuevaldiation: (value) {
            //         if (value!.isEmpty) {
            //           return 'field required';
            //         }
            //       },
            //       hinttext: 'Specifiy Abnormal',
            //     )),
            // SizedBox(
            //   height: 15,
            // ),
            // Dropdownbuttonformfield(
            //   onchanged: (value) {
            //     setState(() {
            //       dropDwonValue = value;
            //       status = value!;
            //       if (status == 'Normal') {
            //         Chestvisibility = false;
            //       } else if (status == 'AbNormal') {
            //         Chestvisibility = true;
            //       }
            //     });
            //   },
            //   text: 'Chest',
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // Visibility(
            //     visible: Chestvisibility,
            //     child: customtextformfield(
            //       valuevaldiation: (value) {
            //         if (value!.isEmpty) {
            //           return 'field required';
            //         }
            //       },
            //       hinttext: 'Specifiy Abnormal',
            //     )),
            // SizedBox(
            //   height: 15,
            // ),
            // Dropdownbuttonformfield(
            //   onchanged: (value) {
            //     setState(() {
            //       dropDwonValue = value;
            //       status = value!;
            //       if (status == 'Normal') {
            //         TeethGumsvisibility = false;
            //       } else if (status == 'AbNormal') {
            //         TeethGumsvisibility = true;
            //       }
            //     });
            //   },
            //   text: 'Teeth&Gums',
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // Visibility(
            //     visible: TeethGumsvisibility,
            //     child: customtextformfield(
            //       valuevaldiation: (value) {
            //         if (value!.isEmpty) {
            //           return 'field required';
            //         }
            //       },
            //       hinttext: 'Specifiy Abnormal',
            //     )),
            // SizedBox(
            //   height: 15,
            // ),
            // Dropdownbuttonformfield(
            //   onchanged: (value) {
            //     setState(() {
            //       dropDwonValue = value;
            //       status = value!;
            //       if (status == 'Normal') {
            //         Heartvisbility = false;
            //       } else if (status == 'AbNormal') {
            //         Heartvisbility = true;
            //       }
            //     });
            //   },
            //   text: 'Heart',
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // Visibility(
            //     visible: Heartvisbility,
            //     child: customtextformfield(
            //       valuevaldiation: (value) {
            //         if (value!.isEmpty) {
            //           return 'field required';
            //         }
            //       },
            //       hinttext: 'Specifiy Abnormal',
            //     )),
            // SizedBox(
            //   height: 15,
            // ),
            // Dropdownbuttonformfield(
            //   onchanged: (value) {
            //     setState(() {
            //       dropDwonValue = value;
            //       status = value!;
            //       if (status == 'Normal') {
            //         Abdomenvisbility = false;
            //       } else if (status == 'AbNormal') {
            //         Abdomenvisbility = true;
            //       }
            //     });
            //   },
            //   text: 'Abdomen',
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // Visibility(
            //     visible: Abdomenvisbility,
            //     child: customtextformfield(
            //       valuevaldiation: (value) {
            //         if (value!.isEmpty) {
            //           return 'field required';
            //         }
            //       },
            //       hinttext: 'Specifiy Abnormal',
            //     )),
            // SizedBox(
            //   height: 15,
            // ),
            // Dropdownbuttonformfield(
            //   onchanged: (value) {
            //     setState(() {
            //       dropDwonValue = value;
            //       status = value!;
            //       if (status == 'Normal') {
            //         Backbonevisbility = false;
            //       } else if (status == 'AbNormal') {
            //         Backbonevisbility = true;
            //       }
            //     });
            //   },
            //   text: 'Backbone',
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // Visibility(
            //     visible: Backbonevisbility,
            //     child: customtextformfield(
            //       valuevaldiation: (value) {
            //         if (value!.isEmpty) {
            //           return 'field required';
            //         }
            //       },
            //       hinttext: 'Specifiy Abnormal',
            //     )),
            // SizedBox(
            //   height: 15,
            // ),
            // Dropdownbuttonformfield(
            //   onchanged: (value) {
            //     setState(() {
            //       dropDwonValue = value;
            //       status = value!;
            //       if (status == 'Normal') {
            //         VaricositiesExtremitiesvisibility = false;
            //       } else if (status == 'AbNormal') {
            //         VaricositiesExtremitiesvisibility = true;
            //       }
            //     });
            //   },
            //   text: 'Varicosities&Extremities',
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // Visibility(
            //     visible: VaricositiesExtremitiesvisibility,
            //     child: customtextformfield(
            //       valuevaldiation: (value) {
            //         if (value!.isEmpty) {
            //           return 'field required';
            //         }
            //       },
            //       hinttext: 'Specifiy Abnormal',
            //     )),
            // SizedBox(
            //   height: 15,
            // ),
            // Dropdownbuttonformfield(
            //   onchanged: (value) {
            //     setState(() {
            //       dropDwonValue = value;
            //       status = value!;
            //       if (status == 'Normal') {
            //         Edemavisbility = false;
            //       } else if (status == 'AbNormal') {
            //         Edemavisbility = true;
            //       }
            //     });
            //   },
            //   text: 'Edema',
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // Visibility(
            //     visible: Edemavisbility,
            //     child: customtextformfield(
            //       valuevaldiation: (value) {
            //         if (value!.isEmpty) {
            //           return 'field required';
            //         }
            //       },
            //       hinttext: 'Specifiy Abnormal',
            //     )),
            // SizedBox(
            //   height: 15,
            // )

            // Text(
                    //   'Name:' + args.name!,
                    //   style: TextStyle(color: kprimarycolor, fontSize: 25),
                    // ),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('Id:' + args.email!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('Age:' + args.Age!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('Ageatmarriage:' + args.Ageatmarriage!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('Adress:' + args.adress!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('Husbandage:' + args.husbandage!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('LevelOfEducation:' + args.LevelOfEducation!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('Ocuppation:' + args.Ocuppation!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('Habit' + args.Habit!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('HusbandHabit:' + args.HusbandHabit!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('HusbandOcuppation:' + args.HusbandOcuppation!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                     // Text('AgeofMenarche:' + args.AgeofMenarche!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('DurationofMenses:' + args.DurationofMenses!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('IntervalofCycle:' + args.IntervalofCycle!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ), // Text('FallTermPregancy:' + args.FallTermPregancy!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('Pretermpregancy:' + args.Pretermpregancy!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('Abortion:' + args.Abortion!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('LiveBabies:' + args.LiveBabies!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ), // Text('BloodGroup:' + args.BloodGroup!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('RhFactor:' + args.RhFactor!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('TORCH:' + args.TORCH!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('Sugar:' + args.Sugar!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('Ketone:' + args.Ketone!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('uss:' + args.uss!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ), // Text('Weight:' + args.Weight!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('Height:' + args.Height!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text(
                    //     'PrePregancyBodyMassIndex:' +
                    //         args.PrePregancyBodyMassIndex!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('BloodPressure:' + args.BloodPressure!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('Pluse:' + args.Pluse!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),  // Text('Head&Neck:' + args.HeadNeckdropdown!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('Headneckspecify:' + args.headneckspecify!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('BreastsNipples:' + args.BreastsNipplesdropDwonValue!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('BreastsNipplesspeficy:' + args.BreastsNipplesspeficy!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ), // Text('Chest:' + args.ChestdropDwonValue!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('Chestspecify:' + args.Chestspecify!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('TeethGums:' + args.TeethGumsdropDwonValue!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('TeethGumsspecify:' + args.TeethGumsspecify!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),   // Text('Heart:' + args.HeartdropDwonValue!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('Heartspecify:' + args.Heartspecify!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('Abdomen:' + args.AbdomendropDwonValue!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('Abdomenspecify:' + args.Abdomenspecify!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ), // Text('Backbone:' + args.BackbonedropDwonValue!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('Backbonespecify:' + args.Backbonespecify!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text(
                    //     'varicositiesExtremities:' +
                    //         args.varicositiesExtremitiesValue!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text(
                    //     'varicositiesExtremitiesspecify:' +
                    //         args.varicositiesExtremitiesspecify!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('Edema:' + args.EdemadropDwonValue!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // Text('Edemaspecify:' + args.Edemaspecify!,
                    //     style: TextStyle(color: kprimarycolor, fontSize: 25)),
                   
//                    login page nouara
//                    import 'dart:convert';

// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:pregancy/core/globalData.dart';
// import 'package:pregancy/doctor/screens/DoctorLayout.dart';
// import 'package:pregancy/patient/screens/DoctorLayout.dart';
// import 'package:pregancy/shared_screen/reset_pass.dart';
// import 'package:pregancy/shared_screen/signUp.dart';

// import '../doctor/constants.dart';
// import '../doctor/weidgetes/alert.dart';
// import '../storage/storage_keys.dart';
// import '../storage/storage_repo_impl.dart';

// class Login extends StatefulWidget {
//   Login({Key? key}) : super(key: key);
//   static String logid = 'log';
//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   var mypassword, myemail;
//   GlobalKey<FormState> formstate = new GlobalKey<FormState>();
//   signIn() async {
//     var formdata = formstate.currentState;
//     if (formdata!.validate()) {
//       formdata.save();
//       try {
//         showLoading(context);
//         UserCredential userCredential = await FirebaseAuth.instance
//             .signInWithEmailAndPassword(
//                 email: myemail.toString().replaceAll(' ', ''),
//                 password: mypassword.toString().replaceAll(' ', ''));
//         return userCredential;
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'user-not-found') {
//           Navigator.of(context).pop();
//           AwesomeDialog(
//               context: context,
//               title: "Error",
//               body: Text("No user found for that email"))
//             ..show();
//         } else if (e.code == 'wrong-password') {
//           Navigator.of(context).pop();
//           AwesomeDialog(
//               context: context,
//               title: "Error",
//               body: Text("Wrong password provided for that user"))
//             ..show();
//         }
//       }
//     } else {
//       print("Not Vaild");
//     }
//   }

//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//         backgroundColor: kprimarycolor,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 60,
//               backgroundColor: Colors.black,
//               child: CircleAvatar(
//                 radius: 200,
//                 backgroundColor: Colors.black,
//                 backgroundImage: AssetImage('assets/images/logo.jpeg'),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(20),
//               child: Form(
//                   key: formstate,
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         // onSaved: (val) {
//                         //   myemail = val;
//                         // },
//                         // validator: (val) {
//                         //   if (val == null ||
//                         //       val.isEmpty ||
//                         //       !val.contains('@') ||
//                         //       !val.contains('.')) {
//                         //     return 'Invalid Email';
//                         //   }

//                         //   if (val!.length > 100) {
//                         //     return "Email can't to be larger than 100 letter";
//                         //   }
//                         //   if (val.length < 2) {
//                         //     return "Email can't to be less than 2 letter";
//                         //   }
//                         //   return null;
//                         // },
//                         decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.person),
//                             hintText: "Email",
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(width: 1))),
//                       ),
//                       SizedBox(height: 20),
//                       TextFormField(
//                         // onSaved: (val) {
//                         //   mypassword = val;
//                         // },
//                         // validator: (val) {
//                         //   if (val!.length > 100) {
//                         //     return "Password can't to be larger than 100 letter";
//                         //   }
//                         //   if (val.length < 4) {
//                         //     return "Password can't to be less than 4 letter";
//                         //   }
//                         //   return null;
//                         // },
//                         obscureText: true,
//                         decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.person),
//                             hintText: "password",
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(width: 1))),
//                       ),
//                       Container(
//                           margin: EdgeInsets.all(10),
//                           child: Row(
//                             children: [
//                               Text("if you havan't accout "),
//                               InkWell(
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => SignUp()));
//                                   //Navigator.of(context)
//                                   // .pushReplacementNamed('signup');
//                                 },
//                                 child: Text(
//                                   "Click Here",
//                                   style: TextStyle(color: Colors.blue),
//                                 ),
//                               )
//                             ],
//                           )),
//                       Container(
//                           child: MaterialButton(
//                         elevation: 5.0,
//                         color: kprimarycolor,
//                         textColor: Colors.white,
//                         onPressed: () async {
//                           var user = await signIn();
//                           print(user);
//                           if (user != null) {
//                             var userdata = await FirebaseFirestore.instance
//                                 .collection('users')
//                                 .get();
//                             final _docData =
//                                 userdata.docs.map((doc) => doc.data()).toList();
//                             Map<String, dynamic>? mydata;
//                             _docData.forEach((element) {
//                               if (element["email"] == myemail) {
//                                 mydata = element;
//                               }
//                             });
//                             if (mydata != null) {
//                               StorageRepoImpl().write(
//                                   key: StorageKeys.userdata,
//                                   value: json.encode(mydata));
//                               globalData.userData = mydata;

//                               if (mydata!["type"] == "doctor") {
//                                 Navigator.of(context).pushNamedAndRemoveUntil(
//                                     homepage.homeid, (route) => false);
//                               } else {
//                                 await FirebaseFirestore.instance
//                                     .collection('users')
//                                     .doc('${user.user!.uid}')
//                                     .get()
//                                     .then((value) {
//                                   email = value.get('email');
//                                 });

//                                 Navigator.of(context).pushNamedAndRemoveUntil(
//                                     homePatient.homeid, (route) => false);
//                               }
//                             }
//                           }
//                         },
//                         child: Text(
//                           "Login",
//                           style: Theme.of(context).textTheme.titleMedium,
//                         ),
//                       )),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 30),
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => reset()));
//                           },
//                           child: Text(
//                             "Reset Password",
//                             style: TextStyle(
//                                 color: kprimarycolor,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }





// predection
 // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(
            //       'Prediction Form',
            //       style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 20,
            //           color: kprimarycolor),
            //     ),
            //     SizedBox(
            //       height: 20,
            //     ),
            //     TextFormField(
            //       keyboardType: TextInputType.number,

            //       validator: (value) {
            //         if (value!.isEmpty) {
            //           return 'field must not be empty';
            //         } else if (int.parse(Age.text) < 20 ||
            //             int.parse(Age.text) > 50) {
            //           return 'please enter age between 20 and 50';
            //         }
            //       },
            //       controller: Age,
            //       style: TextStyle(
            //         fontSize: 15.0,
            //         color: Colors.black,
            //       ),
            //       //maxLength: 2,
            //       //keyboardType: TextInputType.number,
            //       decoration: InputDecoration(
            //         hintText: "Age",
            //         border: OutlineInputBorder(),
            //       ),
            //     ),
            //     SizedBox(
            //       height: 10,
            //     ),
            //     TextFormField(
            //       keyboardType: TextInputType.number,

            //       validator: (value) {
            //         if (value!.isEmpty) {
            //           return 'field must not be empty';
            //         }
            //       },
            //       controller: SysBp,
            //       style: TextStyle(
            //         fontSize: 15.0,
            //         color: Colors.black,
            //       ),
            //       //maxLength: 2,
            //       //keyboardType: TextInputType.number,
            //       decoration: InputDecoration(
            //         hintText: "SysBp",
            //         border: OutlineInputBorder(),
            //       ),
            //     ),
            //     SizedBox(
            //       height: 10,
            //     ),
            //     TextFormField(
            //       keyboardType: TextInputType.number,

            //       validator: (value) {
            //         if (value!.isEmpty) {
            //           return 'field must not be empty';
            //         }
            //       },
            //       controller: DiaBp,
            //       style: TextStyle(
            //         fontSize: 15.0,
            //         color: Colors.black,
            //       ),
            //       //maxLength: 2,
            //       //keyboardType: TextInputType.number,
            //       decoration: InputDecoration(
            //         hintText: "DiaBp",
            //         border: OutlineInputBorder(),
            //       ),
            //     ),
            //     SizedBox(
            //       height: 10,
            //     ),
            //     TextFormField(
            //       keyboardType: TextInputType.number,

            //       validator: (value) {
            //         if (value!.isEmpty) {
            //           return 'field must not be empty';
            //         }
            //       },
            //       controller: BloodSugar,
            //       style: TextStyle(
            //         fontSize: 15.0,
            //         color: Colors.black,
            //       ),
            //       //maxLength: 2,
            //       //keyboardType: TextInputType.number,
            //       decoration: InputDecoration(
            //         hintText: "BloodSugar",
            //         border: OutlineInputBorder(),
            //       ),
            //     ),
            //     SizedBox(
            //       height: 10,
            //     ),
            //     TextFormField(
            //       keyboardType: TextInputType.number,

            //       validator: (value) {
            //         if (value!.isEmpty) {
            //           return 'field must not be empty';
            //         }
            //       },
            //       controller: BodyTemperature,
            //       style: TextStyle(
            //         fontSize: 15.0,
            //         color: Colors.black,
            //       ),
            //       //maxLength: 2,
            //       //keyboardType: TextInputType.number,
            //       decoration: InputDecoration(
            //         hintText: "Body Temperature",
            //         border: OutlineInputBorder(),
            //       ),
            //     ),
            //     SizedBox(
            //       height: 10,
            //     ),
            //     TextFormField(
            //       keyboardType: TextInputType.number,

            //       validator: (value) {
            //         if (value!.isEmpty) {
            //           return 'field must not be empty';
            //         }
            //       },
            //       controller: HeartRate,
            //       style: TextStyle(
            //         fontSize: 15.0,
            //         color: Colors.black,
            //       ),
            //       //maxLength: 2,
            //       //keyboardType: TextInputType.number,
            //       decoration: InputDecoration(
            //         hintText: "Heart Rate",
            //         border: OutlineInputBorder(),
            //       ),
            //     ),
            //     SizedBox(
            //       height: 30,
            //     ),





// predectiondoctor
//             import 'package:pregancy/doctor/models/predectiondoctor.dart';

// crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Prediction Form',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                       color: kprimarycolor),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,

//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'field must not be empty';
//                     } else if (int.parse(Age.text) < 20 ||
//                         int.parse(Age.text) > 50) {
//                       return 'please enter age between 20 and 50';
//                     }
//                   },
//                   controller: Age,
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.black,
//                   ),
//                   //maxLength: 2,
//                   //keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "Age",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,

//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'field must not be empty';
//                     }
//                   },
//                   controller: FamHisto,
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.black,
//                   ),
//                   //maxLength: 2,
//                   //keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "family history",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,

//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'field must not be empty';
//                     }
//                   },
//                   controller: ChronicHtn,
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.black,
//                   ),
//                   //maxLength: 2,
//                   //keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "Chronic Htn",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,

//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'field must not be empty';
//                     }
//                   },
//                   controller: ChronicDiabetes,
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.black,
//                   ),
//                   //maxLength: 2,
//                   //keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "Chronic Diabetes",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,

//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'field must not be empty';
//                     }
//                   },
//                   controller: BMI,
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.black,
//                   ),
//                   //maxLength: 2,
//                   //keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "BMI",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,

//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'field must not be empty';
//                     }
//                   },
//                   controller: SysBp,
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.black,
//                   ),
//                   //maxLength: 2,
//                   //keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "Systolic blood pressure",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,

//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'field must not be empty';
//                     }
//                   },
//                   controller: DiaBp,
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.black,
//                   ),
//                   //maxLength: 2,
//                   //keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "Diastolic Blood Presurrse",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,

//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'field must not be empty';
//                     }
//                   },
//                   controller: Hb,
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.black,
//                   ),
//                   //maxLength: 2,
//                   //keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "Hb",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,

//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'field must not be empty';
//                     }
//                   },
//                   controller: Hematocrit,
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.black,
//                   ),
//                   //maxLength: 2,
//                   //keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "Hematocrit",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,

//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'field must not be empty';
//                     }
//                   },
//                   controller: MCH,
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.black,
//                   ),
//                   //maxLength: 2,
//                   //keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "MCH",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,

//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'field must not be empty';
//                     }
//                   },
//                   controller: MCHC,
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.black,
//                   ),
//                   //maxLength: 2,
//                   //keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "MCHC",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,

//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'field must not be empty';
//                     }
//                   },
//                   controller: MCV,
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.black,
//                   ),
//                   //maxLength: 2,
//                   //keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "MCV",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,

//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'field must not be empty';
//                     }
//                   },
//                   controller: Platelet,
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.black,
//                   ),
//                   //maxLength: 2,
//                   //keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "Platelet",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,

//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'field must not be empty';
//                     }
//                   },
//                   controller: HDL,
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.black,
//                   ),
//                   //maxLength: 2,
//                   //keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "HDL",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),

//                 TextFormField(
//                   keyboardType: TextInputType.number,

//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'field must not be empty';
//                     }
//                   },
//                   controller: SerumCreatinine,
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.black,
//                   ),
//                   //maxLength: 2,
//                   //keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "SerumCreatinine",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,

//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'field must not be empty';
//                     }
//                   },
//                   controller: OGTT,
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.black,
//                   ),
//                   //maxLength: 2,
//                   //keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "OGTT",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),

//                 // TextFormField(
//                 //   keyboardType: TextInputType.number,

//                 //   validator: (value) {
//                 //     if (value!.isEmpty) {
//                 //       return 'field must not be empty';
//                 //     }
//                 //   },
//                 //   controller: BloodSugar,
//                 //   style: TextStyle(
//                 //     fontSize: 15.0,
//                 //     color: Colors.black,
//                 //   ),
//                 //   //maxLength: 2,
//                 //   //keyboardType: TextInputType.number,
//                 //   decoration: InputDecoration(
//                 //     hintText: "Blood Sugar",
//                 //     border: OutlineInputBorder(),
//                 //   ),
//                 // ),
//                 // SizedBox(
//                 //   height: 10,
//                 // ),
//                 // TextFormField(
//                 //   keyboardType: TextInputType.text,

//                 //   validator: (value) {
//                 //     if (value!.isEmpty) {
//                 //       return 'field must not be empty';
//                 //     }
//                 //   },
//                 //   controller: BodyTemperature,
//                 //   style: TextStyle(
//                 //     fontSize: 15.0,
//                 //     color: Colors.black,
//                 //   ),
//                 //   //maxLength: 2,
//                 //   //keyboardType: TextInputType.number,
//                 //   decoration: InputDecoration(
//                 //     hintText: "Body Temperature",
//                 //     border: OutlineInputBorder(),
//                 //   ),
//                 // ),
//                 // SizedBox(
//                 //   height: 10,
//                 // // ),
//                 // TextFormField(
//                 //   keyboardType: TextInputType.text,

//                 //   validator: (value) {
//                 //     if (value!.isEmpty) {
//                 //       return 'field must not be empty';
//                 //     }
//                 //   },
//                 //   controller: HeartRate,
//                 //   style: TextStyle(
//                 //     fontSize: 15.0,
//                 //     color: Colors.black,
//                 //   ),
//                 //   //maxLength: 2,
//                 //   //keyboardType: TextInputType.number,
//                 //   decoration: InputDecoration(
//                 //     hintText: "Heart Rate",
//                 //     border: OutlineInputBorder(),
//                 //   ),
//                 // ),
//                 // SizedBox(
//                 //   height: 10,
//                 // ),

//                 predectiondoctor
//                 TextFormField(
//                   keyboardType: TextInputType.text,

//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'field must not be empty';
//                     }
//                   },
//                   controller: email,
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.black,
//                   ),
//                   //maxLength: 2,
//                   //keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "Email",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),




// predectionPatient
// Text(
//                   'Prediction Form',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                       color: kprimarycolor),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,

//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'field must not be empty';
//                     } else if (int.parse(Age.text) < 20 ||
//                         int.parse(Age.text) > 50) {
//                       return 'please enter age between 20 and 50';
//                     }
//                   },
//                   controller: Age,
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.black,
//                   ),
//                   //maxLength: 2,
//                   //keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "Age",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,

//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'field must not be empty';
//                     }
//                   },
//                   controller: SysBp,
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.black,
//                   ),
//                   //maxLength: 2,
//                   //keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "SysBp",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,

//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'field must not be empty';
//                     }
//                   },
//                   controller: DiaBp,
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.black,
//                   ),
//                   //maxLength: 2,
//                   //keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "DiaBp",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,

//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'field must not be empty';
//                     }
//                   },
//                   controller: BloodSugar,
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.black,
//                   ),
//                   //maxLength: 2,
//                   //keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "BloodSugar",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,

//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'field must not be empty';
//                     }
//                   },
//                   controller: BodyTemperature,
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.black,
//                   ),
//                   //maxLength: 2,
//                   //keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "Body Temperature",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,

//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'field must not be empty';
//                     }
//                   },
//                   controller: HeartRate,
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: Colors.black,
//                   ),
//                   //maxLength: 2,
//                   //keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "Heart Rate",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//      
//
//           ),













// nursseregesiter

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pregancy/doctor/constants.dart';
// import 'package:pregancy/doctor/weidgetes/custom_button.dart';
// import 'package:pregancy/doctor2/cubit/nurseregesteration_cubit/cubit/nurseregesteration_cubit.dart';
// import 'package:pregancy/doctor2/weidgets/nurseregisteration.dart';

// class nurseregesterations extends StatefulWidget {
//   static String nurseregesterationsid = 'nurseregesterations';

//   @override
//   State<nurseregesterations> createState() => _nurseregesterationsState();
// }

// class _nurseregesterationsState extends State<nurseregesterations> {
//   TextEditingController university = TextEditingController();

//   TextEditingController graduationYear = TextEditingController();

//   TextEditingController clinicLocation = TextEditingController();

//   TextEditingController ticketPrice = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kprimarycolor,
//         title: Text(
//           'Regseteration',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(24),
//           child: Form(
//             child: Column(
//               children: [
//                 nurseregesterationweidget(
//                     university: university,
//                     graduationYear: graduationYear,
//                     clinicLocation: clinicLocation,
//                     ticketPrice: ticketPrice),
//                 custoumbutton(
//                   text: 'Submit',
//                   onTap: () {
//                     BlocProvider.of<NurseregesterationCubit>(context)
//                         .submitform(
//                             university: university.text,
//                             graduationYear: graduationYear.text,
//                             clinicLocation: clinicLocation.text,
//                             ticketPrice: ticketPrice.text);
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

