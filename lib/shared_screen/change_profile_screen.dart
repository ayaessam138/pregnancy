// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:pregancy/core/globalData.dart';
// import 'package:pregancy/doctor/constants.dart';
// import '../../doctor/weidgetes/alert.dart';
//
// class ChangePatientProfile extends StatefulWidget {
//   static String ChangePatientProfileid = 'ChangePatientProfile';
//   @override
//   State<ChangePatientProfile> createState() => _ChangePatientProfileState();
// }
//
// class _ChangePatientProfileState extends State<ChangePatientProfile> {
//   GlobalKey<FormState> formkey = GlobalKey();
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
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
//       .doc(globalData.userData!["userid"]);
//
//   @override
//   Widget build(BuildContext context) {
// // String name;
// // print(globalData.userData![("username")]);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('change profile'),
//         backgroundColor: kprimarycolor,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(40.0),
//           child: Form(
//             key: formkey,
//             child: Column(
//               children: [
//                 const Row(
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
//                     //Text(),
//                     //name =  globalData.userData![("username")]
//                   ],
//                 ),
//                 const SizedBox(
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
//                   decoration: const InputDecoration(
//                     hintText: 'user name',
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.edit),
//                   ),
//                   controller: usernameController,
//                 ),
//                 const SizedBox(
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
//                   decoration: const InputDecoration(
//                     hintText: 'e-mail',
//                     border: OutlineInputBorder(),
//                     prefixIcon: Icon(Icons.email_outlined),
//                   ),
//                   controller: emailController,
//                 ),
//                 const SizedBox(
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
//                   decoration: const InputDecoration(
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
//                 const SizedBox(
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
//                         resetEmail(emailController.toString());
//                       },
//                       child: const Text(
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
//
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
//       }).catchError((e) {
//         print("$e");
//       });
//     }
//   }
//
//   Future resetEmail(String newEmail) async {
//     var message;
//     User? firebaseUser = await FirebaseAuth.instance.currentUser;
//     firebaseUser!
//         .updateEmail(newEmail)
//         .then(
//           (value) => message = 'Success',
//         )
//         .catchError((onError) => message = 'error');
//     return message;
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/core/globalData.dart';
import 'package:pregancy/doctor/constants.dart';
import 'package:pregancy/patient/cubit/ProfilePatient/patientprofile_cubit.dart';
import '../../doctor/weidgetes/alert.dart';

class ChangePatientProfile extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey();
  static String ChangePatientProfileid = 'ChangePatientProfile';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PatientprofileCubit()..getpatientdata(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title:  Text('changeprofile'.tr()),
          backgroundColor: kprimarycolor,
        ),
        body: BlocConsumer<PatientprofileCubit, PatientprofileState>(
          listener: (context, state) {},
          builder: (context, state) {
            // var Cubit = BlocProvider.of<PatientprofileCubit>(context);
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                          SizedBox(
                            width: 45,
                          ),
                          //Text(),
                          //name =  globalData.userData![("username")]
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        onChanged: (value) {
                          print(value);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'namemustnotbeempty'.tr();
                          }
                          return null;
                        },
                        decoration:  InputDecoration(
                          hintText: 'uusername'.tr(),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.edit),
                        ),
                        controller:
                            BlocProvider.of<PatientprofileCubit>(context)
                                .usernameController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        onChanged: (value) {
                          print(value);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'e-mailmustnotbeempty'.tr();
                          }
                          return null;
                        },
                        decoration:  InputDecoration(
                          hintText: 'email'.tr(),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                        controller:
                            BlocProvider.of<PatientprofileCubit>(context)
                                .emailController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        onChanged: (value) {
                          print(value);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'passwordmustnotbeempty'.tr();
                          }
                          return null;
                        },
                        decoration:  InputDecoration(
                          hintText: 'password'.tr(),
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                          suffixIcon: Icon(
                            Icons.remove_red_eye_rounded,
                          ),
                          border: OutlineInputBorder(),
                        ),
                        controller:
                            BlocProvider.of<PatientprofileCubit>(context)
                                .passwordController,
                        //onFieldSubmitted:(value){
                        //print(value);//},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          width: 100,
                          color: kprimarycolor,
                          child: MaterialButton(
                            onPressed: () {
                              BlocProvider.of<PatientprofileCubit>(context)
                                  .updateProfile(context);
                              BlocProvider.of<PatientprofileCubit>(context)
                                  .resetEmail(
                                      BlocProvider.of<PatientprofileCubit>(
                                              context)
                                          .emailController
                                          .toString());
                            },
                            child: const Text(
                              // state is UpdateProfileLoading?
                              'Update',
                              //     : 'Please Wait',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
