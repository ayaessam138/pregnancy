import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pregancy/doctor/constants.dart';
import 'package:pregancy/doctor/screens/about_app_screen.dart';
import 'package:pregancy/doctor2/navigationscreen/aboutapp.dart';

class aboutappnurse extends StatelessWidget {
  const aboutappnurse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.settings_input_svideo_outlined,
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return aboutapp();
                }));
              },
              child: Text(
                'aboutapp'.tr(),
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
