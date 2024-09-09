// import 'dart:convert';

// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pregancy/core/globalData.dart';
// import 'package:pregancy/doctor/screens/DoctorLayout.dart';
// import 'package:pregancy/doctor2/navigationscreen/LayoutNurse.dart';
// import 'package:pregancy/doctor2/screens/homenurse.dart';
// import 'package:pregancy/patient/screens/DoctorLayout.dart';
// import 'package:pregancy/shared_screen/login_cubit/login_cubit.dart';
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
//   @override
//   Widget build(BuildContext context) {
//     GlobalKey<FormState> formstate = new GlobalKey<FormState>();
//     TextEditingController email = TextEditingController();
//     TextEditingController password = TextEditingController();
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
//                         controller: email,
//                         decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.person),
//                             hintText: "Email",
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(width: 1))),
//                       ),
//                       SizedBox(height: 20),
//                       TextFormField(
//                         controller: password,
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
//                                 },
//                                 child: Text(
//                                   "Click Here",
//                                   style: TextStyle(color: Colors.blue),
//                                 ),
//                               )
//                             ],
//                           )),
//                       BlocConsumer<LoginCubit, LoginState>(
//                         listener: (context, state) {
//                           if (state is GetRoleSucess) {
//                             if (state.userrole == 'doctor') {
//                               Navigator.pushNamed(context, homepage.homeid);
//                             } else if (state.userrole == 'patient') {
//                               Navigator.pushNamed(context, homePatient.homeid);
//                             } else if (state.userrole == 'nurse') {
//                               Navigator.pushNamed(
//                                   context, homepagenurse.homenursepageid);
//                             } else {
//                               AwesomeDialog(
//                                   context: context,
//                                   title: "Error",
//                                   body: Text(
//                                       " some thing wrong , please try again"))
//                                 ..show();
//                             }
//                           } else if (state is LoginFail) {
//                             AwesomeDialog(
//                                 context: context,
//                                 title: "Error",
//                                 body: Text(state.errorMessage))
//                               ..show();
//                           }
//                         },
//                         builder: (context, state) {
//                           if (state is Logingloading ||
//                               state is GetRoleloading) {
//                             return Center(child: CircularProgressIndicator());
//                           } else {
//                             return MaterialButton(
//                               elevation: 5.0,
//                               color: kprimarycolor,
//                               textColor: Colors.white,
//                               onPressed: () {
//                                 if (formstate.currentState!.validate()) {
//                                   BlocProvider.of<LoginCubit>(context)
//                                       .loginuser(
//                                           email: email.text,
//                                           password: password.text);
//                                 }
//                               },
//                               child: Text(
//                                 "Login",
//                                 style: Theme.of(context).textTheme.titleMedium,
//                               ),
//                             );
//                           }
//                         },
//                       ),
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

import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/core/globalData.dart';
import 'package:pregancy/doctor/cubit/pregancyform_cubit/pregancyform_cubit.dart';
import 'package:pregancy/doctor/screens/DoctorLayout.dart';
import 'package:pregancy/doctor/weidgetes/Dropdownbutton.dart';
import 'package:pregancy/doctor/weidgetes/custom_button.dart';
import 'package:pregancy/doctor2/navigationscreen/LayoutNurse.dart';
import 'package:pregancy/patient/NavgationPatientscreens/LayoutPatient.dart';
import 'package:pregancy/shared_screen/cache_helper.dart';
import 'package:pregancy/shared_screen/login_cubit/login_cubit.dart';
import 'package:pregancy/shared_screen/reset_pass.dart';
import 'package:pregancy/shared_screen/signUp.dart';
import 'package:pregancy/shared_screen/signupscreen.dart';

import '../doctor/constants.dart';
import '../doctor/weidgetes/alert.dart';

