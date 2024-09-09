import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pregancy/doctor/constants.dart';
import 'package:pregancy/shared_screen/change_profile_screen.dart';



class changeprofile extends StatelessWidget {
  static String changeprofileid = 'changeprofile';
  const changeprofile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.edit_note_rounded,
          color: kprimarycolor,
          size: 35,
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            height: 50,
            alignment: AlignmentDirectional.centerStart,
            child: MaterialButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, ChangePatientProfile.ChangePatientProfileid);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (BuildContext context) {
                //   return ChangeDoctorProfile();
                // }));
              },
              child:  Text(
                'changeprofile'.tr(),
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
