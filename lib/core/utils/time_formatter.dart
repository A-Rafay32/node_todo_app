import 'package:intl/intl.dart';

String formatTime(String dateTimeStr) {
  DateTime dateTime = DateTime.parse(dateTimeStr);
  String formattedTime = DateFormat('yyyy-MM-dd h:mm a').format(dateTime);
  return formattedTime;
}
