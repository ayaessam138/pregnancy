import 'package:intl/intl.dart';

String dateTimeFormat(String date) {
  final f = new DateFormat('hh:mm');
  return f.format(DateTime.parse(date));
}
