import 'package:url_launcher/url_launcher.dart';

class MapsUtils {
  MapsUtils._();
  static Future<void> openmap(
    double latitude,
    double longitude,
  ) async {
    String gogmapurl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
    if (await canLaunch(gogmapurl)) {
      await launch(gogmapurl);
    } else {
      throw 'Could Not Open The Map';
    }
  }
}
