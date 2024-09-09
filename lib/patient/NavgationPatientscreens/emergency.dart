// import 'package:flutter/material.dart';
// import 'package:pregancy/patient/screens/gyms.dart';
// import 'package:pregancy/patient/screens/hospitalis.dart';
// import 'package:pregancy/patient/screens/pharmices.dart';

// import '../weidgetes/recomendation_container.dart';

// class recomendation extends StatelessWidget {
//   static String recomendatiomnid = 'recomendation';
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 30),
//       child: Column(
//         children: [
//           RecContanier(
//             onTap: () {
//               Navigator.pushNamed(context, hospitalis.hospitalisid);
//             },
//             text: 'Hospitals',
//           ),
//           RecContanier(
//             onTap: () {
//               Navigator.pushNamed(context, gyms.gymsid);
//             },
//             text: 'Gym',
//           ),
//           RecContanier(
//             onTap: () {
//               Navigator.pushNamed(context, pharmicies.pharmiciesid);
//             },
//             text: 'Pharmacies',
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../constants.dart';
import '../models/maps.dart';

class emergency extends StatefulWidget {
  static String emergencyid = 'emergency';

  @override
  State<emergency> createState() => _emergencyState();
}

class _emergencyState extends State<emergency> {
  String? _currentAddress;
  Position? _currentPosition;
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          content: Text(
              'locationservices'.tr())));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text('Locationpermissions'.tr())));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          content: Text(
              'Locationpermissionspermanently'.tr())));
      return false;
    }
    return true;
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      // _getAddressFromLatLng(_currentPosition!);
    });
    // .catchError((e) {
    //   debugPrint(e);
    // });
  }

  @override
  void initState() {
    getCurrentPosition();
    super.initState();
  }
  @override
  void dispose() {
    // Clean up resources
    _currentPosition = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(
          //   title: Text('Emergency'),
          // ),
          body: Center(
        child: Container(
            child: TextButton(
          style: TextButton.styleFrom(backgroundColor: kprimarycolor),
          onPressed: () {
            Future.delayed(Duration(seconds: 1), () {
              MapsUtils.openmap(
                  _currentPosition!.latitude, _currentPosition!.longitude);
            });
          },
          child: Text(
            'opengooglemaps'.tr(),
            style: TextStyle(color: Colors.white),
          ),
        )),
      )),
    );
  }
}
