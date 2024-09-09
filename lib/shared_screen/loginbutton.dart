import 'package:flutter/material.dart';

import '../doctor/constants.dart';

class loginbutoon extends StatelessWidget {
  const loginbutoon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialButton(
      elevation: 5.0,
      color: kprimarycolor,
      textColor: Colors.white,
      onPressed: () {},
      child: Text(
        "Login",
        style: Theme.of(context).textTheme.titleMedium,
      ),
    ));
  }
}
