import 'package:flutter/material.dart';

class lastperiodprofile extends StatelessWidget {
  const lastperiodprofile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.calendar_month_outlined,
          color: Color(0xffE57A7A),
          size: 35,
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            height: 50,
            alignment: AlignmentDirectional.center,
            child: Text(
              'last period',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        SizedBox(
          width: 170,
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_drop_down_sharp,
              size: 33,
              color: Colors.grey,
            ))
      ],
    );
  }
}
