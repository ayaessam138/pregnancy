// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:pregancy/core/globalData.dart';
// import 'package:pregancy/doctor/constants.dart';
// import 'package:pregancy/shared_screen/cache_helper.dart';
// import 'package:sizer/sizer.dart';
//
// import '../../patient/weidgetes/alert.dart';
//
// class ChangeDoctorProfile extends StatefulWidget {
//   static String ChangeDoctorProfileid = 'ChangeDoctorProfile';
//   @override
//   State<ChangeDoctorProfile> createState() => _ChangeDoctorProfileState();
// }
//
// class _ChangeDoctorProfileState extends State<ChangeDoctorProfile> {
//   var username, password, email;
//   GlobalKey<FormState> formkey = GlobalKey();
//
//   TextEditingController usernameController = TextEditingController();
//
//   TextEditingController emailController = TextEditingController();
//
//   TextEditingController passwordController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//
//     profileref.get().then((value) {
//       try {
//         usernameController.text = (value.data() as Map)["username"];
//         emailController.text = (value.data() as Map)["email"];
//         passwordController.text = (value.data() as Map)["password"];
//       } catch (e) {}
//     });
//   }
//
//   DocumentReference profileref = FirebaseFirestore.instance
//       .collection("users")
//       .doc(CacheHelper.getData(key: 'uId'));
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('change profile'),
//         backgroundColor: kprimarycolor,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(40.0),
//           child: Form(
//             key: formkey,
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 50,
//                       backgroundColor: Colors.grey,
//                       child: Icon(
//                         Icons.person,
//                         color: Colors.white,
//                         size: 50,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 45,
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 TextFormField(
//                   onFieldSubmitted: (value) {
//                     print(value);
//                   },
//                   onChanged: (value) {
//                     print(value);
//                   },
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'name must not be empty';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'user name',
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.edit),
//                   ),
//                   controller: usernameController,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   onFieldSubmitted: (value) {
//                     print(value);
//                   },
//                   onChanged: (value) {
//                     print(value);
//                   },
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'e-mail must not be empty';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'e-mail',
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.email_outlined),
//                   ),
//                   controller: emailController,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.visiblePassword,
//                   obscureText: true,
//                   onFieldSubmitted: (value) {
//                     print(value);
//                   },
//                   onChanged: (value) {
//                     print(value);
//                   },
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'password must not be empty';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Password',
//                     prefixIcon: Icon(
//                       Icons.lock,
//                     ),
//                     suffixIcon: Icon(
//                       Icons.remove_red_eye_rounded,
//                     ),
//                     border: OutlineInputBorder(),
//                   ),
//                   controller: passwordController,
//                   //onFieldSubmitted:(value){
//                   //print(value);//},
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Container(
//                     alignment: AlignmentDirectional.center,
//                     width: 100,
//                     color: kprimarycolor,
//                     child: MaterialButton(
//                       onPressed: () {
//                         updateProfile(context);
//                       },
//                       child: Text(
//                         'Update',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   updateProfile(context) async {
//     var formdata = formkey.currentState;
//     if (formdata!.validate()) {
//       showLoading(context);
//       formdata.save();
//
//       await profileref.update({
//         "username": usernameController.text,
//         "email": emailController.text,
//         "password": passwordController.text,
//       }).then((value) async {
//         Navigator.pop(context);
//         // UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         //     email: email, password: password);
//         //return userCredential;
//       }).catchError((e) {
//         print("$e");
//       });
//     }
//   }
// }
