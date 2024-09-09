import 'package:flutter/material.dart';

import '../constants.dart';

class periodofpregancy extends StatelessWidget {
  const periodofpregancy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: AlignmentDirectional.centerEnd,
        height: 200,
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  '60',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  width: 65,
                ),
                Text(
                  '8',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  width: 65,
                ),
                Text(
                  '2',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  'day',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  'week',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  'month',
                  style: TextStyle(fontSize: 17),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
