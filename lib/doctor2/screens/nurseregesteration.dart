import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/doctor/constants.dart';
import 'package:pregancy/doctor/weidgetes/custom_button.dart';
import 'package:pregancy/doctor2/cubit/nurseregesteration_cubit/cubit/nurseregesteration_cubit.dart';
import 'package:pregancy/doctor2/weidgets/nurseregisteration.dart';

import 'package:pregancy/shared_screen/cache_helper.dart';
import '../../core/globalData.dart';
import '../../doctor/weidgetes/alert.dart';
import '../../doctor/weidgetes/subtitleofpregancyform.dart';

class nurseregesterations extends StatelessWidget {
  static String nurseregesterationsid = 'nurseregesterations';

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // var Cubit = BlocProvider.of<NurseregesterationCubit>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
            'reservationregister'.tr()),
        backgroundColor: kprimarycolor,
      ),
      body: BlocProvider(
        create: (context) =>NurseregesterationCubit ()..getnursedata(),
        child: BlocConsumer<NurseregesterationCubit, NurseregesterationState>(
          listener: (BuildContext context, NurseregesterationState state) {
            if (state is GetNurseDataloading) {
              const Center(child: CircularProgressIndicator());
            }
            if (state is addNurseRegistrationSucess) {
            Navigator.pop(context);
            }
            if (state is GetNurseDataFail) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.Message)));
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Subtitleofpregnacyform(title: 'profile'.tr()),

                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: BlocProvider.of<NurseregesterationCubit>(context).universityController??TextEditingController(),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'fieldrequired'.tr();
                            }


                          },
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.cast_for_education),
                              hintText:
                                  'univercity'.tr(),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(width: 1))),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller:BlocProvider.of<NurseregesterationCubit>(context).graduationYearController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'fieldrequired'.tr();
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.cast_for_education),
                              hintText: 'yearofGraduation'.tr(),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(width: 1))),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller:BlocProvider.of<NurseregesterationCubit>(context).clinicLocationController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'fieldrequired'.tr();
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.location_city),
                              hintText: 'locationofclinc'.tr(),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(width: 1))),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: BlocProvider.of<NurseregesterationCubit>(context).ticketPriceController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'fieldrequired'.tr();
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.cast_for_education),
                              hintText:'ticketprice'.tr(),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(width: 1))),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        //       DropdownButton<String>(
                        //         isExpanded: true,
                        //         value: dropdownValue,
                        //         items:<String> ['Saturday','Sunday','Monday','Tuesday','Wednesday','Thursday','Friday'].map<DropdownMenuItem<String>>(
                        //             (String value){
                        //               return DropdownMenuItem<String>(
                        //                   value: value,
                        //                   child: Text(
                        //                     value
                        //                   ),
                        //               );
                        //
                        //             }).toList(),
                        //           onChanged: (String? newValue){
                        //           if(newValue!=dropdownValue|| newValue==dropdownValue){
                        //             Navigator.push(context, MaterialPageRoute(builder: (context)=>doctor_appointments()));
                        //           }
                        //           setState(() {
                        //             dropdownValue=newValue!;
                        //           });
                        // },
                        //         ),
                        MaterialButton(
                            child: Text(
                                'submit'.tr()),
                            textColor: Colors.white,
                            color: kprimarycolor,
                            onPressed: () {
                              BlocProvider.of<NurseregesterationCubit>(context).addNurseRegistration();
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=>doctor_appointments()));

                            })
                      ],
                    ),
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
