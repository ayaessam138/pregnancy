import 'package:flutter/material.dart';

class profileimage extends StatelessWidget {
  const profileimage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Colors.grey,
        child: Icon(
          Icons.person,
          color: Colors.white,
          size: 60,
        ),
      ),
    );
  }
}
