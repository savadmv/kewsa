import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String get ddMMYYYY => DateFormat('dd-MM-yyyy').format(this);
  String get yyyyMM => DateFormat('yyyy-MM').format(this);
}
