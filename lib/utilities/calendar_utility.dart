import 'package:intl/intl.dart';

class CalendarUtility {
  static final DateFormat _monthFormat = new DateFormat("MMMM, yyyy");
  static String formatMonth(DateTime d) => _monthFormat.format(d);

  static List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
}