import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/doctor/cubit/pregancyform_cubit/pregancyform_cubit.dart';
import 'package:pregancy/doctor/housescrrens/patientrecord/patientsubrecord.dart';
import 'package:pregancy/doctor/models/pregnancyform.dart';

import 'package:pregancy/patient/cubit/cubit/predection_patient_cubit.dart';
import 'package:pregancy/patient/models/predectionpatient.dart';
import 'package:pregancy/patient/NavgationPatientscreens/PredictionPatient.dart';

import '../../constants.dart';

// class patientrecordbody extends StatelessWidget {
//   patientrecordbody({required this.pregancy});
//   final pregancyformmodel pregancy;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.pushNamed(context, patientsubrecord.patientsubrecordid,
//             arguments: pregancy);
//       },
//       child: Container(
//         decoration: BoxDecoration(border: Border.all(color: kprimarycolor)),
//         child: Row(
//           children: [
//             Expanded(
//               child: Text(
//                 pregancy.id!,
//                 style: TextStyle(color: kprimarycolor),
//               ),
//             ),
//             Expanded(
//                 child: Text(pregancy.name!,
//                     style: TextStyle(color: kprimarycolor))),
//             Expanded(
//               child: IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.delete,
//                     color: kprimarycolor,
//                   )),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
class patientrecordbody extends StatelessWidget {
  patientrecordbody({
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
            Navigator.pushNamed(context, patientsubrecord.patientsubrecordid,
                arguments: pregancy);
          },
          leading: Image.asset('assets/images/patientassesment.png'),
          title: Text(
            'name'.tr(),
            style: const TextStyle(
                color: kprimarycolor, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(pregancy.name!, style: TextStyle()),
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
  }
}