import '../unuses/storage/storage_repo_impl.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  static String logid = 'log';
  TextEditingController mypassword = TextEditingController();
  TextEditingController myemail = TextEditingController();

  // var mypassword, myemail;

  String? role;

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  // signIn() async {
  //   var formdata = formstate.currentState;
  //   if (formdata!.validate()) {
  //     formdata.save();
  //     try {
  //       showLoading(context);
  //       UserCredential userCredential = await FirebaseAuth.instance
  //           .signInWithEmailAndPassword(
  //               email: myemail.toString().replaceAll(' ', ''),
  //               password: mypassword.toString().replaceAll(' ', ''));
  //       return userCredential;
  //     } on FirebaseAuthException catch (e) {
  //       if (e.code == 'user-not-found') {
  //         Navigator.of(context).pop();
  //         AwesomeDialog(
  //             context: context,
  //             title: "Error",
  //             body: const Text("No user found for that email"))
  //           ..show();
  //       } else if (e.code == 'wrong-password') {
  //         Navigator.of(context).pop();
  //         AwesomeDialog(
  //             context: context,
  //             title: "Error",
  //             body: const Text("Wrong password provided for that user"))
  //           ..show();
  //       }
  //     }
  //   } else {
  //     print("Not Vaild");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    print('object');
    print(CacheHelper.getData(key: 'Userrole'));
    return Scaffold(
      appBar: AppBar(
        title:  Text('login'.tr()),
        backgroundColor: kprimarycolor,
      ),
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginFail) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage),
            ));
          }
          if (state is LoginSucess) {
            if (CacheHelper.getData(key: 'Userrole') == "doctor") {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  DoctorLayout.homeid, (route) => false);
            } else if (CacheHelper.getData(key: 'Userrole') == "nurse") {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  LayOutNurse.homenursepageid, (route) => false);
            } else if (CacheHelper.getData(key: 'Userrole') == "patient") {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  LayoutPatient.homeid, (route) => false);
            }
            // if (CacheHelper.getData(key: 'type') == "doctor") {
            //   Navigator.of(context)
            //       .pushNamedAndRemoveUntil(DoctorLayout.homeid, (route) => false);
            // } else if (CacheHelper.getData(key: 'type') == "nurse") {
            //   Navigator.of(context).pushNamedAndRemoveUntil(
            //       LayOutNurse.homenursepageid, (route) => false);
            // } else if(CacheHelper.getData(key: 'type') == "patient") {
            //   Navigator.of(context).pushNamedAndRemoveUntil(
            //       LayoutPatient.homeid, (route) => false);
            // }
            // else{
            //    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //     content: Text('sucess'),
            //   ));
            // }
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 200,
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage('assets/images/logo.jpeg'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                      key: formstate,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: myemail,
                            onSaved: (val) {
                              myemail.text = val!;
                            },
                            validator: (val) {
                              if (val == null ||
                                  val.isEmpty ||
                                  !val.contains('@') ||
                                  !val.contains('.')) {
                                return 'invalidemail'.tr();
                              }

                              if (val!.length > 100) {
                                return "Emaillarger".tr();
                              }
                              if (val.length < 2) {
                                return "Emaillsmaller".tr();
                              }
                              return null;
                            },
                            decoration:  InputDecoration(
                                prefixIcon: const Icon(Icons.person),
                                hintText: "email".tr(),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(width: 1))),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: mypassword,
                            onSaved: (val) {
                              mypassword.text = val!;
                            },
                            validator: (val) {
                              if (val!.length > 100) {
                                return "passwordslarger".tr();
                              }
                              if (val.length < 4) {
                                return "passwordsmaller".tr();
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration:  InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                hintText: "password".tr(),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(width: 1))),
                          ),
                          Container(
                              margin: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                   Text("ifyouhavenaccount".tr()),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => signup()));
                                      //Navigator.of(context)
                                      // .pushReplacementNamed('signup');
                                    },
                                    child:  Text(
                                      "clickHere".tr(),
                                      style: const TextStyle(color: Colors.blue),
                                    ),
                                  )
                                ],
                              )),
                          Container(
                              child: MaterialButton(
                            elevation: 5.0,
                            color: kprimarycolor,
                            textColor: Colors.white,
                            onPressed: () {
                              if (formstate.currentState!.validate() == true) {
                                BlocProvider.of<LoginCubit>(context).loginuser(
                                    email: myemail.text,
                                    password: mypassword.text);
                              }
                            },
                            // onPressed: () async {
                            //   var user = await signIn();
                            //   print(user);
                            //   if (user != null) {
                            //     var userdata = await FirebaseFirestore.instance
                            //         .collection('users')
                            //         .get();
                            //     final _docData =
                            //         userdata.docs.map((doc) => doc.data()).toList();
                            //     Map<String, dynamic>? mydata;
                            //     _docData.forEach((element) {
                            //       if (element["email"] == myemail) {
                            //         mydata = element;
                            //       }
                            //     });
                            //     if (mydata != null) {
                            //       StorageRepoImpl().write(
                            //           key: StorageKeys.userdata,
                            //           value: json.encode(mydata));
                            //       globalData.userData = mydata;
                            //
                            //       if (mydata!["type"] == "doctor") {
                            //         Navigator.of(context).pushNamedAndRemoveUntil(
                            //             homepage.homeid, (route) => false);
                            //       } else if (mydata!["type"] == "nurse") {
                            //         Navigator.of(context).pushNamedAndRemoveUntil(
                            //             homepagenurse.homenursepageid,
                            //             (route) => false);
                            //       } else {
                            //         await FirebaseFirestore.instance
                            //             .collection('users')
                            //             .doc('${user.user!.uid}')
                            //             .get()
                            //             .then((value) {
                            //           email = value.get('email');
                            //         });
                            //
                            //         Navigator.of(context).pushNamedAndRemoveUntil(
                            //             homePatient.homeid, (route) => false);
                            //       }
                            //     }
                            //   }
                            // },
                            child: Text(
                              "login".tr(),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          )),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const reset()));
                              },
                              child:  Text(
                                "resetpassword".tr(),
                                style: TextStyle(
                                    color: kprimarycolor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          // custoumbutton(
                          //   text: 'tab',
                          //   onTap: (() {
                          //     BlocProvider.of<PregancyformCubit>(context)
                          //         .fetchuseres();
                          //   }),
                          // ),
                        ],
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
