import 'package:intl/intl.dart';

String dateTimeFormat(String date) {
  final f = new DateFormat('hh:mm');
  return f.format(DateTime.parse(date));
}

String getToDayName() {
  final f = new DateFormat('EEEE');
  return f.format(DateTime.now()).toLowerCase();
}

String dateTimee(DateTime date) {
  return (DateFormat.yMd().format(date));
}
