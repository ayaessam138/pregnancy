import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/doctor/housescrrens/patientassesment/patientdata.dart';
import 'package:pregancy/doctor/housescrrens/patientassesment/updatepatientdata.dart';
import 'package:pregancy/doctor/models/pregnancyform.dart';

import '../../../patient/constants.dart';
import '../../cubit/pregancyform_cubit/pregancyform_cubit.dart';

class patientcontainer extends StatelessWidget {
  patientcontainer({
    super.key,
    required this.pregancy,
  });
  final pregancyformmodel pregancy;
  // final String id;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, patientdata.patientdataid,
                arguments: pregancy);
          },
          leading: Image.asset('assets/images/patientassesment.png'),
          title:  Text(
            'name'.tr(),
            style: const TextStyle(color: kprimarycolor, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(pregancy.name!, style: const TextStyle()),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, pregancyformupdate.pregancyformupdateid,
                          arguments: pregancy);
                    },
                    icon: const Icon(Icons.edit, color: kprimarycolor)),
              ),
              Expanded(
                child: IconButton(
                    onPressed: () async {
                      BlocProvider.of<PregancyformCubit>(context)
                          .deletepatient(id: pregancy.docid!);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: kprimarycolor,
                    )),
              ),
            ],
          ),
        ),
        const Divider(
          color: Color.fromARGB(255, 215, 212, 212), //color of divider
          height: 0.5, //height spacing of divider
          thickness: 0.5, //thickness of divier line
          indent: 25, //spacing at the start of divider
          endIndent: 25, //spacing at the end of divider
        )
      ],
    );

    // Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Column(
    //     children: [
    //       GestureDetector(
    //         onTap: () {
    //           Navigator.pushNamed(context, patientdata.patientdataid,
    //               arguments: pregancy);
    //         },
    //         child: Container(
    //           height: (MediaQuery.of(context).size.height / 6),
    //           width: double.infinity,
    //           decoration: BoxDecoration(
    //             border: Border.all(color: kprimarycolor),
    //             color: Colors.white,
    //             // borderRadius: BorderRadius.circular(30)
    //           ),
    //           child: Row(
    //             children: [
    //               Column(
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.all(3),
    //                     child: Text(
    //                       'Patient Assesment',
    //                       style: TextStyle(
    //                           color: kprimarycolor,
    //                           fontWeight: FontWeight.bold,
    //                           fontSize: 12),
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 10,
    //                   ),
    //                   Text(
    //                     'Name:' + pregancy.name!,
    //                     style: TextStyle(color: kprimarycolor),
    //                   ),
    //                 ],
    //               ),
    //               SizedBox(
    //                 width: 180,
    //               ),
    //               Column(
    //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                 children: [
    //                   IconButton(
    //                       onPressed: () {
    //                         Navigator.pushNamed(context,
    //                             pregancyformupdate.pregancyformupdateid,
    //                             arguments: pregancy);
    //                       },
    //                       icon: Icon(Icons.edit, color: kprimarycolor)),
    //                   IconButton(
    //                       onPressed: () async {
    //                         BlocProvider.of<PregancyformCubit>(context)
    //                             .deletepatient(id: pregancy.docid!);
    //                       },
    //                       icon: Icon(
    //                         Icons.delete,
    //                         color: kprimarycolor,
    //                       )),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
