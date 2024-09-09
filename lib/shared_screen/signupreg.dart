import 'package:flutter/material.dart';
// import 'package:pregancy/shared_screen/signUp.dart';

class signup extends StatelessWidget {
  const signup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            Text("if you havan't accout "),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => signup()));
              },
              child: Text(
                "Click Here",
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ));
  }
}
