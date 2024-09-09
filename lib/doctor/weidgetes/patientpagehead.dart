import 'package:flutter/material.dart';

import '../constants.dart';

class patientheadoage extends StatelessWidget {
  const patientheadoage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Patient ID',
              style: TextStyle(color: kprimarycolor),
            ),
            Text(
              'Patient Name',
              style: TextStyle(color: kprimarycolor),
            ),
            Text(
              'Assesment',
              style: TextStyle(color: kprimarycolor),
            ),
            Text(
              'Delete',
              style: TextStyle(color: kprimarycolor),
            ),
          ],
        ),
      ),
    );
  }
}
