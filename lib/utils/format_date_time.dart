import 'package:intl/intl.dart';

extension FormatStringToDateTime on String {
  DateTime get formatDateToString {
    final dateFormat = DateFormat('dd-MM-yyyy');
    return dateFormat.parse(this);
  }
}

extension FormatDateTimeToString on DateTime {
  String get formatStringToDate {
    final dateFormat = DateFormat('dd-MM-yyyy');
    return dateFormat.format(this);
  }
}
