import 'package:flutter/material.dart';

import '../doctor/constants.dart';

class reset extends StatelessWidget {
  const reset({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => reset()));
        },
        child: Text(
          "Reset Password",
          style: TextStyle(color: kprimarycolor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
