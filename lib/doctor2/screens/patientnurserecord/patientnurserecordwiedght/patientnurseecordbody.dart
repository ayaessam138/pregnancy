import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pregancy/doctor2/models/predectionpatientbynurse.dart';
import 'package:pregancy/doctor2/screens/patientnurserecord/patientnursesubrecord.dart';


import '../../../constant.dart';

class patientnurserecordbody extends StatefulWidget {
  patientnurserecordbody({
    super.key,
    required this.predection,
  });
  final predectionpatientbynursemodel predection;

  @override
  State<patientnurserecordbody> createState() => _patientnurserecordbodyState();
}

class _patientnurserecordbodyState extends State<patientnurserecordbody> {
  // final String id;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.pushNamed(
                context, patientnursesubrecord.patientnursesubrecordid,
                arguments: widget.predection);
          },
          leading: Image.asset('assets/images/patientassesment.png'),
          title: Text(
            'name'.tr(),
            style: const TextStyle(
                color: kprimarycolor, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(widget.predection.name!, style: TextStyle()),
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
