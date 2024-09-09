import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/core/core.dart';
import 'package:pregancy/doctor/constants.dart';
import 'package:pregancy/doctor/cubit/pregancyform_cubit/pregancyform_cubit.dart';
import 'package:pregancy/doctor/weidgetes/Dropdownbutton.dart';
import 'package:pregancy/doctor/weidgetes/custom_button.dart';
import 'package:pregancy/shared_screen/loginScreen.dart';
import 'package:pregancy/shared_screen/signup_cubit/signup_cubit.dart';
import 'package:pregancy/doctor2/navigationscreen/LayoutNurse.dart';
import '../patient/weidgetes/alert.dart';
import 'package:intl/intl.dart';
import 'package:pregancy/patient/NavgationPatientscreens/LayoutPatient.dart';
import 'package:pregancy/doctor/screens/DoctorLayout.dart';

class signup extends StatefulWidget {
  signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  //
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  // DateTime date = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<PregancyformCubit>(context).fetchNurses();
    super.initState();
  }
  @override
  void dispose() {


    super.dispose();
  }
  Widget build(BuildContext context) {

    var Cubit = BlocProvider.of<RegisterCubit>(context);
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is Registerfail) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage),
            ));
          }
          if (state is Registersucess) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  Login.logid, (route) => false);
            // if (Cubit.type == "doctor") {
            //   Navigator.of(context).pushNamedAndRemoveUntil(
            //       DoctorLayout.homeid, (route) => false);
            // } else if (Cubit.type == "nurse") {
            //   Navigator.of(context).pushNamedAndRemoveUntil(
            //       LayOutNurse.homenursepageid, (route) => false);
            // } else {
            //   Navigator.of(context).pushNamedAndRemoveUntil(
            //       LayoutPatient.homeid, (route) => false);
            // }
          }
        },
        builder: (context, state) {
          return ListView(
            children: [
              TextButton(
                  onPressed: () {
                    Cubit.type = "doctor";

                    Cubit.ChangeState();
                  },
                  child: Container(
                    color: Cubit.type == "doctor" ? Colors.pink.shade100 : null,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 8),
                      child: Text(
                        'nurse'.tr(),
                        style: TextStyle(
                          color: Cubit.type == "doctor" ? Colors.white : null,
                        ),
                      ),
                    ),
                  )),
              TextButton(
                  onPressed: () {
                    Cubit.type = "nurse";
                    Cubit.ChangeState();
                  },
                  child: Container(
                    color: Cubit.type == "nurse" ? Colors.pink.shade100 : null,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 8),
                      child: Text(
                        'doctor'.tr(),
                        style: TextStyle(
                          color: Cubit.type == "nurse" ? Colors.white : null,
                        ),
                      ),
                    ),
                  )),
              TextButton(
                  onPressed: () {
                    Cubit.type = "patient";
                    Cubit.ChangeState();
                  },
                  child: Container(
                    color:
                        Cubit.type == "patient" ? Colors.pink.shade100 : null,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 8),
                      child: Text(
                        'patient'.tr(),
                        style: TextStyle(
                          color: Cubit.type == "patient" ? Colors.white : null,
                        ),
                      ),
                    ),
                  )),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                child: Form(
                    key: formstate,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: Cubit.myusername,
                          onSaved: (val) {
                            Cubit.myusername.text = val!;
                            Cubit.ChangeState();
                          },
                          validator: (val) {
                            if (val!.length > 100) {
                              return "usernamesmaller".tr();
                            }
                            if (val.length < 2) {
                              return "usernamelarger".tr();
                            }
                            return null;
                          },
                          decoration:  InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              hintText: "username".tr(),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(width: 1))),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: Cubit.Age,
                          readOnly: true,
                          onTap: () async {
                            Cubit.newDate = (await showDatePicker(
                              context: context,
                              initialDate: Cubit.date,
                              firstDate: DateTime(1980),
                              lastDate: DateTime(21000),
                            ))!;
                            if (Cubit.newDate == null) {
                              return;
                            }
                            Cubit.date = Cubit.newDate;
                            Cubit.Age.value = TextEditingValue(
                                text: dateTimee(Cubit.newDate));
                            Cubit.ChangeState();
                          },
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "BirthDateisrequired".tr();
                            }
                            return null;
                          },
                          decoration:  InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              hintText: "birthDate".tr(),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(width: 1))),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: Cubit.myemail,
                          onSaved: (val) {
                            Cubit.myemail.text = val!;
                            Cubit.ChangeState();
                          },
                          validator: (val) {
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
                          controller: Cubit.mypassword,
                          onSaved: (val) {
                            Cubit.mypassword.text = val!;
                          },
                          validator: (val) {
                            if (val!.length > 100) {
                              return "passwordslarger".tr();
                            }
                            if (val.length < 6) {
                              return "passwordsmaller".tr();
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration:  InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              hintText: "password".tr(),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(width: 1))),
                        ),
                        const SizedBox(height: 20),
                        if (Cubit.type == "patient")
                          TextFormField(
                            controller: Cubit.lastPeriod,
                            readOnly: true,
                            onTap: () async {
                              Cubit.lastPeriodnewDate = (await showDatePicker(
                                context: context,
                                initialDate: Cubit.date,
                                firstDate: DateTime(1980),
                                lastDate: DateTime(21000),
                              ))!;
                              if (Cubit.lastPeriodnewDate == null) {
                                return;
                              }
                              Cubit.lastPerioddate = Cubit.lastPeriodnewDate;
                              Cubit.lastPeriod.value = TextEditingValue(
                                  text: dateTimee(Cubit.lastPeriodnewDate));
                              Cubit.ChangeState();
                            },
                            //obscureText: true,
                            decoration:  InputDecoration(
                                prefixIcon: const Icon(Icons.person),
                                hintText: "LastPeriod".tr(),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(width: 1))),
                          ),
                        // if (Cubit.type == 'nurse')
                        //   Dropdownbuttonformfield4(
                        //       text: 'Nurse',
                        //
                        //       onchanged: (value) {
                        //         print('user');
                        //         print(user);
                        //
                        //         user = value;
                        //         print(user);
                        //         // Cubit.ChangeState();
                        //       },
                        //     fieldvalue: user,),
                        // custoumbutton(
                        //   text: 'tab',
                        //   onTap: (() {
                        //     BlocProvider.of<PregancyformCubit>(context)
                        //         .fetchNurses();
                        //   }),
                        // ),
                        Container(
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                 Text("ifyouhavenaccount".tr()),
                                InkWell(
                                  onTap: () {
                                    BlocProvider.of<RegisterCubit>(context).myusername.clear();
                                    BlocProvider.of<RegisterCubit>(context).lastPeriod.clear();
                                    BlocProvider.of<RegisterCubit>(context).myemail.clear();
                                    BlocProvider.of<RegisterCubit>(context).mypassword.clear();
                                    BlocProvider.of<RegisterCubit>(context).Age.clear();
                                    BlocProvider.of<RegisterCubit>(context).DelvierTime.clear();
                                    Navigator.of(context).pushNamed("log");

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
                          onPressed: () {
                            if (formstate.currentState!.validate() == true) {
                              // UserCredential? response = await signUp();
                              Cubit.createuser(
                                  email: Cubit.myemail.text,
                                  password: Cubit.mypassword.text).then((value) {

                              });

                            }
                          },
                          color: kprimarycolor,
                          child: Text(
                            "signup".tr(),
                            // style: Colors.white,
                          ),
                        ))
                      ],
                    )),
              )
            ],
          );
        },
      ),
    );
  }
}
