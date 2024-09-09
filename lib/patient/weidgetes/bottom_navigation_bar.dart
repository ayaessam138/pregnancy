import 'package:flutter/material.dart';

import '../constants.dart';

class Botoomvagationbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(color: kprimarycolor),
      unselectedItemColor: Colors.black,
      selectedItemColor: kprimarycolor,
      unselectedLabelStyle: TextStyle(color: Colors.black),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            label: 'Home', icon: Icon(Icons.home, color: kprimarycolor)),
        BottomNavigationBarItem(
          label: 'Calender',
          icon: Icon(Icons.calendar_view_day_rounded, color: kprimarycolor),
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          label: 'Predection',
          icon: Icon(Icons.warning, color: kprimarycolor),
        ),
        BottomNavigationBarItem(
          label: 'Recomendations',
          icon: Icon(Icons.recommend, color: kprimarycolor),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(Icons.person, color: kprimarycolor),
        ),
      ],
    );
  }
}
